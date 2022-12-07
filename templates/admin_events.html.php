<section id="body">
    <div class="container">
        <input type="hidden" name="type" id="type" value="event">
        <h1>Events</h1>
        <!-- 5/23/21 OG NEW - Display the number of groups calculated in the controller -->
        <p>Total events created: <?=$totalEvents?>
        <!-- 5/23/21 OG NEW - if the user has author rights then display the create group button -->
        <?php if ($loggedIn && $permissions >= 2): ?>
            <table class="table table-sm table-striped table-hover">
            <thead>
                <tr>
                    <th scope="col">Action</th>
                    <th scope="col">Name</th>
                    <th scope="col">description</th>
                    <th scope="col">Group</th>
                    <th scope="col">Event Date</th>
                    <th scope="col">Event Time</th>
                </tr>
            </thead>
            <tbody id="createTable">
                <tr>
                    <td scope="row"><button id="create" class="createBtn btn btn-primary btn-sm">Save</button></td>
                    <td scope="row"><input id="name" type="text" class="form-control"></td>
                    <td scope="row"><input id="description" type="text" class="form-control"></td>
                    <td><select id="groupId" class="form-control" id="exampleFormControlSelect1" name="event[groupId]">
                    <option>Choose a group:</option>
                        <?php foreach ($groups as $group): ?>
                            <option value="<?=$group['id']?>"><?=$group['name']?></option>
                        <?php endforeach; ?>
                    </select></td>
                    <td><input type="date" id="date" name="event[date]" class="form-control"></td>
                    <td><input type="time" id="time" name="event[time]" class="form-control"></td>
                </tr>
            </tbody>
            </table>
        <?php endif; ?>
        <!-- 5/23/21 OG NEW - If the total amount of groups is greater than 0, display the table -->
        <?php if ($totalEvents >= 0): ?>
            <table class="table table-sm table-striped table-hover">
            <thead id="tableHead">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Action</th>
                    <th scope="col" class="editable"><div id="name">Name</div></th>
                    <th scope="col" class="editable"><div id="description">description</div></th>
                    <th scope="col"><div id="group_name">Group</div></th>
                    <th scope="col"><div id="creator">Created By</div></th>
                    <th scope="col"><div id="date">Event Date</div></th>
                </tr>
            </thead>
            <tbody id="tableBody">
                <!-- 5/23/21 OG NEW - For each group -->
                <?php foreach($events as $event): ?>
                    <!-- 5/23/21 OG NEW - If user has admin rights, display all groups else only show only those that they created -->
                    <?php if (($permissions > 2 || $loggedIn && $userId == $event['userId'])): ?>
                        <tr>
                        <td scope="row"><?=$event['id']?></td>
                        <td scope="row"><button id="deleteBtn-<?=$event['id']?>" class="deleteBtn btn btn-danger btn-sm">Delete</button></td>
                        <td class="editable"><div contenteditable="true" class="edit" id="name-<?=$event['id']?>"><?=$event['name']?></div></td>
                        <td class="editable"><div contenteditable="true" class="edit" id="description-<?=$event['id']?>"><?=$event['description']?></div></th>
                        <td><div id="group_name"><?=$event['group_name']?></div></th>
                        <td><div id="creator"><?=$event['creator']?></div></th>
                        <td><div id="date"><?=$event['date']?></div></td>
                        </tr>
                    <?php endif; ?>
                <?php endforeach; ?>
            </tbody>
            </table>
        <?php endif; ?>
    </div>
</section>