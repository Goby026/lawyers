<div class="container">

    <div class="row">
        <div class="col-md-4 offset-4">
            <div class="jumbotron">
                <form action="?c=login&a=validar" method="POST">
                    <div class="form-group">
                        <input type="email" class="form-control" id="usuario" name="usuario"
                            aria-describedby="emailHelp" placeholder="Usuario ó Email" required">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="password" name="password"
                            placeholder="Password">
                    </div>
                    <button onclick="ingresar();">Ingresar con Facebook</button>
                    <div>
                        <button type="submit" name="token" value="Login" class="btn btn-default">Iniciar
                            Sesi&oacute;n</button>
                        <a class="reset_pass" href="recupera.php">Olvidaste Tu contraseña?</a>
                    </div>


                    <div>
                        <h1><i class="fa fa-ticket"></i> Lima 2019</h1>
                    </div>
                </form>
            </div>


        </div>

    </div>

</div>