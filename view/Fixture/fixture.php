<main>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <!--                <img src="./images/ceremonias-lima-2019.jpg" class="img-fluid" alt="Responsive image" style="width: 100% !important;">-->
                <section class="row no-gutter align-items-center">
                    <div class="col-lg-12 text-center p-0 d-flex align-items-center">
                        <img class="img-fluid position-relative mx-auto" src="./assets/images/banner_es_desk.jpg" alt="banner ceremonias" style="width: 100% !important;">
                    </div>
                </section>

            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12 mt-3" style="padding: 15px;">
                <h4 class="text-danger"><b>CALENDARIO</b></h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 border border-secondary mt-3" style="padding: 15px;">
                <p>Mantente al día con las fechas y horarios de las competencias. Compra entradas, participa y conviértete en parte activa de los Juegos Panamericanos Lima 2019</p>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-12">
<!--                <button type="button" class="btn btn-primary btn-lg"> <i class="fas fa-cloud-download-alt"></i> Calendario Lima 2019</button>-->
                <button type="button" class="btn btn-primary btn-lg manual" onclick="ver('./assets/docs/calendarioPanamericanos.pdf')"><i class="fas fa-cloud-download-alt"></i> Calendario Lima 2019</button>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-12">
                FILTRAR:
                <form action="?c=fixture&a=buscar" method="POST">
                    <div class="form-row">
                        <div class="form-group col-md-5">
                            <label for="inputEmail4">Sede</label>
                            <select name="sede" class="selectpicker form-control" data-live-search="true">
                                <option value="">Seleccione una sede</option>
                                <?php foreach ($sedes as $row):?>
                                    <option><?php echo $row->DireccionSede;?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group col-md-5">
                            <label for="inputPassword4">Deporte</label>
                            <select name="deporte" class="selectpicker form-control" data-live-search="true">
                                <option value="">Seleccione una sede</option>
                                <?php foreach ($deportes as $row): ?>
                                    <option><?php echo $row->NombDeporte;?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group col-md-2">
                            <br>
                            <button type="submit" class="btn btn-outline-success btn-block">Filtrar</button>

                        </div>
                    </div>
                </form>

            </div>
        </div>

        <div class="row mt-3">
            <div class="col-md-12">

                <table class="table">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">Día</th>
                        <th scope="col">Deporte</th>
                        <th scope="col">Sede</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    foreach($fixture as $row):
                        ?>
                        <tr>
                            <td><?php echo $row->fechaInicio; ?></td>
                            <td><?php echo $row->NombDeporte; ?></td>
                            <td><?php echo $row->DireccionSede; ?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>

<script>
    function ver(archivo){
        window.open(archivo, '_blank');
        //console.log(archivo);
    }
</script>
