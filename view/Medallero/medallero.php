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
        <div class="row">
            <div class="col-md-12 mt-3" style="padding: 15px;">
                <h4 class="text-danger"><b>RANKING DE PAIS</b></h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 border border-secondary mt-3" style="padding: 15px;">
                <p class="text-center">Conoce el ranking de todos los paises participantes de los juegos panamericanos Lima 2019</p>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-12">
                <table class="table">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">PUESTO</th>
                        <th scope="col">PAIS</th>
                        <th scope="col">ORO</th>
                        <th scope="col">PLATA</th>
                        <th scope="col">BRONCE</th>
                        <th scope="col">TOTAL</th>
                    </tr>
                    </thead>
                    <tbody>

                    <?php foreach($medallero as $row): ?>
                        <tr>
                            <th scope="row"><?php echo $cont++; ?></th>
                            <td><?php echo $row->NombrePais; ?></td>
                            <td><?php echo $row->oro; ?></td>
                            <td><?php echo $row->plata; ?></td>
                            <td><?php echo $row->bronce; ?></td>
                            <td><?php echo $row->total; ?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</main>
