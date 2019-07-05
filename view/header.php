<!DOCTYPE html>
<html>
<head>
    <!--    <meta charset="utf-8" />-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="./assets/css/estilos1.css"><!-- para estilos del contador -->

    <!--    estilos de cada integrante-->
    <!--    <link href="./estilos/EstilosHome.css" rel="stylesheet" />-->
    <!--    <link rel="stylesheet" href="./estilos/EstilosAuspiciadores.css">-->
    <!--    <link href="./estilos/EstilosLosJuegos.css" rel="stylesheet" />-->
    <!--    <link href="./estilos/EstilosInsti.css" rel="stylesheet" />-->

    <!--    Bootstrap-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Font Awesome -->
    <!--    <link rel="stylesheet" href="./css/font-awesome/css/font-awesome.min.css">-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

<!--    Bootstrap Select-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.2/build/css/alertify.min.css"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.2/build/css/themes/default.min.css"/>
    <link href="./assets/css/styles.css" rel="stylesheet" />
    <link href="./assets/css/style.css" rel="stylesheet" />
    <link href="./assets/css/login.css" rel="stylesheet" />
    <link href="./assets/css/login1.css" rel="stylesheet" />
    <!--    <link rel="stylesheet" href="./css/css.css" type="text/css">-->

    <!--    <link rel="icon" type="" href="./img/icon_inicio.png"/>-->
    <link rel="icon" type="" href="./assets/images/icon_inicio.png"/>
    <!--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->

    <title>Weplay-Lima2019</title>
    <script type="text/javascript" src='./assets/js/facebook.js'></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


<!--    Bootstrap Select-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/i18n/defaults-*.min.js"></script>


<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">

</head>

<body>
            <?php
                if (!isset($_SESSION['username'])){
                ?>
<div class="">
    <div class="row">
        <div class="col-md-12">

                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="http://www.tecnoweplay.com/">Weplay</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Los Panamericanos
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="?c=losjuegos&a=index">Los Juegos</a>
                                <a class="dropdown-item" href="?c=ceremonias&a=index">Ceremonias</a>
                                <a class="dropdown-item" href="?c=sedes&a=index">Comprar Entradas</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Organización
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="?c=comiteorganizador&a=index">Comite Organizador</a>
                                <a class="dropdown-item" href="?c=organigrama&a=index">Organigrama</a>
                                <a class="dropdown-item" href="?c=reglamento&a=index">Reglamento</a>
                                <a class="dropdown-item" href="?c=preguntasFrecuentes&a=index">Preguntas Frecuentes</a>
                                <a class="dropdown-item" href="?c=decreto&a=index">Marco legal</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="?c=auspiciadores&a=index">Auspiciadores</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="?c=institucional&a=index">Institucional</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Galería
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="?c=foto&a=index">Fotos</a>
                                <a class="dropdown-item" href="?c=video&a=index">Video</a>
                                <a class="dropdown-item" href="?c=documentos&a=index">Documentos</a>
                                <a class="dropdown-item" href="?c=disciplina&a=index">Disciplinas</a>
                                <a class="dropdown-item" href="?c=participantes&a=index">Participantes</a>
                            </div>
                        </li>


                     <!--<button class="btn btn-outline-success my-2 my-sm-0" href="?c=login&a=acceso" type="submit">Iniciar Sesion</button>-->

                        <!--<li class="nav-item">-->
                        <!--    <a class="nav-link" href="#"><i class="fas fa-user"></i> Iniciar Sesion</a>-->
                        <!--</li>-->
                        
                     <!--   <li class="nav-item">-->
                     <!--       <a class="nav-link" href="?c=usuario&a=Index">Registrarse</a>-->
                     <!--   </li>-->

                        
                        

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Información
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="?c=listapaises&a=index">Lista de paises</a>
                                <a class="dropdown-item" href="?c=medallero&a=index">Medallero</a>
                                <a class="dropdown-item" href="?c=fixture&a=index">Fixture</a>
                                <a class="dropdown-item" href="?c=vivo&a=Index">Vivo</a>
                                <a class="dropdown-item" href="?c=deportista&a=index">Participantes</a>
                                <a class="dropdown-item" href="#">Voluntariado</a>
                                <a class="dropdown-item" href="?c=evento&a=index">Eventos</a>
<!--                                <div class="dropdown-divider"></div>-->
<!--                                <a class="dropdown-item" href="#">Something else here</a>-->
                            </div>
                        </li>
                        <!--                        <li class="nav-item">-->
                        <!--                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>-->
                        <!--                        </li>-->




                    </ul>

                    <!--                    <form class="form-inline my-2 my-lg-0">-->
                    <!--                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">-->
                    <!--                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>-->
                    <!--                    </form>-->
                    <ul class="nav navbar-nav navbar-right">
<!--                        <li class="nav-item">-->
<!--                            <button type="button" class="btn btn-secondary">-->
<!--                                <i class="fas fa-bell"></i> <span class="badge badge-light">4</span>-->
<!--                            </button>-->
<!--                        </li>-->

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell"></i> <span class="badge badge-warning">1</span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="?c=listapaises&a=index">Lista de paises</a>
                            </div>
                        </li>


                        <li class="nav-item">
                            <a class="nav-link" href="?c=login&a=acceso"><i class="fas fa-user"></i> Iniciar Sesion</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="?c=usuario&a=Index"><i class="fas fa-sign-out-alt"></i> Registrarse</a>
                            <!-- Button trigger modal -->
                            <!--                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">-->
                            <!--                                    <i class="fas fa-sign-out-alt"></i> Cerrar Sesión-->
                            <!--                                </button>-->
                        </li>
                    </ul>
                </div>
            </nav>

         <?php
            }
        ?>
        </div>
    </div>
