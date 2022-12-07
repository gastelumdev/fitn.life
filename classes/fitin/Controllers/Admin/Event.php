<?php
    namespace Fitin\Controllers\Admin;

    use Ninja\DatabaseTable;
    use \Ninja\Authentication;

    class Event {
        public function __construct(DatabaseTable $eventsTable, DatabaseTable $groupsTable, DatabaseTable $usersTable, Authentication $authentication) {
            $this->eventsTable = $eventsTable;
            $this->groupsTable = $groupsTable;
            $this->usersTable = $usersTable;
            $this->authentication = $authentication;
        }

        public function list() {
            $results = $this->eventsTable->findAll();
            $activeUser = $this->authentication->getUser();
            $totalEvents = 0;

            $events = [];
            foreach ($results as $event) {
                $group = $this->groupsTable->findById($event['groupId']);
                $user = $this->usersTable->findById($group['userId']);


                $events[] = [
                    'id' => $event['id'],
                    'name' => $event['name'],
                    'description' => $event['description'],
                    'date' => $event['date'],
                    'userId' => $event['userId'],
                    'group_name' => $group['name'],
                    'creator' => $user['firstname'] .' '. $user['lastname']
                ];

                // 5/23/21 OG NEW - Count the events that belong to the active user
                if ($activeUser['id'] == $event['userId']) {
                    $totalEvents++;
                }
            }

            $title = 'Events';

            if ($activeUser['permissions'] > 2) {
                $totalEvents = $this->eventsTable->total();
            }

            $groups = $this->groupsTable->find('userId', $activeUser['id']);

            return ['template' => 'admin_events.html.php', 
                    'title' => $title, 
                    'variables' => [
                            'totalEvents' => $totalEvents,
                            'events' => $events,
                            'groups' => $groups,
                            'userId' => $activeUser['id'] ?? null,
                            'permissions' => $activeUser['permissions'] ?? null,
                            'loggedIn' => $this->authentication->isLoggedIn()
                        ]
                    ];
        }

        public function showForm() {
            $user = $this->authentication->getUser();

            $groups = $this->groupsTable->find('userId', $user['id']);

            $title = 'Create Event';
            return ['template' => 'editevent.html.php',
                    'title' => $title,
                    'variables' => [
                        'userId' => $user['id'] ?? null,
                        'groups' => $groups,
                        'permissions' => $user['permissions'] ?? null,
                        'loggedIn' => $this->authentication->isLoggedIn()
                    ]
            ];  
        }

        public function saveEdit() {
            $activeUser = $this->authentication->getUser();
    
            if (isset($_GET['id'])) {
                $event = $this->eventsTable->findById($_GET['id']);
    
                if ($event['userId'] != $activeUser['id']) {
                    return;
                }
            }
    
            $event = $_POST;
            $event['date'] = $event['date'] . ' ' . $event['time'];
            unset($event['time']);
            $event['userId'] = $activeUser['id'];
    
            $this->eventsTable->save($event);

            $result = $this->eventsTable->findAll();
            $events = [];

            foreach ($result as $event) {
                $group = $this->groupsTable->findById($event['groupId']);
                $user = $this->usersTable->findById($group['userId']);

                $events[] = [
                    'id' => $event['id'],
                    'name' => $event['name'],
                    'description' => $event['description'],
                    'date' => $event['date'],
                    'userId' => $event['userId'],
                    'group_name' => $group['name'],
                    'creator' => $user['firstname'] .' '. $user['lastname']
                ];
            }

            $json = json_encode($events);
            return $json; 
        }

        public function edit() {
            $updated = [
                'id' => $_POST['id'],
                $_POST['field'] => $_POST['value']
            ];
    
            $this->eventsTable->save($updated);
        }

        public function delete() {
            // 5/23/21 OG NEW - Get active user
            $activeUser = $this->authentication->getUser();
            // 5/23/21 OG NEW - Find the event that needs to be deleted
            $event = $this->eventsTable->findById($_POST['id']);
            // 5/23/21 OG NEW - If the active user is not the creator and does not have rights then do not proceed to delete
            if ($event['userId'] != $activeUser['id'] && $activeUser['permissions'] < 3) {
                return;
            }
            
            // 5/23/21 OG NEW - else delete the event and redirect to admin events page
            $this->eventsTable->delete($_POST['id']);
            header('location: index.php?admin/events');  // 5/25/18 JG NEW1L  		
        }
    }