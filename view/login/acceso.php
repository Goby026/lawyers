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
    <div class="card card-login mx-auto text-center bg-dark">
        <div class="card-header mx-auto bg-dark">
            <span> <img src="http://depor.com/files/article_main/uploads/2019/05/23/5ce7121847fd1.jpeg" class="w-75" alt="Logo"> </span><br/>
                        <span class="logo_title mt-5"> Iniciar Sesion - Lima 2019</span>
<!--            <h1>--><?php //echo $message?><!--</h1>-->

        </div>
        <div class="card-body">
            <form action="?c=login&a=validar" method="post">
               <div class="social-login col-md-7">
                <button onclick="ingresar();" class="btn facebook-btn social-btn" type="button"><span><i
                        class="fab fa-facebook-f"></i> Iniciar con Facebook</span> </button>
                 </div>
                <div class="input-group form-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                    </div>
                    <input type="text" name="email" class="form-control" placeholder="Usuario o Email">
                </div>

                <div class="input-group form-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                    </div>
                    <input type="password" name="password" class="form-control" placeholder="Password">
                </div>

                <div class="form-group">
                    <input type="submit" name="btn" value="Acceder" class="btn btn-outline-danger float-right login_btn">
                </div>

            </form>
        </div>
    </div>
</div>