<?php
require_once 'model/institucional.php';

class InstitucionalController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Institucional();
    }

    public function Index(){

        session_start();

        $institucional = $this->getInstitucional();

        require_once 'view/header.php';
        require_once 'view/Institucional/institucional.php';
        require_once 'view/footer.php';

    }

    public function getInstitucional(){
        return $this->model->Listar();
    }
}
