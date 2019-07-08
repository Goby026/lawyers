<div class="container">
    <h2 class="text-center mt-5">Entradas Adquiridas</h2>
    <hr>
    <div class="row">
        <div class="col-12 mt-5">
            <div class="table-responsive">
                <table class="table">
                    <thead class="thead-dark">
                        <tr class="text-center">
                            <th>Lugar</th>
                            <th>Deporte</th>
                            <th>Fecha Hora de Evento</th>
                            <th>Asiento</th>
                            <th>Importe</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($compraentradas as $row): ?>
                            <tr class="text-center">
                                <td><?php echo $row->Lugar ?></td>
                                <td><?php echo $row->NombDeporte ?></td>
                                <td><?php echo $row->FechaHoraEvento ?></td>
                                <td><?php echo $row->numero ?></td>
                                <td><?php echo 'S/. '. $row->Monto; ?></td>
                            </tr>
                        <?php endforeach; ?>
                        
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>