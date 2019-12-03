<div class="container mt-4">
    <div class="row">
        <div class="col-md-8">

            <div class="form-inline" style="width: 100%">
                <h3>Configuración</h3>
                <a href="?c=pagosad&a=setPayment" class="btn btn-success ml-auto">Configurar pagos</a>
            </div>
            <hr>
            <form action="?c=usuario&a=actualizar_perfil" method="post">
                <input type="hidden" name="t_AboCod" value="<?php echo $abogado->t_AboCod; ?>">
                <input type="hidden" name="idt_usuario" value="<?php echo $abogado->idt_usuario; ?>">
                <dl class="row">
                    <dt class="col-sm-3">Nombres</dt>
                    <dd class="col-sm-9">
                        <input type="text" class="form-control" name="t_AboNombre" value="<?php echo $abogado->t_AboNombre; ?>">
                    </dd>

                    <dt class="col-sm-3">Apellidos</dt>
                    <dd class="col-sm-9">
                        <input type="text" class="form-control" name="t_AboApellidos" value="<?php echo $abogado->t_AboApellidos; ?>">
                    </dd>

                    <dt class="col-sm-3">DNI</dt>
                    <dd class="col-sm-9">
                        <input type="text" class="form-control" name="t_AboDni" value="<?php echo $abogado->t_AboDni; ?>">
                    </dd>

                    <dt class="col-sm-3">Dirección</dt>
                    <dd class="col-sm-9">
                        <input type="text" class="form-control" name="t_AboDireccion" value="<?php echo $abogado->t_AboDireccion; ?>">
                    </dd>

                    <dt class="col-sm-3">Teléfono</dt>
                    <dd class="col-sm-9">
                        <input type="text" class="form-control" name="t_AboTelfcel" value="<?php echo $abogado->t_AboTelfcel; ?>">
                    </dd>

                    <dt class="col-sm-3">Teléfono 2</dt>
                    <dd class="col-sm-9">
                        <input type="text" class="form-control" name="t_AboTelf" value="<?php echo $abogado->t_AboTelf; ?>">
                    </dd>

                    <dt class="col-sm-3 text-truncate">Correo electrónico</dt>
                    <dd class="col-sm-9">
                        <input type="text" class="form-control" name="t_AboCorreo" value="<?php echo $abogado->t_AboCorreo; ?>">
                    </dd>

                    <dt class="col-sm-3 text-truncate">Departamento</dt>
                    <dd class="col-sm-9">
                        <input type="text" class="form-control" name="t_AboDepartamento" value="<?php echo $abogado->t_AboDepartamento; ?>">
                    </dd>

                    <dt class="col-sm-3 text-truncate">Provincia</dt>
                    <dd class="col-sm-9">
                        <input type="text" class="form-control" name="t_AboProvincia" value="<?php echo $abogado->t_AboProvincia; ?>">
                    </dd>

                    <dt class="col-sm-3 text-truncate">Distrito</dt>
                    <dd class="col-sm-9">
                        <input type="text" class="form-control" name="t_AboDistrito" value="<?php echo $abogado->t_AboDistrito; ?>">
                    </dd>
                </dl>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <button type="submit" class="btn btn-primary btn-block">Guardar</button>
                    </div>
                    <div class="form-group col-md-6">
                        <button type="reset" class="btn btn-secondary btn-block">Cancelar</button>
                    </div>
                </div>
            </form>

        </div>
        <div class="col-md-4">
            <?php
            if (isset($pagos)) {
                ?>
                <div class="col-md-12">
                    <div class="row">
                        <h3>Facturación</h3>
                        <a href="?c=usuario&a=perfil" class="btn btn-danger btn-sm ml-auto"><i
                                    class="fa fa-window-close"></i></a>
                    </div>
                </div>

                <hr>
                <form>
                    <div class="form-group">
                        <label for="inputEmail4">Numero de tarjeta</label>
                        <input type="text" class="form-control" placeholder="4444 5555 6666 7777">
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Fecha Expiración</label>
                            <input type="text" class="form-control" placeholder="10/2019">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputPassword4">CVV</label>
                            <input type="text" class="form-control" id="inputPassword4" placeholder="123">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Nombres</label>
                            <input type="text" class="form-control" placeholder="">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputPassword4">Apellidos</label>
                            <input type="text" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="direccion">Dirección de facturación</label>
                        <input type="text" class="form-control" id="direccion" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="direccion2">Dirección de facturación 2</label>
                        <input type="text" class="form-control" id="direccion2" placeholder="">
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputCity">Ciudad</label>
                            <input type="text" class="form-control" id="inputCity">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputState">Estado/provincia</label>
                            <input type="text" class="form-control" id="inputCity">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="pais">País</label>
                            <input type="text" class="form-control" id="pais">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="zip">Zip</label>
                            <input type="text" class="form-control" id="zip">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <button type="submit" class="btn btn-primary btn-block">Guardar</button>
                        </div>
                        <div class="form-group col-md-6">
                            <button type="reset" class="btn btn-secondary btn-block">Cancelar</button>
                        </div>
                    </div>
                </form>

                <?php
            }
            ?>
        </div>
    </div>
</div>
<script>
    // Custom styling can be passed to options when creating an Element.
    var style = {
        base: {
            // Add your base input styles here. For example:
            fontSize: '16px',
            color: "#32325d",
        }
    };

    // Create an instance of the card Element.
    var card = elements.create('card', {style: style});

    // Add an instance of the card Element into the `card-element` <div>.
    card.mount('#card-element');
</script>

<?php
$itemName = "Demo product";
?>
