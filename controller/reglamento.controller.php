<?php

require_once 'model/reglamento/seccionreglamento.php';
require_once 'model/reglamento/norma.php';
require_once 'model/reglamento/subnorma.php';

class ReglamentoController
{

    private $model;
    private $norma;
    private $subnorma;

    public function __CONSTRUCT()
    {
        $this->model = new SeccionReglamento();
        $this->norma = new Norma();
        $this->subnorma = new Subnorma();
    }

    public function Index()
    {

        session_start();

        

        $secciones= $this->getsecciones();

        require_once 'view/header.php';
        require_once 'view/reglamento/reglamento.php';
        require_once 'view/footer.php';

    }

    public function getsecciones(){
        return $this->model->Listar();
    }
}
