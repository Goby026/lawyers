<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--    Bootstrap-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Font Awesome -->
    <!--    <link rel="stylesheet" href="./css/font-awesome/css/font-awesome.min.css">-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
          integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

    <!--    Bootstrap Select-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">


    <link rel="icon" type="" href="./assets/images/logo.png"/>

    <!--    custom styles   -->
    <link rel="stylesheet" href="./assets/css/styles.css">


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>

    <!--QuickSearch-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.4.0/jquery.quicksearch.min.js" integrity="sha256-hD1kpQcVntR40eMx9uED+E4HAjD2OJkLIFcP6ukVd+g=" crossorigin="anonymous"></script>


    <!--stripe-->
    <script src="https://js.stripe.com/v3/"></script>

    <title>System-case</title>

</head>

<body>

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

        <?php
        if (isset($_SESSION['auth'])) {
            ?>
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
                                    aria-expanded="false">Mi cuenta
                            </button>

                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a href="?c=caso&a=index" class="dropdown-item" href="">Registrar Nuevo Caso</a>
                                <a href="?c=cliente&a=index" class="dropdown-item">Clientes</a>
                                <a href="/calendar" class="dropdown-item">Calendario</a>
                                <a href="?c=mantenimiento&a=index" class="dropdown-item">Mantenimiento</a>
                                <a href="/modelos" class="dropdown-item">Modelos</a>
                                <a class="dropdown-item" href="?c=usuario&a=perfil">Configuración</a>
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

            <?php
        } else {
            ?>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                    <li class="nav-item">
                        <a href="?c=login&index" class="btn btn-light">
                            <i class="fas fa-user"></i>
                            Iniciar Sesión
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="?c=usuario&a=index" class="btn btn-light">
                            <i class="fas fa-user-plus"></i>
                            Registrarse
                        </a>
                    </li>
                </ul>
            </div>
            <?php
        }
        ?>
    </nav>
</div>

<script>
    $(document).ready(function () {
        // console.log('HOLA JQUERY');
        $.ajax({
            type: 'POST',
            dataType: "json",
            url: "?c=index&a=cargarMenu",
            //data: datos,
            success: function (response) {
                // console.log(response);
                $("#contador").text(response.length);
                for (var k in response) {
                    console.log('OK');
                    // $("#notificaciones").text(response[k].descripcion);
                    $("#notificaciones").append("<a class='dropdown-item' href='?c=notificacion&a=index'>" + response[k].icono + " " + response[k].descripcion + "</a>");
                }
            }
        });
    });
</script>
