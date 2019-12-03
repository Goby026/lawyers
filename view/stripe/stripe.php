<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h2>Stripe</h2>
            <hr>

            <div class="card">
                <div class="card-body">
                    <div class="card-title">
                        <h3 class="panel-title">Subscripción</h3>
                        <!-- Product Info -->
                        <p><b>Servicio:</b> <?php echo $itemName; ?></p>
                        <p><b>Precio:</b> <?php echo '$'.$itemPrice.' '.$currency; ?></p>
                    </div>
                    <div class="card-text">
                        <form action="?c=pagosad&a=stripe" method="POST" id="paymentFrm">
                            <div class="form-group">
                                <label for="card_number">Numero de tarjeta</label>
                                <!--                    <input type="text" class="form-control" placeholder="4444 5555 6666 7777">-->
                                <input type="text" class="form-control" name="card_number" id="card_number" placeholder="1234 1234 1234 1234" autocomplete="off" required="" autofocus="">
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <!--                    <input type="text" class="form-control" placeholder="10/2019">-->
                                <input type="email" class="form-control" name="email" id="email" placeholder="Ingrese email" required="">
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="inputEmail4">Mes Expiración</label>
                                    <!--                        <input type="text" class="form-control" placeholder="10/2019">-->
                                    <input type="text" class="form-control" name="card_exp_month" id="card_exp_month" placeholder="MM" required="">
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="inputEmail4">Año Expiración</label>
                                    <!--                        <input type="text" class="form-control" placeholder="10/2019">-->
                                    <input type="text" class="form-control" name="card_exp_year" id="card_exp_year" placeholder="YYYY" required="">
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="card_cvc">CVV</label>
                                    <!--                        <input type="text" class="form-control" id="inputPassword4" placeholder="123">-->
                                    <input type="text" class="form-control" name="card_cvc" id="card_cvc" placeholder="CVC" autocomplete="off" required="">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="inputEmail4">Nombres y apellidos completos</label>
                                    <!--                        <input type="text" class="form-control" placeholder="">-->
                                    <input type="text" class="form-control" name="name" id="name" placeholder="Enter name" required="">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <!--                        <button type="submit" class="btn btn-primary btn-block">Guardar</button>-->
                                    <button type="submit" class="btn btn-success btn-block" id="payBtn">Pagar</button>
                                </div>
                                <div class="form-group col-md-6">
                                    <button type="reset" class="btn btn-secondary btn-block">Cancelar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

<!--            stripe original-->
<!--            <div class="panel">-->
<!--                <div class="panel-heading">-->
<!--                    <h3 class="panel-title">Cargar --><?php //echo '$'.$itemPrice; ?><!-- con Stripe</h3>-->
<!---->
<!--                    <!-- Product Info -->-->
<!--                    <p><b>Item Name:</b> --><?php //echo $itemName; ?><!--</p>-->
<!--                    <p><b>Price:</b> --><?php //echo '$'.$itemPrice.' '.$currency; ?><!--</p>-->
<!--                </div>-->
<!--                <div class="panel-body">-->
<!--                    <!-- Display errors returned by createToken -->-->
<!--                    <div class="payment-status"></div>-->
<!---->
<!--                    <!-- Payment form -->-->
<!--                    <form action="?c=pagosad&a=stripe" method="POST" id="paymentFrm">-->
<!--                        <div class="form-group">-->
<!--                            <label>NAME</label>-->
<!--                            <input type="text" name="name" id="name" placeholder="Enter name" required="" autofocus="">-->
<!--                        </div>-->
<!--                        <div class="form-group">-->
<!--                            <label>EMAIL</label>-->
<!--                            <input type="email" name="email" id="email" placeholder="Enter email" required="">-->
<!--                        </div>-->
<!--                        <div class="form-group">-->
<!--                            <label>CARD NUMBER</label>-->
<!--                            <input type="text" name="card_number" id="card_number" placeholder="1234 1234 1234 1234" autocomplete="off" required="">-->
<!--                        </div>-->
<!--                        <div class="row">-->
<!--                            <div class="left">-->
<!--                                <div class="form-group">-->
<!--                                    <label>EXPIRY DATE</label>-->
<!--                                    <div class="col-1">-->
<!--                                        <input type="text" name="card_exp_month" id="card_exp_month" placeholder="MM" required="">-->
<!--                                    </div>-->
<!--                                    <div class="col-2">-->
<!--                                        <input type="text" name="card_exp_year" id="card_exp_year" placeholder="YYYY" required="">-->
<!--                                    </div>-->
<!--                                </div>-->
<!--                            </div>-->
<!--                            <div class="right">-->
<!--                                <div class="form-group">-->
<!--                                    <label>CVC CODE</label>-->
<!--                                    <input type="text" name="card_cvc" id="card_cvc" placeholder="CVC" autocomplete="off" required="">-->
<!--                                </div>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                        <button type="submit" class="btn btn-success" id="payBtn">Submit Payment</button>-->
<!--                    </form>-->
<!--                </div>-->
<!--            </div>-->

        </div>
    </div>
</div>


<script>
    // Set your publishable key
    Stripe.setPublishableKey('<?php echo STRIPE_PUBLISHABLE_KEY; ?>');

    // Callback to handle the response from stripe
    function stripeResponseHandler(status, response) {
        if (response.error) {
            // Enable the submit button
            $('#payBtn').removeAttr("disabled");
            // Display the errors on the form
            $(".payment-status").html('<p>'+response.error.message+'</p>');
        } else {
            var form$ = $("#paymentFrm");
            // Get token id
            var token = response.id;
            // Insert the token into the form
            form$.append("<input type='hidden' name='stripeToken' value='" + token + "' />");
            // Submit form to the server
            form$.get(0).submit();
        }
    }

    $(document).ready(function() {
        // On form submit
        $("#paymentFrm").submit(function() {
            // Disable the submit button to prevent repeated clicks
            $('#payBtn').attr("disabled", "disabled");

            // Create single-use token to charge the user
            Stripe.createToken({
                number: $('#card_number').val(),
                exp_month: $('#card_exp_month').val(),
                exp_year: $('#card_exp_year').val(),
                cvc: $('#card_cvc').val()
            }, stripeResponseHandler);

            // Submit from callback
            return false;
        });
    });
</script>