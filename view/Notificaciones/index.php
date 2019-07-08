<main>
    <div class="container">
        <div class="row mt-2">
            <div class="col-md-8">
                <h3>Mis Notificaciones</h3>
            </div>

            <div class="col-md-4">
                <div class="text-right">
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <table class="table">
                    <thead>
                    <tr>
                        <th colspan="3" scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach($notificaciones as $noti): ?>
                    <tr>
                        <th scope="row"><?php echo $noti->titulo; ?></th>
                        <?php foreach ($this->resultados->Obtener($noti->idEvento) as $row): ?>
                            <td><?php echo $row->pais1;?></td>
                            <td><?php echo $row->res1;?></td>
                            <td> - </td>
                            <td><?php echo $row->res2;?></td>
                            <td><?php echo $row->pais2;?></td>
                        <?php endforeach; ?>
                        <td class="text-right">
                            <a href="?c=notificacion&a=leer&id=<?php echo $noti->idusuario_notificaciones;?>" class="btn btn-danger btn-sm"><i class="fas fa-ban"></i></a>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</main>
