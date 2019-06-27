<main>
    <div class="container">
        <div class="row mt-2">
            <div class="col-md-8">
                <h3>Resultados de dia</h3>
            </div>

            <div class="col-md-4">
                <div class="text-right">
                    <a href="?c=evento&a=adminResultados" class="btn btn-outline-success"><i class="fas fa-plus"></i> Administrar resultados</a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
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

                        <tr class="bg-warning">
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
