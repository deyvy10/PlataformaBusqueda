<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Ver Imágenes</title>
</head>
<body>
             <h2><center>IMÁGENES</center></h3>
             <br>
             <?php 

             	include 'conexion_mysql.php';
             	$sql=$mysqli->query("SELECT imagen_nombre FROM imagen where nombre='Raraware'");

             	while ($row= $sql->fetch_array(MYSQLI_ASSOC)) {
             	
             			$img="<div id='imagen'><img src='". $row['imagen_nombre'] ."' width='200px' height='200px'/></div>";
             			echo $img;

             	}

              ?>
</body>
</html>