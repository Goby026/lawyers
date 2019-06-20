<?php
require_once 'model/fixture.php';

class FixtureController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Fixture();
    }

    public function Index(){

        session_start();

        $fixture = $this->getFixture();

        require_once 'view/header.php';
        require_once 'view/Fixture/fixture.php';
        require_once 'view/footer.php';
    }

    public function getFixture(){
        return $this->model->Listar();
    }
}
