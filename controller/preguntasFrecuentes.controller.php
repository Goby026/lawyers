<?php

require_once 'model/preguntasFrecuentes/preguntasFrecuentes.php';
require_once 'model/preguntasFrecuentes/pregFrecAreas.php';
require_once 'model/preguntasFrecuentes/respuestapreguntafrec.php';

class PreguntasFrecuentesController
{

    private $model;
    private $pregFrec;
    private $respuestas;

    public function __CONSTRUCT()
    {
        $this->model = new PreguntasFrecuentes();
        $this->pregFrec = new PregFrecAreas();
        $this->respuestas = new RespuestaPreguntaFrec();
    }

    public function Index()
    {

        session_start();

        

        $pregFrecAreas = $this->getPregFrecAreas();

        require_once 'view/header.php';
        require_once 'view/preguntasFrecuentes/preguntasFrecuentes.php';
        require_once 'view/footer.php';

    }

    public function getPregFrecAreas(){
        return $this->pregFrec->Listar();
    }
}
