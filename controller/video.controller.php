<?php
require_once 'model/video.php';

class VideoController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Video();
    }

    public function Index(){

        session_start();

        $listaEmpleados = $this->getVideos();
        // $c=0;

        require_once 'view/header.php';
        require_once 'view/video/video.php';
        require_once 'view/footer.php';

    }

    public function getVideos(){
        return $this->model->Listar();
    }

    public function verDatos(){
        $nombre = $_POST['txtnombre'];
        $video = $_POST['txtvideo'];

        $newvideo = new Video();

        $newvideo->nombre = $nombre;
        $newVideo->video = "./assets/images/".$video;

        $resp = $this->model->Registrar($newvideo);

        echo $resp;

    }
}
