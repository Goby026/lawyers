<?php
    session_start();

    if(isset($_POST['id'])) {
        $_SESSION['IdSede'] = $_POST['id'];
    } else {
        require 'php/get.php';
        $get = new get();

        $result = $get->getSP("get_CategoriaAsiento()");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <a class="navbar-brand" href="index.php"><img src="./img/logo.png" alt="" width="80px"></a>
        <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId" aria-controls="collapsibleNavId"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavId">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="index.php">Inicio <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="sedes.php">Sedes</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                
                <?php if(isset($_SESSION['usuario'])) { ?>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <?php echo $_SESSION['usuario'][0]['Usuario'] ?>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#" id="cerrar">Cerrar Sesión</a>
                        </div>
                    </li>
                <?php } else { ?>
                    <li class="nav-item">
                        <a class="nav-link" href="login.php">Inicar Sesión</a>
                    </li>
                <?php } ?>
            </ul>
        </div>
    </nav>
</header>
    <div class="container mt-5">
        <h2 class="text-center mt-4 mb-4">Categorias de entradas</h2>
        <hr>
        <div class="row">
            <div class="col-md-12 col-lg-8 text-center mt-5">
                <img src="img/2.png" alt="" width="60%">
            </div>
            <div class="col-md-12 col-lg-4 mt-5">
                <?php while ($row = $result->fetch_array()) { ?>
                    <div class="row m-2 text-center">
                        <div class="col-6">
                            <label for=""><?php echo $row['NombreCategoriaA'] ?></label>
                        </div>
                        <?php
                        
                            if($row['NombreCategoriaA'] == 'Categoría 1'){
                                $color="e75ba1";
                            }
                            if($row['NombreCategoriaA'] == 'Categoría 2'){
                                $color="288e6c";
                            }
                            if($row['NombreCategoriaA'] == 'Categoría 3'){
                                $color="8d52c8";
                            }
                            if($row['NombreCategoriaA'] == 'Categoría 4'){
                                $color="f5a70a";
                            }
                            if($row['NombreCategoriaA'] == 'Palco'){
                                $color="cac6be";
                            }
                                
                        
                        ?>
                        <div class="col-6">
                            <button class="btn ver" id="<?php echo $row['idCategoriaAsiento']; ?>" style="background: #<?php echo $color; ?>">Ver</button>
                        </div>
                    </div>
                <?php } $result->free_result(); ?>
            </div>
            
        </div>
    </div>

    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $('.ver').click(function (e) { 
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: "tribunas.php",
                data: {id: $(this).attr('id')},
                success: function (response) {
                    window.location.href = "tribunas.php";
                }
            });
        });
    </script>
</body>
</html>
<?php } ?>