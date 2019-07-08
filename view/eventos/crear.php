<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="jumbotron">
                    <h3>Nuevo Evento</h3>
                    <form action="?c=evento&a=Guardar" method="POST">
                        <div class="form-group">

                            <label for="">Sede</label>
                            <select name="sede" class="selectpicker form-control" data-live-search="true">
                                <?php foreach ($sedes as $row): ?>
                                    <option value="<?php echo $row->idSede;?>"><?php echo $row->DireccionSede;?></option>
                                <?php endforeach; ?>
                            </select>

                        </div>
                        <div class="form-group">
                            <label for="">Fecha</label>
                            <input type="date" class="form-control" name="fecha" required>
                        </div>
                        <div class="form-group">
                            <label for="apellidom">Deporte</label>
                            <select name="deporte" class="selectpicker form-control" data-live-search="true">
                                <?php foreach ($deportes as $row): ?>
                                    <option value="<?php echo $row->idDeporte;?>"><?php echo $row->NombDeporte;?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="">Pais 1</label>
                                <select name="pais1" class="selectpicker form-control" data-live-search="true">
                                    <?php foreach ($paises as $row): ?>
                                        <option><?php echo $row->NombrePais;?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="apellidom">Pais 2</label>
                                <select name="pais2" class="selectpicker form-control" data-live-search="true">
                                    <?php foreach ($paises as $row): ?>
                                        <option><?php echo $row->NombrePais;?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="">Resultado 1</label>
                                <input type="text" class="form-control" name="res1" value="" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="">Resultado 2</label>
                                <input type="text" class="form-control" name="res2" value="" required>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-success btn-block">Registrar</button>
                    </form>
                </div>
            </div>

            <div class="col-md-4">
                <div class="text-center">
                    <br><br><br>
                    <img src="./assets/images/5a0543434931c.jpeg" class="img-fluid rounded" alt="">
                </div>
            </div>


        </div>
    </div>
</div>
