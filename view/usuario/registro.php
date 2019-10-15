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
                        <button type="submit" class="btn btn-primary btn-block">Registro</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