</div>



            <?php
                if (isset($_SESSION['username'])){
            ?>

<div class="">
    <div class="row">
        <div class="col-md-12">

                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="http://www.tecnoweplay.com/">Weplay</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Los Panamericanos
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="?c=losjuegos&a=index">Los Juegos</a>
                                <a class="dropdown-item" href="?c=ceremonias&a=index">Ceremonias</a>
                                <a class="dropdown-item" href="?c=sedes&a=index">Comprar Entradas</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Organización
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="?c=comiteorganizador&a=index">Comite Organizador</a>
                                <a class="dropdown-item" href="?c=organigrama&a=index">Organigrama</a>
                                <a class="dropdown-item" href="?c=reglamento&a=index">Reglamento</a>
                                <a class="dropdown-item" href="?c=preguntasFrecuentes&a=index">Preguntas Frecuentes</a>
                                <a class="dropdown-item" href="?c=decreto&a=index">Marco legal</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="?c=auspiciadores&a=index">Auspiciadores</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="?c=institucional&a=index">Institucional</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Galería
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="?c=foto&a=index">Fotos</a>
                                <a class="dropdown-item" href="?c=video&a=index">Video</a>
                                <a class="dropdown-item" href="?c=documentos&a=index">Documentos</a>
                                <a class="dropdown-item" href="?c=disciplina&a=index">Disciplinas</a>
                                <a class="dropdown-item" href="?c=participantes&a=index">Participantes</a>
                            </div>
                        </li>


                     <!--<button class="btn btn-outline-success my-2 my-sm-0" href="?c=login&a=acceso" type="submit">Iniciar Sesion</button>-->

                        <!--<li class="nav-item">-->
                        <!--    <a class="nav-link" href="#"><i class="fas fa-user"></i> Iniciar Sesion</a>-->
                        <!--</li>-->
                        
                     <!--   <li class="nav-item">-->
                     <!--       <a class="nav-link" href="?c=usuario&a=Index">Registrarse</a>-->
                     <!--   </li>-->

                        
                        

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Información
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="?c=listapaises&a=index">Lista de paises</a>
                                <a class="dropdown-item" href="?c=medallero&a=index">Medallero</a>
                                <a class="dropdown-item" href="?c=fixture&a=index">Fixture</a>
                                <a class="dropdown-item" href="?c=vivo&a=Index">Vivo</a>
                                <a class="dropdown-item" href="?c=deportista&a=index">Participantes</a>
                                <a class="dropdown-item" href="#">Voluntariado</a>
                                <a class="dropdown-item" href="?c=evento&a=index">Eventos</a>
<!--                                <div class="dropdown-divider"></div>-->
<!--                                <a class="dropdown-item" href="#">Something else here</a>-->
                            </div>
                        </li>
                        <?php
                        if(isset($_SESSION['username'])) { ?>
                            <li class="nav-item">
                                 <a class="nav-link" href="#">BIENVENIDO:  <?php echo $_SESSION['username']; ?></a>
                             </li>
                        <?php }?>
                        <!--                        <li class="nav-item">-->
                        <!--                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>-->
                        <!--                        </li>-->




                    </ul>

                    <!--                    <form class="form-inline my-2 my-lg-0">-->
                    <!--                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">-->
                    <!--                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>-->
                    <!--                    </form>-->
                    <ul class="nav navbar-nav navbar-right">
<!--                        <li class="nav-item">-->
<!--                            <button type="button" class="btn btn-secondary">-->
<!--                                <i class="fas fa-bell"></i> <span class="badge badge-light">4</span>-->
<!--                            </button>-->
<!--                        </li>-->

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell"></i> <span class="badge badge-warning">1</span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="?c=listapaises&a=index">Lista de paises</a>
                            </div>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="?c=usuario&a=perfil"><i class="fas fa-user"></i> Perfil</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-sign-out-alt"></i> Cerrar Sesion</a>
                            <!-- Button trigger modal -->
                            <!--                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">-->
                            <!--                                    <i class="fas fa-sign-out-alt"></i> Cerrar Sesión-->
                            <!--                                </button>-->
                        </li>
                    </ul>
                </div>
            </nav>




                        


                <?php
                 }
            ?>


        </div>
    </div>
</div>



<!-- Modal Cerrar sesion -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Cerrar</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                ¿Salir de la aplicación?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <a href="?c=Login&a=CerrarSession" class="btn btn-danger">Cerrar Sesión</a>
            </div>
        </div>
    </div>
</div>

