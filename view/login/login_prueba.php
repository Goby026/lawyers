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
<div id="logreg-forms">
    <form class="form-signin" action="?c=login&a=validar" method="POST">
        <h1 class="h3 mb-3 TEXT-TRANSFORM: UPPERCASE" style="text-align: center">LIMA 2019</h1>
        <!--<div class="social-login col-md-7">-->
        <!--    <button onclick="ingresar();" class="btn facebook-btn social-btn" type="button"><span><i-->
        <!--                class="fab fa-facebook-f"></i> Iniciar con Facebook</span> </button>-->
        <!--</div>-->

        <div class="form-group">
            <input type="email" class="form-control" id="usuario" name="usuario"
                placeholder="Usuario o Email" required" autocomplete="on">
            <!-- <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="" autofocus=""> -->
        </div>


        <div class="form-group">
            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
            <!-- <input type="password" id="inputPassword" class="form-control" placeholder="Password" required=""> -->
        </div>

        <div class="input-group">

            <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Iniciar
                sesión</button>
        </div>

        <a href="?c=usuario&a=recupera" class="reset_pass" id="forgot_pswd">Olvidaste Tu contraseña?</a>
        <hr>
        <!-- <p>Don't have an account!</p>  -->
        <a href="?c=usuario&a=Index" class="btn btn-primary btn-block" type="button" id="btn-signup"><i
                class="fas fa-user-plus"></i>Registrar Nueva Cuenta</a>
    </form>

    <form action="#" class="form-reset">
        <input type="email" id="resetEmail" class="form-control" placeholder="Email address" required="" autofocus="">
        <button class="btn btn-primary btn-block" type="submit">Reset Password</button>
        <a href="#" id="cancel_reset"><i class="fas fa-angle-left"></i> Back</a>
    </form>
    <br>

</div>