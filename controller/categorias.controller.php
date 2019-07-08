<?php
require_once 'model/categorias.php';

class CategoriasController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Categorias();
    }


    public function Index(){
        session_start();
        $_SESSION['IdEvento'] = $_GET['evento'];
        $categorias = $this->getCategoriasxIdEvento();
        $imagen = $this->getImagenxIdEvento();

        require_once 'view/header.php';
        require_once 'view/categorias/index.php';
        require_once 'view/footer.php';
    }

    public function getCategoriasxIdEvento(){
        return $this->model->CategoriasxIdEvento();
    }
    
    public function getImagenxIdEvento(){
        return $this->model->ImagenxIdEvento();
    }
}