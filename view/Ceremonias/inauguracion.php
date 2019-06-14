<main>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <section class="row no-gutter align-items-center">
                    <div class="col-lg-12 text-center p-0 d-flex align-items-center">
                        <img class="img-fluid position-relative mx-auto" src="<?php echo $ceremonia->imagenC;?>" alt="" style="width: 100% !important;">
                        <h1 class="w-100 position-absolute text-light my-auto" style="text-align: left; margin-top: 30px !important; margin-left: 20px !important;"><?php echo $ceremonia->titulo;?><br><?php echo $ceremonia->DescripcionC;?></h1>
                    </div>
                </section>
            </div>
        </div>
    </div>
    <hr>
    <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <img src="<?php echo $tipoCerem->ImagenTipoCeremonia;?>" class="img-fluid" alt="Responsive image" style="width: 100%">
                    <span class="d-block p-2 bg-primary text-white">
                    <p><h3 style="margin-left: 15% !important;"><?php echo $tipoCerem->NombreC;?></h3></p>
                </span>
                </div>
                <div class="col-md-6">
                    <h2 class="text-primary"><?php echo $tipoCerem->subTitulo;?></h2>
                    <?php echo $tipoCerem->descripcionTipoC;?>
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
                        <h1>CALENDARIO</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card mb-3" style="width: 100%;">
                            <div class="row no-gutters">
                                <div class="col-md-6">
                                    <div class="text-center">
                                        <img src="./assets/images/inauguracion/milco2.png" class="img-fluid" alt="Responsive image" style="width: 60%">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card-body">
                                        <div class="text-center">
                                            <h1 class="card-title text-primary">26</h1>
                                            <h4 class="text-primary">JULIO</h4>
                                            <p class="card-text text-primary">LIMA <br> <b>ESTADIO </b><br> <b>NACIONAL</b></p>
                                            <p class="text-info">CEREMONIA DE INAUGURACIÓN</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</main>
