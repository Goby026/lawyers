<main>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="text-right mt-2">
                    <a href="?c=participantes&a=registrarParticipantes" class="btn btn-outline-success"><i class="fas fa-plus"></i> Nuevo Participante</a>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <?php
            foreach ($participantes as $row):
                ?>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <img src="<?php echo $row->Foto; ?>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><?php echo $row->Nombre; ?></h5>
                            <p>
                                <?php echo $row->ApellidoP; ?><br>
                                <?php echo $row->ApellidoM; ?><br>
                                <?php echo $row->Pais; ?>
                            </p>
                            <div class="dropdown">
                                <button class="btn btn-outline-info btn-block dropdown-toggle" type="button"
                                        id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                    Acciones
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item"
                                       href="?c=participantes&a=Crud&id=<?php echo $row->id; ?>">Editar</a>
                                    <a class="dropdown-item" href="?c=participantes&a=Eliminar&id=<?php echo $row->id; ?>">Eliminar</a>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>

</main>
