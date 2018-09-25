<?php 
	include 'conexion_mysql.php';

	if (isset($_POST['enviar'])) {

		$nombre=$_POST["nombre"];
		$rtn=$_POST["rtn"];
		$descripcion=$_POST["descripcion"];
		$direccion=$_POST["direccion"];
		$correo=$_POST["correo"];
		$horario=$_POST["horario"];
		$telefono=$_POST["telefono"];
		$telefono2=$_POST["telefono2"];
		$logo=$_FILES['logo']['name'];
		$rutalogo="Logos/$nombre/".$logo;

		$insertarEmpresa=$mysqli->query("INSERT INTO tbl_empresa(empresa_nombre,empresa_rtn,ciudad_codigo,categoria_codigo,empresa_descripcion,empresa_direccion,empresa_correo,empresa_horario)VALUES('$nombre','$rtn','".$_POST["ciudad"]."','".$_POST["categoria"]."','$descripcion','$direccion','$correo','$horario')");

		$ultimo_id=mysqli_insert_id($mysqli);

		$insertartelefono=$mysqli->query("INSERT INTO tbl_empresatelefono(empresa_codigo,telefono_telefono)VALUES('$ultimo_id','$telefono')");

		$insertartelefono2=$mysqli->query("INSERT INTO tbl_empresatelefono(empresa_codigo,telefono_telefono)VALUES('$ultimo_id','$telefono2')");

		$insertarlogo=$mysqli->query("INSERT INTO tbl_empresalogo(empresa_codigo,logo_nombre) VALUES('$ultimo_id','$rutalogo')");

		mkdir("Logos/".$nombre);
			move_uploaded_file($_FILES['logo']['tmp_name'], "Logos/$nombre/$logo");

		for ($i=0; $i<count($_FILES['image']['name']) ; $i++) { 
		
		$img=$_FILES['image']['name'][$i];
		$ruta="Imagenes/$nombre/".$img;

		$sql="INSERT INTO tbl_empresaimagenes(empresa_codigo,imagenes_nombre) VALUES('$ultimo_id','$ruta')";

		if ($sql) {

			if (is_dir("Imagenes/".$nombre)&& $i==0) {

				echo "<script>alert('Esta Carpeta ya Existe')</script>";
				break;
			}

			if (!is_dir("Imagenes/".$nombre) && $i==0) {
			
			$insertar=$mysqli->query($sql);
			mkdir("Imagenes/".$nombre);
			move_uploaded_file($_FILES['image']['tmp_name'][$i], "Imagenes/$nombre/$img");
			echo "<script>alert('Imagen Cargada con éxito')</script>";
			}

			if (is_dir("Imagenes/".$nombre) && $i!=0) {

				$insertar=$mysqli->query($sql);
				move_uploaded_file($_FILES['image']['tmp_name'][$i], "Imagenes/$nombre/$img");
					
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
	<title>Registrar Cliente</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <h2><center>Registrar Empresa</center></h2>
  <form class="form-horizontal" action="cliente_registrar.php" method="post" enctype="multipart/form-data">
	    <div class="form-group">
	      <label class="control-label col-sm-2">Nombre:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" id="nombre" placeholder="Nombre de la Empresa" name="nombre" autofocus required/>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" >RTN:</label>
	      <div class="col-sm-10">          
	        <input type="text" class="form-control" onkeypress="return validaNumericos(event)" id="rtn" placeholder="RTN de la Empresa" name="rtn" autofocus required/>
	      </div>
	    </div>
		<div class="form-group">
	      <label class="control-label col-sm-2" for="pwd">Ciudad:</label>
	      <div class="col-sm-10">          
	      	 <select class="form-control" id="ciudad" name="ciudad">
			    <option value="">Ciudad de la Empresa</option>
			    <?php
                            $query = $mysqli -> query ("SELECT ciudad_codigo,ciudad_nombre FROM tbl_ciudad");
                            while ($valores = mysqli_fetch_array($query)) {
                            echo '<option value="'.$valores[ciudad_codigo].'">'.$valores[ciudad_nombre].'</option>';
                            }
                          ?>
	  		</select>
	      </div>
	    </div>

	    <div class="form-group">
	      <label class="control-label col-sm-2" for="pwd">Categoria:</label>
	      <div class="col-sm-10">          
	      	 <select class="form-control" id="categoria" name="categoria">
			    <option>Categoria de la Empresa</option>
			    <?php
                            $query = $mysqli -> query ("SELECT categoria_codigo,categoria_nombre FROM tbl_categoria");
                            while ($valores = mysqli_fetch_array($query)) {
                            echo '<option value="'.$valores[categoria_codigo].'">'.$valores[categoria_nombre].'</option>';
                            }
                          ?>
			   	  </select>
	      </div>
	    </div>

	    <div class="form-group">
	      <label class="control-label col-sm-2" for="pwd">Logo:</label>
	      <div class="col-sm-10">          
	      	<input type="file" name="logo" autofocus required/>
	      </div>
	    </div>

		 <div class="form-group">
		      <label class="control-label col-sm-2" for="pwd">Imágenes:</label>
		      <div class="col-sm-10">          
		      	<input type="file"  name="image[]" multiple autofocus required/>
		      </div>
		    </div>

		     <div class="form-group">
	      <label class="control-label col-sm-2">Descripción:</label>
	      <div class="col-sm-10">          
	      <textarea class="form-control" rows="5" id="descripcion" name="descripcion" autofocus required/></textarea>
	      </div>
	    </div>


	    <div class="form-group">
	      <label class="control-label col-sm-2">Dirección:</label>
	      <div class="col-sm-10">          
	        <input type="text" class="form-control" id="direccion" placeholder="Dirección de la Empresa" name="direccion" autofocus required/>
	      </div>
	    </div>

	    <div class="form-group">
	      <label class="control-label col-sm-2">Teléfono 1:</label>
	      <div class="col-sm-10">          
	        <input type="text" class="telefono form-control" id="telefono" placeholder="Teléfono de la Empresa" name="telefono" autofocus required/>
	      </div>
	    </div>

	        <div class="form-group">
	      <label class="control-label col-sm-2">Teléfono 2:</label>
	      <div class="col-sm-10">          
	        <input type="text" class="telefono form-control" id="telefono2" placeholder="Teléfono 2 de la Empresa" name="telefono2" autofocus>
	      </div>
	    </div>

	    <div class="form-group">
	      <label class="control-label col-sm-2">Correo:</label>
	      <div class="col-sm-10">          
	        <input type="email" class="form-control" id="correo" placeholder="Correo de la Empresa" name="correo" autofocus required/>
	      </div>
	    </div>

	     <div class="form-group">
	      <label class="control-label col-sm-2">Horario:</label>
	      <div class="col-sm-10">          
	        <input type="text" class="form-control" id="horario" placeholder="Horario de la Empresa" name="horario" autofocus required/>
	      </div>
	    </div>

	    <div class="form-group text-center">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <button type="submit"  class="btn btn-primary btn-lg" name="enviar">Guardar</button>
	      </div>
	    </div>
  	</form>
 </div>

 <script>		
		function validaNumericos(event) {
    if(event.charCode >= 48 && event.charCode <= 57){
      return true;
     }
     return false;        
}
	</script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script>
    $('.telefono').mask('(000) 0000-0000');
    $('.telefono2').mask('(000) 0000-0000');
</script>
</body>
</html>