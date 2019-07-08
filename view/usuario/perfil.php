<style>

body{
    margin: 0;
}

video{
    position: fixed;
    min-width: 100%;
    min-height: 100%;
    
    top: 50%;
    left: 50%;
    
    transform: translateX(-50%) translateY(-50%);
    z-index: -1;
    
}
label{
    color:white;
}
</style>
<video src="../assets/images/lima.mp4" autoplay loop muted poster="../assets/images/lima.jpeg">
</video>
<!--<main>-->
<!--    <p><?php // echo $usuario->nombre ?></p>-->
<!--    <p><?php //echo $usuario->usuario ?></p>-->
<!--</main>-->

<div class="container">
   <div id="signupbox" style="margin-top:5px" style="background-color: black" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
       <div class="card-body" style="background-color: black">
<!------ Include the above in your HEAD tag ---------->
<form id="signupform" class="form-horizontal" role="form" action="?c=usuario&a=Guardar"
                    method="POST" autocomplete="off">
  <div class="form-row">
    <div class="form-group col-md-6">
    <input type="hidden"  name="id" placeholder="Nombre" value="<?php echo $usuario->id ?>">
      <label for="inputEmail4">Nombre</label>
      <input type="text"  class="form-control" name="nombre" placeholder="Nombre" value="<?php echo $usuario->nombre ?>">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Apellidos</label>
      <input type="text"  class="form-control" name="apellidos" placeholder="Apellidos" value="<?php echo $usuario->ApellidoU ?>">
    </div>
  </div>
  <div class="form-group">
    <label for="inputAddress">Usuario</label>
    <input type="text"  class="form-control" name="usuario" placeholder="Usuario" value="<?php echo $usuario->usuario ?>">
  </div>
  <div class="form-row">
      <div class="form-group col-md-6">
    <label for="inputAddress2">Documento Identidad</label>
    <input type="text"  class="form-control" name="documento" placeholder="Documento Identidad"value="<?php echo $usuario->DocIdentidad ?>">
  </div>

    <div class="form-group col-md-6">
      <label for="inputCity">Telefono</label>
       <input type="text" class="form-control" name="telefono" placeholder="Telefono" value="<?php echo $usuario->telefonoU ?>">
    </div>
    </div>
    <div class="form-group">
      <label for="inputState">Correo Electronico</label>
       <input type="email" class="form-control" name="email" placeholder="Email"   value="<?php echo $usuario->correo ?>">
    <div class="form-group col-md-12">
      <label for="inputZip">Ultimo Ingreso</label>
      <input type="text" readonly class="form-control" name="ultimo" value="<?php echo $usuario->last_session ?>">
    </div>
  </div>
  <button type="submit" class="btn btn-info"><i class="icon-hand-right"></i>Actualizar</button>
  </div>

                           
  
</form>

    </div>
  </div>
  </div>