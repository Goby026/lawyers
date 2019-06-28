<main>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <!--                <img src="./images/ceremonias-lima-2019.jpg" class="img-fluid" alt="Responsive image" style="width: 100% !important;">-->
                <section class="row no-gutter align-items-center">
                    <div class="col-lg-12 text-center p-0 d-flex align-items-center">
                        <img class="img-fluid position-relative mx-auto" src="./assets/images/deportistas-participantes.jpeg" alt="banner ceremonias" style="width: 100% !important;">
                    </div>
                </section>

            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12 mt-3" style="padding: 15px;">
                <h4 class="text-danger"><b>PARTICIPANTES</b></h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 border border-secondary mt-3" style="padding: 15px;">
                <p class="text-center">Conoce a los participantes de cada país y los logros obtenidos por cada uno de ellos</p>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-12">
                <!--                <button type="button" class="btn btn-primary btn-lg"> <i class="fas fa-cloud-download-alt"></i> Calendario Lima 2019</button>-->
                <button type="button" class="btn btn-primary btn-lg manual"><i class="fas fa-running"></i> LOS PARTICIPANTES</button>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-12">
                FILTRAR:
                <form action="?c=deportista&a=buscar" method="POST">
                    <div class="form-row">
                        <div class="form-group col-md-5">
                            <label for="inputEmail4">Pais</label>
                            <select name="pais" class="selectpicker form-control" data-live-search="true">
                                <option value="">País</option>
                                <?php foreach ($paises as $row):?>
                                    <option value="<?php echo $row->idPais;?>"><?php echo $row->NombrePais;?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
<!--                        <div class="form-group col-md-5">-->
<!--                            <label for="inputPassword4">Participantes</label>-->
<!--                            <select name="participante" class="selectpicker form-control" data-live-search="true">-->
<!--                                <option value="">Participante</option>-->
<!--                                --><?php //foreach ($deportes as $row): ?>
<!--                                    <option>--><?php //echo $row->NombDeporte;?><!--</option>-->
<!--                                --><?php //endforeach; ?>
<!--                            </select>-->
<!--                        </div>-->
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
                        <th scope="col">Participante</th>
                        <th scope="col">País</th>
                        <th scope="col">Logros</th>
                        <th scope="col">foto</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($deportistas as $row): ?>
                        <tr>
                            <td><?php echo $row->nombres; ?> <?php echo $row->apellidos; ?></td>
                            <td><?php echo $row->NombrePais; ?></td>
                            <td>--//--//--//--</td>
                            <td><img src="./assets/images/user.png" class="img-fluid" alt=""></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>

