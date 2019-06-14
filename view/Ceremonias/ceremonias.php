<main>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <!--                <img src="./images/ceremonias-lima-2019.jpg" class="img-fluid" alt="Responsive image" style="width: 100% !important;">-->
                <section class="row no-gutter align-items-center">
                    <div class="col-lg-12 text-center p-0 d-flex align-items-center">
                        <img class="img-fluid position-relative mx-auto" src="<?php echo $ceremonia->imagenC; ?>" alt="banner ceremonias" style="width: 100% !important;">
                        <h1 class="w-100 position-absolute text-light my-auto" style="text-align: left; margin-top: 30px !important; margin-left: 20px !important;"><?php echo $ceremonia->titulo; ?><br><?php echo $ceremonia->DescripcionC; ?></h1>
                    </div>
                </section>

            </div>
        </div>
    </div>
    <hr>
    <div class="container">
        <div class="row">

                <div class="col-md-4">
                    <div class="card" style="width: 100%;">
                        <img src="<?php echo $tipoCeremonia2->ImagenTipoCeremonia; ?>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h2 class="card-title"><?php echo $tipoCeremonia2->NombreC; ?></h2>
                            <p class="card-text"><?php echo $tipoCeremonia2->descripcionTipoC; ?></p>
                            <a href="?c=ceremonias&a=getInauguracion" class="btn btn-primary btn-block"> <h4>Ver mas +</h4></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <iframe class="embed-responsive-item" src="http://www.youtube.com/embed/xs4zJsW4Ecs" allowfullscreen width="100%" height="95%"></iframe>
                </div>

        </div>
        <hr>

        <div class="row">
                <div class="col-md-12">
                    <div class="card mb-3" style="width: 100%;">
                        <div class="row no-gutters">
                            <div class="col-md-4 card">
                                <img src="<?php echo $tipoCeremonia3->ImagenTipoCeremonia; ?>" class="card-img" alt="...">
                            </div>
                            <div class="col-md-8 card text-white bg-primary">
                                <div class="card-body">
                                    <h2 class="card-title"><?php echo $tipoCeremonia3->NombreC; ?></h2>
                                    <p class="card-text"><?php echo $tipoCeremonia3->descripcionTipoC; ?></p>
                                    <a href="?c=ceremonias&a=getClausura" class="btn btn-primary"><h4>Ver mas +</h4></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>
    <hr>
    <div class="container-fluid pattern-ceremonias">
        <div class="col-md-8 offset-2">
            <section class="">
                <div class="row">
                    <div class="col-md-12">
                        <br>
                        <h1 class="text-primary">CONVOCATORIA DE TALENTOS ARTISTICOS</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <img src="./assets/images/ceremonias/senoritaSaltando.png" class="img-fluid" alt="Responsive image" style="width: 100%;">
                    </div>
                    <div class="col-md-4">
                        <img src="./assets/images/ceremonias/mascota.png" class="img-fluid text-center" alt="Responsive image" style="margin-top: 20%; margin-left: 10%">
                        <h2 class="text-primary text-center">SUMA TU PASIÓN</h2>
                        <button class="btn btn-primary btn-block">POSTULA AQUÍ</button>
                    </div>
                    <div class="col-md-4">
                        <img src="./assets/images/ceremonias/hombreSaltando.png" class="img-fluid" alt="Responsive image" style="width: 70% !important;">
                    </div>
                </div>
            </section>
        </div>
    </div>
</main>
