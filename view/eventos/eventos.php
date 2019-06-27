<main>
    <div class="container">
        <div class="row mt-3">
            <div class="col-md-8">
                <h4>ADMIN - ENCUENTROS DEPORTIVOS</h4>
            </div>

            <div class="col-md-4">
                <div class="text-right">
                    <a href="?c=evento&a=registrarEventos" class="btn btn-outline-success">Registrar Evento</a>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-md-12">
                <table class="table">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">Sede</th>
                        <th scope="col">Fecha</th>

                        <th scope="col">Pais</th>
                        <th scope="col">&nbsp;</th>
                        <th scope="col">Pais</th>

<!--                        <th scope="col">Participante</th>-->
<!--                        <th scope="col">&nbsp;</th>-->
<!--                        <th scope="col">Participante</th>-->

                        <th scope="col">Deporte</th>
                        <th scope="col">&nbsp;</th>
                        <th colspan="3" scope="col">Resultados</th>


                        <th colspan="2" scope="col">Acciones</th>
                    </tr>
                    </thead>
                    <tbody>

                    <?php foreach ($eventos as $row): ?>

                        <tr>
                            <td><?php echo $row->DireccionSede;?></td>
                            <td><?php echo $row->fecha;?></td>
                            <td><?php echo $row->pais1;?></td>
                            <td>vs</td>
                            <td><?php echo $row->pais2;?></td>
                            <td><?php echo $row->NombDeporte;?></td>
                            <td>=</td>
                            <td><?php echo $row->res1;?></td>
                            <td>-</td>
                            <td><?php echo $row->res2;?></td>
                            <td>
                                <a href="?c=evento&a=Crud&id=<?php echo $row->idEvento;?>" class="btn btn-outline-warning btn-sm">Editar</a>
                            </td>
                            <td>
                                <button class="btn btn-danger btn-sm">Eliminar</button>
                            </td>
                        </tr>

                    <?php endforeach; ?>


                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>
