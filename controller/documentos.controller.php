<?php
require_once 'model/documentos.php';

class DocumentosController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Documentos();
    }

    public function Index(){

        session_start();

        $listaEmpleados = $this->getDocumentos();
        // $c=0;

        require_once 'view/header.php';
        require_once 'view/Documentos/documentos.php';
        require_once 'view/footer.php';

    }

    public function getDocumentos(){
        return $this->model->Listar();
    }

    public function verDatos(){
        $nombre = $_POST['txtnombre'];
        $documentos = $_POST['txtdocumentos'];

        $newDocumentos = new Foto();

        $newDocumentos->nombre = $nombre;
        $newDocumentos->documentos = "./assets/images/".$documentos;

        $resp = $this->model->Registrar($newDocumentos);

        echo $resp;

    }
}
