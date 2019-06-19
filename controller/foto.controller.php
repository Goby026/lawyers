<?php
require_once 'model/foto.php';

class FotoController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Foto();
    }

    public function Index(){

        session_start();

        $listaEmpleados = $this->getFotos();
        // $c=0;

        require_once 'view/header.php';
        require_once 'view/Foto/foto.php';
        require_once 'view/footer.php';

    }

    public function getFotos(){
        return $this->model->Listar();
    }

    public function verDatos(){
        $nombre = $_POST['txtnombre'];
        $foto = $_POST['txtfoto'];

        $newFoto = new Foto();

        $newFoto->nombre = $nombre;
        $newFoto->foto = "./assets/images/".$foto;

        $resp = $this->model->Registrar($newFoto);

        echo $resp;

    }
}
