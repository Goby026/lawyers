<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--    Bootstrap cdn-->
    <!--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"-->
    <!--          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">-->

    <!-- Bootstrap core CSS -->
    <link href="./assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome cdn -->
    <!--    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"-->
    <!--          integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">-->

    <!-- Custom fonts for this template -->
    <link href="./assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="./assets/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet"
          type="text/css">

    <!-- Custom styles for this template -->
    <link href="./assets/css/landing-page.min.css" rel="stylesheet">

    <!--    Bootstrap Select-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">


    <!--favicon-->
    <link rel="icon" type="" href="./assets/images/logo.png"/>

    <!--    custom styles   -->
    <link rel="stylesheet" href="./assets/css/styles.css">

    <!-- Bootstrap core JavaScript -->
    <script src="./assets/vendor/jquery/jquery.min.js"></script>
    <script src="./assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Full calendar -->
    <link href='./assets/js/packages/core/main.css' rel='stylesheet'/>
    <link href='./assets/js/packages/daygrid/main.css' rel='stylesheet'/>
    <link href='./assets/js/packages/list/main.css' rel='stylesheet'/>
    <link href='./assets/js/packages/timegrid/main.css' rel='stylesheet'/>

    <script src='./assets/js/packages/core/main.js'></script>
    <script src='./assets/js/packages/daygrid/main.js'></script>
    <script src='./assets/js/packages/list/main.js'></script>
    <script src='./assets/js/packages/timegrid/main.js'></script>


    <!--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>-->
    <!--    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"-->
    <!--            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"-->
    <!--            crossorigin="anonymous"></script>-->
    <!--    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"-->
    <!--            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"-->
    <!--            crossorigin="anonymous"></script>-->

    <!--QuickSearch-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.4.0/jquery.quicksearch.min.js"
            integrity="sha256-hD1kpQcVntR40eMx9uED+E4HAjD2OJkLIFcP6ukVd+g=" crossorigin="anonymous"></script>


    <!--stripe-->
    <script src="https://js.stripe.com/v2/"></script>

    <title>System-case</title>

</head>

<body>

<?php
if (isset($_SESSION['auth'])) {
    ?>
    <!--Navbar-->
    <div class="container-fluid navegacion">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <button
                    class="navbar-toggler"
                    type="button"
                    data-toggle="collapse"
                    data-target="#navbarTogglerDemo03"
                    aria-controls="navbarTogglerDemo03"
                    aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <a class="navbar-brand" href="?c=home">
                <img src="./assets/images/logo.png" class="d-inline-block align-top img-fluid" style="width: 10%"/>
            </a>


            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                    <li class="nav-item">
                        <a href="?c=index" class="btn btn-light text-monospace" tabindex="-1">
                            <i class="fas fa-home"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <div class="dropdown">
                            <button
                                    class="btn btn-light dropdown-toggle text-monospace"
                                    type="button"
                                    id="dropdownMenuButton"
                                    data-toggle="dropdown"
                                    aria-haspopup="true"
                                    aria-expanded="false">
                                <i class="far fa-bell"></i>
                                <span class="badge badge-info" id="contador">-</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <div id="notificaciones"></div>
                                <div class="dropdown-divider"></div>
                                <a href="?c=notificacion&a=index" class="dropdown-item">Mis Notificaciones</a>
                                <a href="?c=notificacion&a=config" class="dropdown-item">Configurar Notificaciones</a>
                            </div>
                        </div>
                    </li>
                    <!--                    <li class="nav-item">-->
                    <!--                        <div class="dropdown">-->
                    <!--                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"-->
                    <!--                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">-->
                    <!--                                <i class="fas fa-bell"></i> <span class="badge badge-warning" id="contador">-</span>-->
                    <!--                            </a>-->
                    <!--                            <div id="notificaciones" class="dropdown-menu" aria-labelledby="navbarDropdown">-->
                    <!---->
                    <!--                            </div>-->
                    <!--                        </div>-->
                    <!--                    </li>-->
                    <li class="nav-item">
                        <div class="dropdown">
                            <button
                                    class="btn btn-light dropdown-toggle text-monospace"
                                    type="button"
                                    id="dropdownMenuButton"
                                    data-toggle="dropdown"
                                    aria-haspopup="true"
                                    aria-expanded="false"><?php echo $_SESSION['user_data']; ?>
                            </button>

                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a href="?c=caso&a=index" class="dropdown-item" href="">Registrar Nuevo Caso</a>
                                <a href="?c=cliente&a=index" class="dropdown-item">Clientes</a>
                                <a href="?c=calendario&a=index" class="dropdown-item">Calendario</a>
                                <a href="?c=mantenimiento&a=index" class="dropdown-item">Mantenimiento</a>
<!--                                <a href="/modelos" class="dropdown-item">Modelos</a>-->
                                <a class="dropdown-item" href="?c=usuario&a=perfil">Configuración</a>
<!--                                <a class="dropdown-item" href="?c=pagosad&a=setPayment">stripe</a>-->
                            </div>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="?c=login&a=cerrarsession" class="nav-link" tabindex="-1" aria-disabled="true">
                            <p class="text-monospace">
                                <i class="fa fa-sign-out" aria-hidden="true"></i> Salir
                            </p>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>

    <?php
} else {
    ?>
    <!-- Navigation -->
    <nav class="navbar navbar-light bg-light static-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="?c=home">
                <img src="./assets/images/logo.png" class="d-inline-block align-top img-fluid" style="width: 10%"/>
            </a>
<!--            <a class="navbar-brand" href="#">Start Bootstrap</a>-->
            <!--        <a class="btn btn-primary" href="#">Sign In</a>-->
            <a href="?c=login&index" class="btn btn-primary">
                <!--            <i class="fas fa-user"></i>-->
                Acceder / Registro
            </a>
        </div>
    </nav>
    <!--            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">-->
    <!--                <ul class="navbar-nav ml-auto mt-2 mt-lg-0">-->
    <!--                    <li class="nav-item">-->
    <!--                        <a href="?c=login&index" class="btn btn-light">-->
    <!--                            <i class="fas fa-user"></i>-->
    <!--                            Iniciar Sesión-->
    <!--                        </a>-->
    <!--                    </li>-->
    <!--                    <li class="nav-item">-->
    <!--                        <a href="?c=usuario&a=index" class="btn btn-light">-->
    <!--                            <i class="fas fa-user-plus"></i>-->
    <!--                            Registrarse-->
    <!--                        </a>-->
    <!--                    </li>-->
    <!--                </ul>-->
    <!--            </div>-->
    <?php
}
?>