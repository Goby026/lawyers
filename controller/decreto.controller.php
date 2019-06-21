<?php
require_once 'model/decreto.php';

class DecretoController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Decreto();
    }

    public function Index(){

        session_start();

        $decretos = $this->getDecreto();

        require_once "view/header.php";
        require_once "view/MarcoLegal/marcoLegal.php";
        require_once "view/footer.php";
    }

    public function getDecreto(){
        return $this->model->Listar();
    }
}
