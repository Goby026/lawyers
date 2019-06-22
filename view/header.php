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

    <link href="./assets/css/styles.css" rel="stylesheet" />
    <link href="./assets/css/style.css" rel="stylesheet" />
    <!--    <link rel="stylesheet" href="./css/css.css" type="text/css">-->

    <!--    <link rel="icon" type="" href="./img/icon_inicio.png"/>-->
    <link rel="icon" type="" href="./assets/images/icon_inicio.png"/>
    <!--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->

    <title>Weplay-Lima2019</title>

    <!--    <script type="text/javascript">-->
    <!--        $(document).ready(inicio)-->
    <!--        function inicio() {-->
    <!--            $("select").change(cambiacss)-->
    <!--        }-->
    <!--        function cambiacss() {-->
    <!--            var plantilla = $("select").attr("value");-->
    <!--            $("plantilla").html('<link rel="stylesheet" href="css/' + plantilla + '.css" type="text/css">')-->
    <!--        }-->
    <!--    </script>-->

</head>

<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">

            <?php
            if (isset($_SESSION['id_usuario'])){
                ?>

                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="#">Weplay</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="?c=Index&a=index">Inicio <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Los Panamericanos
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="?c=losjuegos&a=index">Los Juegos</a>
                                <a class="dropdown-item" href="?c=ceremonias&a=index">Ceremonias</a>
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
                                Información
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="?c=listapaises&a=index">Lista de paises</a>
                                <a class="dropdown-item" href="?c=medallero&a=index">Medallero</a>
                                <a class="dropdown-item" href="?c=fixture&a=index">Fixture</a>
                                <a class="dropdown-item" href="#">Vivo</a>
                                <a class="dropdown-item" href="?c=foto&a=index">Fotos</a>
                                <a class="dropdown-item" href="?c=video&a=index">Video</a>
                                <a class="dropdown-item" href="?c=documentos&a=index">Documentos</a>
                                <a class="dropdown-item" href="?c=disciplina&a=index">Disciplina</a>
                                <a class="dropdown-item" href="?c=participantes&a=index">Participantes</a>
                                <a class="dropdown-item" href="#">Voluntariado</a>
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
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fas fa-user"></i> Mi Perfil</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
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

