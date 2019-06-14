<?php
require_once 'model/comite.php';

class ComiteOrganizadorController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Comite();
    }

    public function Index(){

        session_start();

        $comite = $this->getComite();

        require_once 'view/header.php';
        require_once 'view/ComiteOrganizador/comite.php';
        require_once 'view/footer.php';

    }


    public function getComite(){
        return $this->model->Listar();
    }
}
