<?php
require_once 'model/participantes.php';

class ParticipantesController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Participantes();
    }

    public function Index(){

        session_start();

        $listaEmpleados = $this->getParticipantes();
        // $c=0;

        require_once 'view/header.php';
        require_once 'view/Participantes/participantes.php';
        require_once 'view/footer.php';

    }

    public function getParticipantes(){
        return $this->model->Listar();
    }

    public function verDatos(){
        $nombre = $_POST['txtNombre'];
        $apellidop = $_POST['txtApellidoP'];
        $apellidom = $_POST['txtApellidoM'];
        $pais = $_POST['txtPais'];
        $foto = $_POST['txtfoto'];

        $newParticipantes = new Participantes();

        $newParticipantes->nombre = $nombre;
        $newParticipantes->apellidop = $apellidop;
        $newParticipantes->apellidom = $apellidom;
        $newParticipantes->pais = $pais;
        $newParticipantes->foto = "./assets/images/".$foto;

        $resp = $this->model->Registrar($newParticipantes);

        echo $resp;

    }
}
