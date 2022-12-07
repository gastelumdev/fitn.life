<?php
try {
	error_reporting (E_ALL ^ E_NOTICE);
	include __DIR__ . '/../includes/autoload.php';
	
	$route = ltrim(strtok($_SERVER['REQUEST_URI'], '?'), '/');
	
	//****************************JG  5/24/18 NEW line 8 - 30 ADAPTER *******************************
	   //5/22/18 JG NEW4l: adapter to the code b/c of the .htaccess is ignored by apache
	if ($route == ltrim($_SERVER['REQUEST_URI'],  '/') ) 
	    $route = '';  //JG  5/21/18 NEW replaces by ''	    
	else
		$route = $_SERVER['QUERY_STRING']; //5/22/18 JG NEW1l: give the query = remaining string
	
	  //5/22/18 JG NEW6l: adapter to the code b/c of the .htaccess is ignored by apache
	if (strlen(strtok($route, '?')) <  strlen($route))  // string has additional ?
	{ 
		$_GET['id'] = substr ($route, strlen(strtok($route, '?')) + 4, strlen($route)); 
		$route = strtok($route, '?'); //retrieve the string between ? ? - for e.g. index?joke/edit?id=12
	}
	//****************************END OF JG  5/24/18 NEW line 8 - 30 ********************************	

	// echo $route;
	// echo $_SERVER['REQUEST_METHOD'];
	$entryPoint = new \Ninja\EntryPoint($route, $_SERVER['REQUEST_METHOD'], new \Fitin\FitinRoutes());
	$entryPoint->run();
}
catch (PDOException $e) {
	$title = 'An error has occurred';

	$output = 'Database error: ' . $e->getMessage() . ' in ' .
	$e->getFile() . ':' . $e->getLine();

	include  __DIR__ . '/../templates/layout.html.php';
}