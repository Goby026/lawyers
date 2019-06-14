<?php
require_once 'model/auspiciadores.php';

class AuspiciadoresController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Auspiciadores();
    }

    public function Index(){

        session_start();

        $auspiciadores = $this->getAuspiciadores();
        $c=0;

        require_once 'view/header.php';
        require_once 'view/Auspiciadores/auspiciadores.php';
        require_once 'view/footer.php';

    }

    public function getAuspiciadores(){
        return $this->model->Listar();
    }
}
