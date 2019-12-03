<div class="container">
    <?php
    if (isset($error)){
        ?>
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-danger" role="alert">
                    <?php echo $error;?>
                </div>
            </div>
        </div>
        <?php
    }
    ?>
    <div class="row align-middle">
        <div class="col-md-6 offset-3">
            <div class="card">
                <img src="./assets/images/lawyer_web.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <form action="?c=usuario&a=guardar" method="post">
                        <div class="form-group">
                            <label for="correo">Correo electrónico</label>
                            <input type="email" name="email" class="form-control" id="correo" aria-describedby="emailHelp" placeholder="Ingrese correo electrónico" required>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" name="password" class="form-control" placeholder="Password" required>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Confirmar Password</label>
                            <input type="password" name="repassword" class="form-control"placeholder="Re-password" required>
                        </div>
                        <div class="form-group form-check">
                            <input type="checkbox" name="terminos" class="form-check-input" id="terminos" required>
                            <label class="form-check-label" for="terminos">Acepto los <a href="">términos y condiciones</a></label>
                        </div>
<!--                        <fb:login-button scope="public_profile,email" onlogin="checkLoginState();" class="btn btn-light btn-outline btn-block">-->
<!--                            <i class="fab fa-facebook-f"></i>-->
<!--                            Registrarme con facebook-->
<!--                        </fb:login-button>-->

                        <button type="submit" class="btn btn-primary btn-block">Registro</button>

                    </form>
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
//            registerFB(response.id,nombres,response.last_name,response.email);
//
//        });
//
//    }
//
//
//    function registerFB(id,nombres,apellidos,email){
//
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
//                console.log(response);
//                window.location.href = "?c=index&a=index";
//            }
//        });
//    }

</script>