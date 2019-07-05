<style>

body{
    margin: 0;
}

video{
    position: fixed;
    min-width: 100%;
    min-height: 100%;
    
    top: 50%;
    left: 50%;
    
    transform: translateX(-50%) translateY(-50%);
    z-index: -1;
    
}
</style>
<video src="../assets/images/lima.mp4" autoplay loop muted poster="../assets/images/lima.jpeg">
</video>


<div class="container">
    <div id="signupbox" style="margin-top:5px" style="background-color: black" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="card card-success ">
            <div class="card-header">
                <div class="card-title" style="background-color: black">Reg&iacute;strate - Juegos LIMA 2019</div>
                <div style="color: black;  float:right; font-size: 80%; position: relative; top:-1px"><a
                        id="signinlink" href="?c=login&a=acceso">Iniciar Sesi&oacute;n</a></div>
            </div>

            <div class="card-body" style="background-color: black">
                <form id="signupform" class="form-horizontal" role="form" action="?c=usuario&a=validar_registro"
                    method="POST" autocomplete="off">
            
                    <div id="signupalert" style="display:none" class="alert alert-info" role="alert">
                        <p>Error:</p>
                        <span></span>
                    </div>
                    
                     <div class="form-row">
                        <div class="form-group col-md-6">
                           <input type="text" class="form-control" name="nombre" placeholder="Nombre" value="<?php if(isset($nombre)) echo $nombre; ?>">
                        </div>
                        <div class="form-group col-md-6">
                         <input type="text" class="form-control" name="apellidos" placeholder="Apellidos" value="<?php if(isset($apellidos)) echo $apellidos; ?>">
                        </div>
                      </div>

                      <div class="form-group">
                            <input type="text" class="form-control" name="usuario" placeholder="Usuario"
                                value="<?php if(isset($usuario)) echo $usuario; ?>">
                    </div>
                    
                     <div class="form-row">
                        <div class="form-group col-md-6">
                            <input type="text" class="form-control" name="documento" placeholder="Documento Identidad"
                                value="<?php if(isset($documento)) echo $documento; ?>">
                        </div>
                        <div class="form-group col-md-6">
                            <input type="text" class="form-control" name="telefono" placeholder="Telefono"
                                value="<?php if(isset($telefono)) echo $telefono; ?>">
                        </div>
                    </div>

                    <div class="form-group">
                            <input type="email" class="form-control" name="email" placeholder="Email"
                                value="<?php if(isset($email)) echo $email; ?>">
                    </div>

                     <div class="form-group">
                            <input type="password" id="password" class="form-control" name="password"
                                placeholder="Password">
                    </div>
                    <div id="progress-bar bg-danger"></div>

                  <div class="form-group">
                            <input type="password" class="form-control" name="con_password"
                                placeholder="Confirmar Password">
                    </div>
                    <div id="progress-bar bg-danger"></div>

                   <div class="form-group">
                        <label for="captcha" class="col"></label>
                        <div class="g-recaptcha col-md-9" data-sitekey="6LeUoaoUAAAAAD6hGwEoU_ypK7Q-wPA95UBqA-Di"></div>
                        <!-- Modificar -->
                    </div>

                    <div class="form-group">
                            <button type="submit" class="btn btn-info"><i class="icon-hand-right"></i>Registrar</button>
                    </div>   
                    
                    <?php echo $fallas; ?> 

                </form>



               
                
                <?php //echo  $row->errors; ?>

                <?php // endforeach; ?>       

                </div>
            </div>
           
        </div>
        
    </div>