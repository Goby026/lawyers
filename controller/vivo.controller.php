<?php


class VivoController{

    private $model;

    public function __CONSTRUCT(){
     //   $this->model = new Vivo();
    }

    public function Index(){

        session_start();

        require_once 'view/header.php';
        require_once 'view/vivo/vivo.php';
        require_once 'view/footer.php';

    }
}