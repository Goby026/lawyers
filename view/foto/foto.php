<body>
    <div class="container">
    <form action="" method="post" enctype="multipart/form-data">
    <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Empleados</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="modal-row">
        <input type="hidden" required name="txtcodigo" value="<?php echo $txtcodigo;?>" placeholder="" id="txtcodigo" require="">
    

    <label for="">Nombre (S):</label>
    <input type="text" class="form-control" name="txtnombre" required value="<?php echo $txtnombre;?>"  placeholder="" id="txtnombre" require="">
    <br>

    
    <label for="">Foto:</label>
    <input type="file" accept="image/*" name="txtfoto" value="<?php echo $txtfoto;?>"  placeholder="" id="txtfoto" require="">
    <br>
        </div>
      </div>
      <div class="modal-footer">
      <button value="btnAgregar" <?php echo $accionAgregar; ?> class="btn btn-success" type="submit" name="accion">Agregar</button>
      <button value="btnModificar" <?php echo $accionModificar; ?>  class="btn btn-warning" type="submit" name="accion">Modificar</button>
      <button value="btnEliminar" <?php echo $accionEliminar; ?>  class="btn btn-danger" type="submit" name="accion">Eliminar</button>
      <button value="btnCancelar" <?php echo $accionCancelar; ?>  class="btn btn-primary" type="submit" name="accion">Cancelar</button>
      </div>
    </div>
  </div>
</div>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNuevo">
  Agregar registro +
</button>

    

    </form>
    <br>
    <br>

    <div class="row">
    <table class="table table-hover table-bordered">
        <thead class="thead-dark">
            <tr>
            <th>Foto</th>
            <th>Nombre</th>
            <th>Acciones</th>
            </tr>
        </thead>

        <?php
        foreach($listaEmpleados as $row):
        ?>
        <tr>
            <td><img class="img-thumbnail" width="100px" src="<?php echo $row->foto; ?>"/> </td>
            <td><?php echo $row->nombre; ?> </td>
           


            <td>
            <form action="" method="post">

            <input type="hidden" name="txtcodigo" value="<?php echo $row->codigo; ?>">
            <input type="hidden" name="txtnombre" value="<?php echo $row->nombre; ?>">
            <input type="hidden" name="txtfoto" value="<?php echo $row->foto; ?>">

            <input type="submit" value="Seleccionar" class="btn btn-info"name="accion">
            <button value="btnEliminar" type="submit" class="btn btn-danger" name="accion">Eliminar</button>
            </form>
            
            </td>
        </tr>
        
        <?php endforeach; ?>


    </table>
    
    </div>

    <!-- Modal -->
<div class="modal fade" id="modalNuevo" tabindex="-1" role="dialog" aria-labelledby="modalNuevoLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

    <form action="?c=foto&a=verDatos" method = "POST">
      <div class="modal-header">
        <h5 class="modal-title" id="modalNuevoLabel">Empleados</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="modal-row">
        <input type="hidden" required name="txtcodigo" value="" placeholder="" id="txtcodigo" require="">
    

    <label for="">Nombre (S):</label>
    <input type="text" class="form-control" name="txtnombre" required value=""  placeholder="" id="txtnombre" require="">
    <br>

    
    <label for="">Foto:</label>
    <input type="file" accept="image/*" name="txtfoto" value=""  placeholder="" id="txtfoto" require="">
    <br>
        </div>
      </div>
      <div class="modal-footer">
      <button value="btnAgregar" class="btn btn-success" type="submit" name="accion">Agregar</button>
      <button value="btnModificar"  class="btn btn-warning" type="submit" name="accion">Modificar</button>
      <button value="btnEliminar"  class="btn btn-danger" type="submit" name="accion">Eliminar</button>
      <button value="btnCancelar"  class="btn btn-primary" type="submit" name="accion">Cancelar</button>
      </div>
      </form>
    </div>    

  </div>
</div>

    
    </div>
</body>