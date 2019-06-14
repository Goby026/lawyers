<?php
require_once 'model/pais.php';

class ListaPaisesController
{

    private $model;

    public function __CONSTRUCT()
    {
        $this->model = new Pais();
    }

    public function Index()
    {

        session_start();

        $paises = $this->getPaises();

        require_once 'view/header.php';
        require_once 'view/ListaPaises/listapaises.php';
        require_once 'view/footer.php';

    }

    public function getPaises(){
        return $this->model->Listar();
    }
}
