<?php
	$host_db = "localhost";
 $user_db = "deyvy10";
 $pass_db = "humberto10";
 $db_name = "imagenes";
	
$mysqli =  new mysqli($host_db, $user_db, $pass_db, $db_name);
$mysqli->set_charset("utf8");
 if ($mysqli->connect_error) {
 die("La conexion falló: " . $mysqli->connect_error);
}

?>
