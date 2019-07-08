<main class="auspiciadores">
    <?php
    strtotime('2019-05-17'); //1293836400
    ?>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="bd-example">
                    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="./assets/images/incas.jpg" class="d-block w-100" alt="...">
                                <div class="carousel-caption d-none d-md-block">
                                    <h1>NUESTROS AUSPICIADORES</h1>
                                    <p>
                                    <div class="contador" data-until="<?php echo strtotime('2019-07-27');?>" data-done="Finished!" data-respond>

                                        <div class="dias block">
                                            <div class="conta"></div>
                                            <div class="label" >Dias</div>
                                        </div>
                                        <div class="horas block">
                                            <div class="conta"></div>
                                            <div class="label">Horas</div>
                                        </div>
                                        <div class="minutos block">
                                            <div class="conta"></div>
                                            <div class="label">Minutos</div>
                                        </div>
                                        <div class="segundos block">
                                            <div class="conta"></div>
                                            <div class="label">Segundos</div>
                                        </div>

                                    </div>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container mt-3">
        <div class="row">
            <div class="col-md-12">

            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <p class="text-justify">Los juegos olímpicos son considerados como la cita deportiva multidisciplinaria más importante de todo el mundo y a pocos días de su vigésimo novena edición que será celebrada en pekín, crece la expectación y como el despliegue publicitario de marcas y anunciantes que aprovecharan este acontecimiento como gran escaparate ante la mirada de millones de espectadores de todo el mundo. Las olimpiadas son sin duda una gran oportunidad de negocio no sólo para las marcas y empresas patrocinadoras sino también para los medios de información como la televisión o la prensa escrita y online.Sin embargo, desde 1984 el compromiso y el pacto entre la organización de este evento y las grandes marcas patrocinadores dieron lugar a una estrategia en materia de marketing ideando así lo que se denomina TOP (The Olympic Partner). Empresas y marcas internacionales de gran prestigio que gozan del privilegio y el poder de utilizar los anillos olímpicos con carácter oficial entre las que se encuentran;</p>
            </div>
        </div>
        <hr>
        <div class="row">
            <?php foreach($auspiciadores as $row):
                $c++;
                ?>

                <div class="col-md-12">
                    <div class="card mb-3">
                        <div class="row no-gutters">

                            <?php
                            if ($c % 2 == 0){
                                ?>
                                <div class="col-md-6">
                                    <img src="<?php echo $row->imagenE;?>" class="card-img" alt="...">
                                </div>
                                <div class="col-md-6">
                                    <div class="card-body">
                                        <br><br><br>
                                        <h5 class="card-title"><?php echo $row->NomAuspiciador;?></h5>
                                        <p class="card-text"><?php echo $row->descripcionAus;?></p>
                                    </div>
                                </div>
                                <?php
                            }else{
                                ?>
                                <div class="col-md-6">
                                    <div class="card-body">
                                        <br><br><br>
                                        <h5 class="card-title"><?php echo $row->NomAuspiciador;?></h5>
                                        <p class="card-text"><?php echo $row->descripcionAus;?></p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <img src="<?php echo $row->imagenE;?>" class="card-img" alt="...">
                                </div>
                                <?php
                            }
                            ?>

                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
        <hr>
        <div class="row">
            <div class="col-md-12">
                <p>Al margen de las marcas que componen este "The Olympic Partner" también se encuentra otros patrocinadores del propio Comité Olímpico, la mayoría de ellos de origen chino pero donde también destacan otras marcas internacionalmente conocidas como son Volkswagen o Adidas.</p>
            </div>
        </div>
    </div>


</main>
