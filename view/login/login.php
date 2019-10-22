<div class="container">
    <?php
    if (isset($error)) {
        ?>
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-danger" role="alert">
                    <?php echo $error; ?>
                </div>
            </div>
        </div>
        <?php
    } else if (isset($success)) {
        ?>
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-success" role="alert">
                    <?php echo $success; ?>
                </div>
            </div>
        </div>
        <?php
    }
    ?>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <!-- Image and text -->
                    <nav class="navbar navbar-light bg-light">
                        <h3>INICIAR SESION</h3>
                        <hr>
                        <a class="navbar-brand my-2 text-right" href="">
                            <img src="./assets/images/logo.png" class="img img-fluid d-inline-block align-top w-25"
                                 alt="">
                        </a>
                    </nav>

                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6 border-right border-dark">
                            <section>
                                <form action="?c=login&a=acceder" method="post">
                                    <div class="form-group">
                                        <label for="usuario">USUARIO O CORREO</label>
                                        <input name="username" type="text" class="form-control" id="usuario"
                                               aria-describedby="usuarioHelp" placeholder="usuario / correo">
                                    </div>
                                    <div class="form-group">
                                        <label for="password">CONTRASEÑA</label>
                                        <input name="password" type="password" class="form-control" id="password"
                                               placeholder="contraseña">
                                    </div>
                                    <button type="submit" class="btn btn-success btn-block">INICIAR SESION</button>
                                </form>
                                <div class="text-center mt-3">
                                    <!-- <a  href="">registrarme</a> -->
                                    <a href="?c=usuario&a=index" class="alert-link">registrarme</a>
                                </div>
                                <div class="text-center mt-3">
                                    <!-- <a  href="">registrarme</a> -->
                                    <a href="?c=usuario&a=index" class="text-muted">recuperar contraseña</a>
                                </div>
                            </section>
                        </div>
                        <div class="col-md-6 my-auto">
                            <section>
                                <button class="btn btn-light btn-outline btn-block"><i class="fab fa-google"></i>
                                    Conectarme con mi cuenta de
                                    google
                                </button>
                                <button class="btn btn-light btn-outline btn-block"><i class="fab fa-facebook-f"></i>
                                    Conectarme con mi cuenta de
                                    facebook
                                </button>
                            </section>
                        </div>
                    </div>
                </div>
                <div class="card footer">

                </div>
            </div>
        </div>
    </div>
</div>
