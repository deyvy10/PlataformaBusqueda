<?php 
	include'conexion_mysql.php';

	if (isset($_POST['submit'])) {

		for ($i=0; $i<count($_FILES['image']['name']) ; $i++) { 
		
			
		
		$name=$_POST['name'];
		$img=$_FILES['image']['name'][$i];
		$ruta="Fotos/$name/".$img;

		$sql="INSERT INTO imagen(nombre,imagen_nombre) VALUES('$name','$ruta')";


		if ($sql) {


			if (is_dir("Fotos/".$name)&& $i==0) {

				echo "<script>alert('Esta Carpeta ya Existe')</script>";
				break;
			}


			if (!is_dir("Fotos/".$name) && $i==0) {
			
			$insertar=$mysqli->query($sql);
			mkdir("Fotos/".$name);
			move_uploaded_file($_FILES['image']['tmp_name'][$i], "Fotos/$name/$img");
			echo "<script>alert('Imagen Cargada con éxito')</script>";
			}


			if (is_dir("Fotos/".$name) && $i!=0) {

				$insertar=$mysqli->query($sql);
				move_uploaded_file($_FILES['image']['tmp_name'][$i], "Fotos/$name/$img");
					
				}	

		}

		else{
			echo "<script>alert('No se pudo cargar la imagen')</script>";	
				}
	
	}
}

 ?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Subir Varias Imágenes</title>
</head>
<body>

	<form action="index.php" method="post" enctype="multipart/form-data">
		<label>Nombre</label>
		<input type="text" name="name">
		<br>
		<label>Seleccionar Imágenes</label>
		<input type="file" name="image[]" multiple>

		<input type="submit" name="submit" value="Subir la imagen">
	</form>
	
</body>
</html>