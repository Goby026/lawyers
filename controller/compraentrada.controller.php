<?php
require_once 'model/compraentrada.php';

class CompraEntradaController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new CompraEntrada();
    }
    
    public function Index(){
        session_start();
        $compraentradas = $this->getListar();
        require_once 'view/header.php';
        require_once 'view/compraentrada/index.php';
        require_once 'view/footer.php';
    }
    
    public function Crear() {
        session_start();
        $ArrayAsientos = json_decode($_POST['asientos']);
        $this->model->Registrar($ArrayAsientos);
    }
    
    public function getListar(){
        return $this->model->Listar();
    }
}