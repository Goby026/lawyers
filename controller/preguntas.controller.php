<?php

require_once 'model/preguntasFrecuentes/preguntasfrecuentes.php';
require_once 'model/preguntasFrecuentes/pregFrecAreas.php';
require_once 'model/preguntasFrecuentes/respuestapreguntafrec.php';

class PreguntasController
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

        $pregFrecAreas = $this->pregFrec->Listar();

        require_once "view/header.php";
        require_once "view/preguntasFrecuentes/preguntasFrecuentes.php";
        require_once "view/footer.php";

    }

}
