<div class="container-fluid">
    <div class="row titulos">
        <h3>Notificaciones</h3>
    </div>
</div>
<div class="container">
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
                        <th scope="row"><?php echo $noti->descripcion; ?></th>

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
