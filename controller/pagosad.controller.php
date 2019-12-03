<?php
require_once 'model/pagos.php';
require_once 'model/notificacion.php';
require_once 'model/usuarioNotificacion.php';
require_once 'model/stripe.php';

include './core/config.php';

class PagosadController{

    private $model;
    private $notificacion;
    private $usunotificacion;
    private $stripe_pay;

    public function __CONSTRUCT(){
        session_start();

        // Product Details
        // Minimum amount is $0.50 US
        $itemName = "Demo Product";
        $itemNumber = "PN12345";
        $itemPrice = 25;
        $currency = "USD";

        $this->model = new Pagos();
        $this->notificacion = new Notificacion();
        $this->usunotificacion = new UsuarioNotificacion();
        $this->stripe_pay = new Stripe();
    }

    public function Index(){

//        $pagos = $this->model->Listar();

        require_once 'view/header.php';
        require_once 'view/caso/expedientes.php';
        require_once 'view/footer.php';
    }

    public function Guardar(){
        $pago = new Pagos();

        $t_casocod = $_REQUEST['t_casocod'];

//        $fecha = date("Y/m/d");

        $pago->t_PagoMonto = $_REQUEST['t_PagoMonto'];
        $pago->t_PagoMontoInicial = "0.0";
        $pago->t_PagoDescrip = $_REQUEST['t_PagoDescrip'];
        $pago->t_CasoCod = $t_casocod;

        $this->model->Registrar($pago);

        $fecha = date("Y/m/d");

        //Registrar Notificacion
        $noti = new Notificacion();
        $noti->fecha = $fecha;
        $noti->estado = 1;
        $noti->titulo = "Adelanto de pago";
        $noti->descripcion = "Monto: ".$_REQUEST['t_PagoMonto']." por concepto de: ".$_REQUEST['t_PagoDescrip'] ;
        $noti->idtiponotificacion = 5;

        $noti_inserted = $this->notificacion->Registrar($noti);

        //Registrar usuarioNotificacion
        $usunoti = new UsuarioNotificacion();
        $usunoti->idnotificacion = $noti_inserted->id;
        $usunoti->idusuario = $_SESSION['user_id'];
        $usunoti->estado = 1;

        $this->usunotificacion->Registrar($usunoti);

        header("Location: ?c=caso&a=expedientes&t_CasoCod=$t_casocod");

//        print_r($pago);

    }

    public function Actualizar(){

        $t_CasoCod = $_REQUEST['t_CasoCod'];
        $idPagoCod = $_REQUEST['idPagoCod'];

        $pago = new Pagos();
        $pago->idPagoCod = $idPagoCod;
        $pago->t_PagoMonto = $_REQUEST['t_PagoMonto'];
        $pago->t_PagoMontoInicial = "0.0";
        $pago->t_PagoDescrip = $_REQUEST['t_PagoDescrip'];
        $pago->t_CasoCod = $t_CasoCod;

        $this->model->Actualizar($pago);

        header("Location: ?c=caso&a=expedientes&t_CasoCod=$t_CasoCod");

    }

    public function Eliminar(){
        $this->model->Eliminar($_REQUEST['id']);
        header('Location: index.php');
    }


    //*****************************STRIPE*****************************

    //funcion que abre la vista de pagos stripe
    public function setPayment(){

        $itemName = "subscription";
        $itemNumber = "PN12345";
        $itemPrice = 25;
        $currency = "USD";

        require_once 'view/header.php';
        require_once 'view/stripe/stripe.php';
        require_once 'view/footer.php';
    }

    //funcion para registrar pagos con stripe
    public function stripe(){

        // Product Details
        // Minimum amount is $0.50 US
        $itemName = "subscription";
        $itemNumber = "PN12345";
        $itemPrice = 25;
        $currency = "USD";

        $payment_id = $statusMsg = '';
        $ordStatus = 'error';

        // Check whether stripe token is not empty
        if(!empty($_POST['stripeToken'])){

            // Retrieve stripe token, card and user info from the submitted form data
            $token  = $_POST['stripeToken'];
            $name = $_POST['name'];
            $email = $_POST['email'];
            $card_number = $_POST['card_number'];
            $card_exp_month = $_POST['card_exp_month'];
            $card_exp_year = $_POST['card_exp_year'];
            $card_cvc = $_POST['card_cvc'];

            // Include Stripe PHP library
            require_once './src/vendor/stripe-php/init.php';

            // Set API key
            \Stripe\Stripe::setApiKey(STRIPE_API_KEY);

            // Add customer to stripe
            $customer = \Stripe\Customer::create(array(
                'email' => $email,
                'source'  => $token
            ));

            // Unique order ID
            $orderID = strtoupper(str_replace('.','',uniqid('', true)));

            // Convert price to cents
            $itemPrice = ($itemPrice*100);

            // Charge a credit or a debit card
            $charge = \Stripe\Charge::create(array(
                'customer' => $customer->id,
                'amount'   => $itemPrice,
                'currency' => $currency,
                'description' => $itemName,
                'metadata' => array(
                    'order_id' => $orderID
                )
            ));

            // Retrieve charge details
            $chargeJson = $charge->jsonSerialize();

//            print_r($chargeJson);

            // Check whether the charge is successful
            if($chargeJson['amount_refunded'] == 0 && empty($chargeJson['failure_code']) && $chargeJson['paid'] == 1 && $chargeJson['captured'] == 1){
                // Order details
                $transactionID = $chargeJson['balance_transaction'];
                $paidAmount = $chargeJson['amount'];
                $paidCurrency = $chargeJson['currency'];
                $payment_status = $chargeJson['status'];

                //grabando datos a mysql
                $stripe = new Stripe();
                $stripe->name = $name;
                $stripe->email = $email;
                $stripe->card_number = $card_number;
                $stripe->card_exp_month = $card_exp_month;
                $stripe->card_exp_year = $card_exp_year;
                $stripe->item_name = $itemName;
                $stripe->item_number = $itemNumber;
                $stripe->item_price = $itemPrice;
                $stripe->item_price_currency = $currency;
                $stripe->paid_amount = $paidAmount;
                $stripe->paid_amount_currency = $paidCurrency;
                $stripe->txn_id = $transactionID;
                $stripe->payment_status = $payment_status;
                $stripe->idt_usuario = $_SESSION['user_id'];

                $this->stripe_pay->Registrar($stripe);

                // If the order is successful
                if($payment_status == 'succeeded'){
                    $ordStatus = 'Correcto';
                    $statusMsg = 'Tu pago se realizó correctamente!';

                    require_once 'view/header.php';
                    require_once 'view/stripe/success.php';
                    require_once 'view/footer.php';

                }else{
                    $statusMsg = "El pago tuvo un error!";
                }
            }else{
                //print '<pre>';print_r($chargeJson);
                $statusMsg = "La transacción ha fallado!";
                require_once 'view/header.php';
                require_once 'view/stripe/errno.php';
                require_once 'view/footer.php';
            }
        }else{
            $statusMsg = "Error al enviar los datos.";
            require_once 'view/header.php';
            require_once 'view/stripe/errno.php';
            require_once 'view/footer.php';
        }
    }

}
