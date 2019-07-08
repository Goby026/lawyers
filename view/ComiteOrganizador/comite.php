<main>
    <br>
    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <div class="row border border-primary" style="padding: 13px !important; width: 30% !important;">
                    <h5 class="text-primary text-center"> COMITE ORGANIZADOR </h5>
                </div>

            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-md-10 offset-1">

                <small class="mb-0"><p align="justify">El Comité Organizador de los XVIII Juegos Panamericanos y Juegos Parapanamericanos Lima 2019 (COPAL) está presidido por un representante del Ministerio de Transportes y Comunicaciones; e integrado por las siguientes personas:</p></small>

            </div>
        </div>
        <hr>
        <div class="row">
            <?php foreach($comite as $r): ?>
                <div class="col-md-4">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <img src="<?php echo $r->imagenR; ?>" class="card-img" alt="..." style="width: 100% !important;">
                                <small class="text-center text-primary"><?php echo $r->Cargo; ?></small>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title text-primary"><?php echo $r->NombresR; ?> <?php echo $r->ApellidoR; ?></h5>
                                    <p class="card-text text-muted"><?php echo $r->DescripcionR; ?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</main>
