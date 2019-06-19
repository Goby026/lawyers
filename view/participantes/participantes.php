<body>
    <div class="container">
    <form action="" method="post" enctype="multipart/form-data">
    <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Participantes</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="modal-row">
        <input type="hidden" required name="txtid" value="<?php echo $txtid;?>" placeholder="" id="txtid" require="">
    

    <label for="">Nombre (S):</label>
    <input type="text" class="form-control" name="txtNombre" required value="<?php echo $txtNombre;?>"  placeholder="" id="txtNombre" require="">
    <br>
    <label for="">Apellido Paterno:</label>
    <input type="text" class="form-control" name="txtApellidoP" required value="<?php echo $txtApellidoP;?>"  placeholder="" id="txtApellidoP" require="">
    <br>
    <label for="">Apellido Materno:</label>
    <input type="text" class="form-control" name="txtApellidoM" required value="<?php echo $txtApellidoM;?>"  placeholder="" id="txtApellidoM" require="">
    <br>
    <label for="">Pais (S):</label>
    <input type="text" class="form-control" name="txtPais" required value="<?php echo $txtPais;?>"  placeholder="" id="txtPais" require="">
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
            <th>Apellido Paterno</th>
            <th>Apellido Materno</th>
            <th>Pais</th>
            <th>Acciones</th>
            </tr>
        </thead>

        <?php
        foreach($listaEmpleados as $row):
        ?>
        <tr>
            <td><img class="img-thumbnail" width="100px" src="<?php echo $row->foto; ?>"/> </td>
            <td><?php echo $row->Nombre; ?> </td>
            <td><?php echo $row->ApellidoP; ?> </td>
            <td><?php echo $row->ApellidoM; ?> </td>
            <td><?php echo $row->Pais; ?> </td>
           


            <td>
            <form action="" method="post">

            <input type="hidden" name="txtid" value="<?php echo $row->id; ?>">
            <input type="hidden" name="txtNombre" value="<?php echo $row->Nombre; ?>">
            <input type="hidden" name="txtApellidoP" value="<?php echo $row->ApellidoP; ?>">
            <input type="hidden" name="txtApellidoM" value="<?php echo $row->ApellidoM; ?>">
            <input type="hidden" name="txtPais" value="<?php echo $row->Pais; ?>">

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

    <form action="?c=participantes&a=verDatos" method = "POST">
      <div class="modal-header">
        <h5 class="modal-title" id="modalNuevoLabel">Participantes</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="modal-row">
        <input type="hidden" required name="txtid" value="" placeholder="" id="txtid" require="">
    

    <label for="">Nombre (S):</label>
    <input type="text" class="form-control" name="txtNombre" required value=""  placeholder="" id="txtNombre" require="">
    <br>
    <label for="">Apellido Paterno:</label>
    <input type="text" class="form-control" name="txtApellidoP" required value=""  placeholder="" id="txtApellidoP" require="">
    <br>
    <label for="">Apellido Materno :</label>
    <input type="text" class="form-control" name="txtApellidoM" required value=""  placeholder="" id="txtApellidoM" require="">
    <br>
    <label for="">Pais :</label>
    <input type="text" class="form-control" name="txtPais" required value=""  placeholder="" id="txtPais" require="">
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