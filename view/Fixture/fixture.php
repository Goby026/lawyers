<main>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="jumbotron jumbotron-fluid">
                            <div class="container">
                                <h1 class="display-4">FIXTURE</h1>
                                <p class="lead">Juegos panamericanos Lima 2019</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <table class="table">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">Deporte</th>
                        <th scope="col">Desde</th>
                        <th scope="col">Hasta</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    foreach($fixture as $row):
                        ?>
                        <tr>
                            <td><?php echo $row->NombDeporte; ?></td>
                            <td><?php echo $row->fechaInicio; ?></td>
                            <td><?php echo $row->fechaFinal; ?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>
