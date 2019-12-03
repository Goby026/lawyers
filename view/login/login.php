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
    }else if (isset($msg)){
    ?>
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-success" role="alert">
                    <?php echo $msg; ?>
                </div>
            </div>
        </div>
    <?php
    }else if (isset($msgerr)){
    ?>
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-danger" role="alert">
                    <?php echo $msgerr; ?>
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
                                <form action="?c=login&a=validar" method="post">
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
                                    <a href="?c=login&a=recuperarview" class="text-muted">recuperar contraseña</a>
                                </div>
                            </section>
                        </div>
                        <div class="col-md-6 my-auto">
<!--                            <section>-->
<!--                                <button class="btn btn-light btn-outline btn-block"><i class="fab fa-google"></i>-->
<!--                                    Conectarme con mi cuenta de-->
<!--                                    google-->
<!--                                </button>-->
<!--                                <fb:login-button scope="public_profile,email" onlogin="checkLoginState();" class="btn btn-light btn-outline btn-block">-->
<!--                                    <i class="fab fa-facebook-f"></i>-->
<!--                                    Conectarme con mi cuenta de-->
<!--                                    facebook-->
<!--                                </fb:login-button>-->
<!--                                <button class="btn btn-light btn-outline btn-block"><i class="fab fa-facebook-f"></i>-->
<!--                                    Conectarme con mi cuenta de-->
<!--                                    facebook-->
<!--                                </button>-->
<!--                                <div id="status">-->
<!--                                </div>-->
<!--                            </section>-->
                        </div>
                    </div>
                </div>
                <div class="card footer">

                </div>
            </div>
        </div>
    </div>
</div>

<script>
//
//    function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
//        console.log('statusChangeCallback');
//        console.log(response);                   // The current login status of the person.
//        if (response.status === 'connected') {   // Logged into your webpage and Facebook.
//            testAPI();
//        } else {                                 // Not logged into your webpage or we are unable to tell.
//            document.getElementById('status').innerHTML = 'Please log ' +
//                'into this webpage.';
//        }
//    }
//
//
//    function checkLoginState() {               // Called when a person is finished with the Login Button.
//        FB.getLoginStatus(function(response) {   // See the onlogin handler
//            statusChangeCallback(response);
//        });
//    }
//
//
//    window.fbAsyncInit = function() {
//        FB.init({
//            appId      : '748531175552340',
//            cookie     : true,                     // Enable cookies to allow the server to access the session.
//            xfbml      : true,                     // Parse social plugins on this webpage.
//            version    : 'v5.0'           // Use this Graph API version for this call.
//        });
//
//
//        FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
//            statusChangeCallback(response);        // Returns the login status.
//        });
//    };
//
//
//    (function(d, s, id) {                      // Load the SDK asynchronously
//        var js, fjs = d.getElementsByTagName(s)[0];
//        if (d.getElementById(id)) return;
//        js = d.createElement(s); js.id = id;
//        js.src = "https://connect.facebook.net/en_US/sdk.js";
//        fjs.parentNode.insertBefore(js, fjs);
//    }(document, 'script', 'facebook-jssdk'));
//
//
//    function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
//        console.log('Welcome!  Fetching your information.... ');
//
//        FB.api('/me?fields=id,email,first_name,middle_name,last_name', function(response) {
//            console.log('Successful login for: ' + response.email);
//            // document.getElementById('status').innerHTML =
//            //     'Thanks for logging in, ' + response.name + '!';
//
//            var nombres = response.first_name+" "+response.middle_name;
//
//            // if (registerFB(response.id,nombres,response.last_name,response.email)){
//            //     window.location.href = "?c=index&a=index";
//            // }
//
//            console.log(registerFB(response.id,nombres,response.last_name,response.email));
//
//        });
//
//    }
//
//
//    function registerFB(id,nombres,apellidos,email){
//        datos = {
//            id : id,
//            nombres : nombres,
//            apellidos : apellidos,
//            email : email,
//        };
//
//
//        $.ajax({
//            type: 'POST',
//            dataType: "json",
//            url: "?c=login&a=validarFb",
//            data: datos,
//            success: function (response) {
//                return response;
//            }
//        });
//    }

</script>
