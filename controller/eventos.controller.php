<?php
require_once 'model/eventos.php';

class EventosController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Eventos();
    }


    public function Index(){
        session_start();
        $_SESSION['IdSede'] = $_GET['sede'];
        $Eventos = $this->getEventosxIdSede();

        require_once 'view/header.php';
        require_once 'view/evento/index.php';
        require_once 'view/footer.php';
    }

    public function getEventosxIdSede(){
        return $this->model->EventosxIdSede();
    }
}