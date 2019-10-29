<?php
require_once 'model/pagos.php';

class PagosadController{
    
    private $model;
    
    public function __CONSTRUCT(){
        session_start();
        $this->model = new Pagos();
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

        header("Location: ?c=caso&a=expedientes&t_CasoCod=$t_casocod");

//        print_r($pago);

    }
    
    public function Eliminar(){
        $this->model->Eliminar($_REQUEST['id']);
        header('Location: index.php');
    }
}
