<div class="container">
            <div id="signupbox" style="margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="card card-success ">    
                    <div class="card-header">
                        <div class="card-title">Reg&iacute;strate - Juegos Panamericanos Lima 2019</div>
                        <div style="color: green;  float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="?c=login&a=acceso">Iniciar Sesi&oacute;n</a></div>
                    </div>  
                    
                    <div class="card-body"  style="background-color: #FFF" >
                        <form id="signupform" class="form-horizontal" role="form" action="?c=usuario&a=validar_registro" method="POST" autocomplete="off">
                            
                            <div id="signupalert" style="display:none" class="alert alert-info">
                                <p>Error:</p>
                                <span></span>
                            </div>
                            
                            <div class="form-group">
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="nombre" placeholder="Nombre" value="<?php if(isset($nombre)) echo $nombre; ?>" >
                                </div>

                                 <div class="col-md-6">
                                    <input type="text" class="form-control" name="apellidos" placeholder="Apellidos" value="<?php if(isset($apellidos)) echo $apellidos; ?>" >
                                  </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="text" class="form-control" name="usuario" placeholder="Usuario" value="<?php if(isset($usuario)) echo $usuario; ?>" >
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="documento" placeholder="Documento Identidad" value="<?php if(isset($documento)) echo $documento; ?>" >
                                </div>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="telefono" placeholder="Telefono" value="<?php if(isset($telefono)) echo $telefono; ?>" >
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="email" class="form-control" name="email" placeholder="Email" value="<?php if(isset($email)) echo $email; ?>" >
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="password" id="password" class="form-control" name="password" placeholder="Password" >
                                </div>
                            </div>
                            <div id="progress-bar bg-danger"></div>

                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="password" class="form-control" name="con_password"  placeholder="Confirmar Password" >
                                </div>
                            </div>
                            <div id="progress-bar bg-danger"></div>

                            <div class="form-group">
                                <label for="captcha" class="col-md-2 control-label"></label>
                                <div class="g-recaptcha col-md-9" data-sitekey="6LewZqUUAAAAAEG_IhkR1ZQkZicZdI6QnlwnnYCw"></div> <!-- Modificar -->
                            </div>
                            
                            <div class="form-group">                             
                                <div class="col-md-offset-4 col-md-9">
                                    <button id="btn-signup" type="submit" class="btn btn-info"><i class="icon-hand-right"></i>Registrar</button> 
                                </div>
                            </div>
                        </form>
                         <?php //echo resultBlock($errors); ?> 
                    </div>
                </div>
            </div>
        </div>