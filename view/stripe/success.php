<div class="container">
    <div class="status">
        <?php if($payment_status == 'succeeded'){ ?>
            <h1 class="<?php echo $ordStatus; ?>"><?php echo $statusMsg; ?></h1>

            <h4>Información del pago</h4>
            <p><b>Número de referencia:</b> <?php echo $payment_id; ?></p>
            <p><b>Id de transacción:</b> <?php echo $transactionID; ?></p>
            <p><b>Monto:</b> <?php echo $paidAmount.' '.$paidCurrency; ?></p>
            <p><b>Estado de pago:</b> <?php echo $payment_status; ?></p>

            <h4>Informacion del producto</h4>
            <p><b>Nombre:</b> <?php echo $itemName; ?></p>
            <p><b>Precio:</b> <?php echo $itemPrice.' '.$currency; ?></p>
        <?php }else{ ?>
            <h1 class="error">Hubo errores en el pago</h1>
        <?php } ?>
    </div>
    <a href="?c=usuario&a=perfil" class="btn-link">Volver a configuración!</a>
</div>