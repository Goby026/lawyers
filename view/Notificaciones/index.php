<?php
var_dump($notificaciones);
?>
<main>
    <div class="container">
        <div class="row mt-2">
            <div class="col-md-8">
                <h3>Notificaciones</h3>
            </div>

            <div class="col-md-4">
                <div class="text-right">
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <!--                <table class="table">-->
                <!--                    <thead class="thead-dark">-->
                <!--                    <tr>-->
                <!--                        <th scope="col">Fecha</th>-->
                <!--                        <th scope="col">Deporte</th>-->
                <!--                        <th colspan="3" scope="col">Paises</th>-->
                <!--                        <th colspan="3" scope="col">Resultado</th>-->
                <!--                    </tr>-->
                <!--                    </thead>-->
                <!--                    <tbody>-->
                <!---->
                <!--                    --><?php //foreach ($notificaciones as $noti): ?>
                <!---->
                <!--                        --><?php //foreach ($this->resultados->Obtener($noti->idEvento) as $row): ?>
                <!---->
                <!--                            <tr class="bg-warning">-->
                <!--                                <td>--><?php //echo $row->fecha;?><!--</td>-->
                <!--                                <td>--><?php //echo $row->NombDeporte;?><!--</td>-->
                <!--                                <td>--><?php //echo $row->pais1;?><!--</td>-->
                <!--                                <td>VS</td>-->
                <!--                                <td>--><?php //echo $row->pais2;?><!--</td>-->
                <!--                                <td>--><?php //echo $row->res1;?><!--</td>-->
                <!--                                <td>-</td>-->
                <!--                                <td>--><?php //echo $row->res2;?><!--</td>-->
                <!--                            </tr>-->
                <!---->
                <!--                        --><?php //endforeach; ?>
                <!---->
                <!--                    --><?php //endforeach; ?>
                <!---->
                <!---->
                <!--                    </tbody>-->
                <!--                </table>-->

                <?php foreach($notificaciones as $noti): ?>
                    <!--                    <div class="col-md-12"><h3><p></p></h3></div>-->

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><?php echo $noti->titulo; ?></h5>

                            <?php foreach ($this->resultados->Obtener($noti->idEvento) as $row): ?>
                                <!--                                <div class="col-md-6"><h5><li></li></h5></div>-->
                                <h6 class="card-subtitle mb-2"><?php echo $row->pais1." vs ".$row->pais1 ?></h6>

                                <p class="card-text" style="margin-left: 5%;">Resultado: <?php echo $row->res1." - ". $row->res2?></p>
                                </p>
                            <?php endforeach; ?>

                        </div>
                    </div>

                <?php endforeach; ?>

            </div>
        </div>
    </div>
</main>
