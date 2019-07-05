<div class="container">
    <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="card">
            <div class="card-header">
                <div class="card-title">Recuperar Contraseña</div>
                <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="?c=login&a=acceso">Iniciar
                        Sesi&oacute;n</a></div>
            </div>

            <div style="padding-top:30px" class="card-body">

                <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                <form id="loginform" class="form-horizontal" role="form" action="?c=usuario&a=recuperar_pass" method="POST" autocomplete="off">

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="email" type="email" class="form-control" name="email" placeholder="Ingrese su Email" required>
                    </div>

                    <div style="margin-top:10px" class="form-group">
                        <div class="col-sm-12 controls">
                            <button id="btn-login" type="submit" class="btn btn-success">Enviar</a>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-12 control">
                            <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%">
                                No tiene una cuenta! <a href="?c=usuario&a=Index">Registrate aquí</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>