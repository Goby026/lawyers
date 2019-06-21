<body>
    <div class="container">
    <form action="" method="post" enctype="multipart/form-data">
    <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Disciplina</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="modal-row">
        <input type="hidden" required name="txtid_juego" value="<?php echo $txtid_juego;?>" placeholder="" id="txtid_juego" require="">
    

    <label for="">Disciplina:</label>
    <input type="text" class="form-control" name="txtdisciplina" required value="<?php echo $txtdisciplina;?>"  placeholder="" id="txtdisciplina" require="">
    <br>
    <label for="">Sede:</label>
    <input type="text" class="form-control" name="txtsede" required value="<?php echo $txtsede;?>"  placeholder="" id="txtsede" require="">
    <br>
    <label for="">Direccion:</label>
    <input type="text" class="form-control" name="txtdireccion" required value="<?php echo $txtdireccion;?>"  placeholder="" id="txtdireccion" require="">
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
            <th>Disciplina</th>
            <th>Sede</th>
            <th>Direccion</th>
            <th>Controler</th>
            </tr>
        </thead>

        <?php
        foreach($listaEmpleados as $row):
        ?>
        <tr>
            <td><?php echo $row->disciplina; ?> </td>
            <td><?php echo $row->sede; ?> </td>
            <td><?php echo $row->direccion; ?> </td>
            
           


            <td>
            <form action="" method="post">

            <input type="hidden" name="txtid_juego" value="<?php echo $row->id_juego; ?>">
            <input type="hidden" name="txtdisciplina" value="<?php echo $row->disciplina; ?>">
            <input type="hidden" name="txtsede" value="<?php echo $row->sede; ?>">
            <input type="hidden" name="txtdireccion" value="<?php echo $row->direccion; ?>">

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

    <form action="?c=disciplina&a=verDatos" method = "POST">
      <div class="modal-header">
        <h5 class="modal-title" id="modalNuevoLabel">Disciplina</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="modal-row">
        <input type="hidden" required name="txtid_juego" value="" placeholder="" id="txtid_juego" require="">
    

    <label for="">Disciplina (S):</label>
    <input type="text" class="form-control" name="txtdisciplina" required  placeholder="" id="txtdisciplina" require="">
    <br>

    
    <label for="">Sede:</label>
    <input type="text" class="form-control" name="txtsede" required value=""  placeholder="" id="txtsede" require="">
    <br>
    <label for="">Direccion:</label>
    <input type="text" class="form-control" name="txtdireccion" required value=""  placeholder="" id="txtdireccion" require="">
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