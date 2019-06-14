<main>
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-4">MEDALLERO SEGUN PAISES</h1>
            <p class="lead">Juegos panamericanos Lima 2019</p>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <table class="table">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">#</th>
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
