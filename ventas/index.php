<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=gb18030">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>

<!--<header>-->
<!--    <nav class="navbar navbar-expand-md navbar-dark bg-dark">-->
<!--        <a class="navbar-brand" href="index.php"><img src="./img/logo.png" alt="" width="80px"></a>-->
<!--        <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId" aria-controls="collapsibleNavId"-->
<!--            aria-expanded="false" aria-label="Toggle navigation">-->
<!--            <span class="navbar-toggler-icon"></span>-->
<!--        </button>-->
<!--        <div class="collapse navbar-collapse" id="collapsibleNavId">-->
<!--            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">-->
<!--                <li class="nav-item active">-->
<!--                    <a class="nav-link" href="index.php">Inicio <span class="sr-only">(current)</span></a>-->
<!--                </li>-->
<!--                <li class="nav-item">-->
<!--                    <a class="nav-link" href="sedes.php">Sedes</a>-->
<!--                </li>-->
<!--            </ul>-->
<!--            <ul class="navbar-nav ml-auto mt-2 mt-lg-0">-->
                
<!--                <?php if(isset($_SESSION['usuario'])) { ?>-->
<!--                    <li class="nav-item dropdown">-->
<!--                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">-->
<!--                        <?php echo $_SESSION['usuario'][0]['Usuario'] ?>-->
<!--                        </a>-->
<!--                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">-->
<!--                            <a class="dropdown-item" href="#" id="cerrar">Cerrar Sesión</a>-->
<!--                        </div>-->
<!--                    </li>-->
<!--                <?php } else { ?>-->
<!--                    <li class="nav-item">-->
<!--                        <a class="nav-link" href="login.php">Inicar Sesión</a>-->
<!--                    </li>-->
<!--                <?php } ?>-->
<!--            </ul>-->
<!--        </div>-->
<!--    </nav>-->
<!--</header>-->
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
                        <li class="nav-item">
                            <a class="nav-link" href="../index.php">Inicio</a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell"></i> <span class="badge badge-warning">1</span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="?c=listapaises&a=index">Lista de paises</a>
                            </div>
                        </li>
                        <li class="nav-item">
                                 <a class="nav-link" href="#">BIENVENIDO:  <?php echo $_SESSION['username']; ?></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-sign-out-alt"></i> Cerrar Sesion</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</div>

<section>
    <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="./img/slider/2.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="./img/slider/3.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="./img/slider/4.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="./img/slider/5.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</section>
<main>
    <div class="">
        <div class="row">
            <div class="col-md-12">

                

            </div>
        </div>
    </div>
</main>


    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/function.js"></script>
</body>
</html>

