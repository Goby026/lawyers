<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="jumbotron">
                    <h3>Modificar Evento</h3>
                    <form action="?c=evento&a=Modificar" method="POST">
                        <div class="form-group">

                            <label for="">Sede</label>
                            <select name="sede" class="selectpicker form-control" data-live-search="true">
                                <?php foreach ($sedes as $row): ?>
                                <?php if ($row->idSede ===  $evento->idSede){
                                    ?>
                                        <option value="<?php echo $row->idSede;?>" selected><?php echo $row->DireccionSede;?></option>
                                    <?php

                                    }else{

                                    ?>
                                        <option value="<?php echo $row->idSede;?>"><?php echo $row->DireccionSede;?></option>
                                        <?php

                                    } ?>
                                <?php endforeach; ?>
                            </select>

                        </div>
                        <div class="form-group">
                            <label for="">Fecha </label>
                            <input type="date" class="form-control" name="fecha" required value="<?php echo date('Y-m-d',strtotime($evento->fecha)) ?>">
                        <div class="form-group">
                            <label for="apellidom">Deporte</label>
                            <select name="deporte" class="selectpicker form-control" data-live-search="true">
                                <?php foreach ($deportes as $row): ?>

                                <?php if ($row->idDeporte === $evento->idDeportes){
                                    ?>
                                        <option value="<?php echo $row->idDeporte;?>" selected><?php echo $row->NombDeporte;?></option>
                                    <?php
                                    }else{
                                    ?>
                                        <option value="<?php echo $row->idDeporte;?>"><?php echo $row->NombDeporte;?></option>
                                    <?php
                                    } ?>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="">Pais 1</label>
                                <select name="pais1" class="selectpicker form-control" data-live-search="true">
                                    <?php foreach ($paises as $row): ?>

                                        <?php if ($row->NombrePais === $evento->pais1){
                                            ?>
                                            <option selected><?php echo $row->NombrePais;?></option>
                                            <?php
                                        }else{
                                            ?>
                                            <option><?php echo $row->NombrePais;?></option>
                                            <?php
                                        } ?>

                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="apellidom">Pais 2</label>
                                <select name="pais2" class="selectpicker form-control" data-live-search="true">
                                    <?php foreach ($paises as $row): ?>

                                        <?php if ($row->NombrePais == $evento->pais2){
                                            ?>
                                            <option selected><?php echo $row->NombrePais;?></option>
                                            <?php
                                        }else{
                                            ?>
                                            <option><?php echo $row->NombrePais;?></option>
                                            <?php
                                        } ?>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="">Resultado 1</label>
                                <input type="text" class="form-control" name="res1" value="<?php echo $evento->res1;?>" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="">Resultado 2</label>
                                <input type="text" class="form-control" name="res2" value="<?php echo $evento->res2;?>" required>
                            </div>
                        </div>
                        <hr>
                            <input name="idEvento" type="hidden" value="<?php echo $evento->idEvento;?>">
                            <input name="idresutado" type="hidden" value="<?php echo $evento->idresutado;?>">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <button type="submit" name="modificar" class="btn btn-warning btn-block">Modificar</button>
                            </div>
                            <div class="form-group col-md-6">
                                <button type="submit" name="cancelar" class="btn btn-danger btn-block">Cancelar Evento</button>
                            </div>
                        </div>

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
