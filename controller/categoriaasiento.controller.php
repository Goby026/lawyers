<?php
require_once 'model/categoriaasiento.php';

class CategoriaAsientoController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new CategoriaAsiento();
    }


    public function Index(){
        session_start();
        $catasi = $this->get();
        require_once 'view/header.php';
        require_once 'view/categoriaasiento/index.php';
        require_once 'view/footer.php';
    }

    public function get(){
        return $this->model->Listar();
    }
    
}