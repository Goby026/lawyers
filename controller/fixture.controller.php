<?php
require_once 'model/fixture.php';
require_once 'model/sede.php';
require_once 'model/deporte.php';

class FixtureController{

    private $model;
    private $sede;
    private $deporte;

    public function __CONSTRUCT(){
        $this->model = new Fixture();
        $this->sede = new Sede();
        $this->deporte = new Deporte();
    }

    public function Index(){

        session_start();

        $fixture = [];
        $sedes = $this->sede->Listar();
        $deportes = $this->deporte->Listar();

        require_once 'view/header.php';
        require_once 'view/Fixture/fixture.php';
        require_once 'view/footer.php';
    }

    public function buscar(){

        session_start();

        if (isset( $_REQUEST['sede'] )){
            $sede = $_REQUEST['sede'];
        }else{
            $sede = '';
        }

        if (isset( $_REQUEST['deporte'] )){
            $deporte = $_REQUEST['deporte'];
        }else{
            $deporte = '';
        }

        $fixture = $this->model->Busqueda($deporte, $sede);
        $sedes = $this->sede->Listar();
        $deportes = $this->deporte->Listar();

        require_once 'view/header.php';
        require_once 'view/Fixture/fixture.php';
        require_once 'view/footer.php';
    }
}
