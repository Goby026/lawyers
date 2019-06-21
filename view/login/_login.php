<main>
    <div class="container">
    <body class="login">
    <div>
        <img src="./assets/images/panamericanos.png" class="img-responsive text-center" alt="">
        <div class="login_wrapper">
            <div class="animate form login_form">
                <?php
                if ( isset($_GET['error']) ){
                    if ( $_GET['error'] == 'authFalse' ){

                        ?>

                        <div class="alert alert-danger" role="alert">
                            No encontramos tus credenciales en nuestra base de datos.
                        </div>

                        <?php

                    }
                }
                ?>
                <section class="login_content">
                    <form action="?c=Login&a=Acceder" method="post">
                        <h1>Panamericanos</h1>
                        <div>
                            <input type="text" name="email" class="form-control" placeholder="Correo Electrónico" required />
                        </div>
                        <div>
                            <input type="password" name="password" class="form-control" placeholder="Contraseña" required/>
                        </div>
                        <div>
                            <button type="submit" name="token" value="Login" class="btn btn-default">Iniciar Sesion</button>
                            <a class="reset_pass" href="#">Olvidaste Tu contraseña?</a>
                        </div>
                        <div class="clearfix"></div>
                        <div class="separator">
                            <div class="clearfix"></div>
                            <br />
                            <div>
                                <h1><i class="fa fa-ticket"></i> Lima 2019</h1>
                            </div>
                        </div>
                    </form>
                </section>
            </div>
        </div>
    </div>
    </body>
</div>
</main>
