<?php
require_once 'model/sedes.php';

class SedesController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Sedes();
    }


    public function Index(){
        session_start();
        $sedes = $this->getSedes();
        require_once 'view/header.php';
        require_once 'view/sedes/index.php';
        require_once 'view/footer.php';
    }

    public function getSedes(){
        return $this->model->Listar();
    }
    
}