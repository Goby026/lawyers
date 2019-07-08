<main>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <!--                <img src="./images/ceremonias-lima-2019.jpg" class="img-fluid" alt="Responsive image" style="width: 100% !important;">-->
                <section class="row no-gutter align-items-center">
                    <div class="col-lg-12 text-center p-0 d-flex align-items-center">
                        <img class="img-fluid position-relative mx-auto" src="./assets/images/competencia.png" alt="banner ceremonias" style="width: 100% !important;">
                    </div>
                </section>

            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-8">
                <h3>Resultados de dia</h3>
            </div>

            <div class="col-md-4">
                <div class="text-right">
                    <?php
                    if (isset($_SESSION['tipo_usuario'])){
                        if ($_SESSION['tipo_usuario'] === "2"){
                            ?>
                            <a href="?c=evento&a=adminResultados" class="btn btn-outline-success"><i class="fas fa-plus"></i> Administrar resultados</a>
                            <?php
                        }
                    }
                    ?>

                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12 table-responsive">
                <table class="table">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">Fecha</th>
                        <th scope="col">Deporte</th>
                        <th colspan="3" scope="col">Paises</th>
                        <th colspan="3" scope="col">Resultado</th>
                    </tr>
                    </thead>
                    <tbody>

                    <?php foreach ($resultados as $row): ?>

                        <tr class="bg-light">
                            <td><?php echo $row->fecha;?></td>
                            <td><?php echo $row->NombDeporte;?></td>
                            <td><?php echo $row->pais1;?></td>
                            <td>VS</td>
                            <td><?php echo $row->pais2;?></td>
                            <td><?php echo $row->res1;?></td>
                            <td>-</td>
                            <td><?php echo $row->res2;?></td>
                        </tr>

                    <?php endforeach; ?>


                    </tbody>
                </table>

            </div>
        </div>
    </div>
</main>
