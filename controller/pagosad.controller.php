<?php
require_once 'model/pagos.php';
require_once 'model/notificacion.php';
require_once 'model/usuarioNotificacion.php';

class PagosadController{
    
    private $model;
    private $notificacion;
    private $usunotificacion;
    
    public function __CONSTRUCT(){
        session_start();
        $this->model = new Pagos();
        $this->notificacion = new Notificacion();
        $this->usunotificacion = new UsuarioNotificacion();
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
}
