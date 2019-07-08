<div class="container">
    <h2 class="text-center mt-5">Eventos</h2>
    <hr>
    <div class="row">
        <div class="col-12 mt-5">
            <div class="table-responsive">
                <table class="table">
                    <thead class="thead-dark">
                        <tr class="text-center">
                            <th>Dia</th>
                            <th>Hora</th>
                            <th>Nombre del evento</th>
                            <th>Sede</th>
                            <th>Tickets</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($Eventos as $row): ?>
                            <tr>
                                <td><?php echo $row->Dia ?></td>
                                <td><?php echo $row->Hora ?></td>
                                <td><?php echo $row->NombDeporte ?></td>
                                <td><?php echo $row->DireccionSede ?></td>
                                <td><a href="?c=categorias&a=index&evento=<?php echo $row->IdEvento; ?>">Compra tu entrada</a></td>
                            </tr>
                        <?php endforeach; ?>
                        
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>