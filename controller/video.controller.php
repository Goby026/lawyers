<?php
require_once 'model/video.php';

class VideoController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Video();
    }

    public function Index(){

        session_start();

        $videos = $this->model->Listar();

        require_once 'view/header.php';
        require_once 'view/video/video.php';
        require_once 'view/footer.php';

    }

    //function para llamar la vista videos/crear.php
    public function registrarVideo(){

        session_start();

        require_once 'view/header.php';
        require_once "view/video/crear.php";
        require_once 'view/footer.php';
    }

    public function Crud(){

        session_start();

        $video = new Video();

        if(isset($_REQUEST['id'])){
            $video = $this->model->Obtener($_REQUEST['id']);
        }

        require_once 'view/header.php';
        require_once "view/video/editar.php";
        require_once 'view/footer.php';
    }

    public function Guardar(){
        $video = new Video();

        $video->codigo = $_REQUEST['codigo'];

        $video->nombre = $_REQUEST['nombre'];

        $cadena = explode("?v=",$_REQUEST['video']);

        $idVideo = end($cadena);

        $video->video = $idVideo;

        $video->codigo > 0
            ? $this->model->Actualizar($video)
            : $this->model->Registrar($video);

        header('Location: ?c=video&a=index');
    }

    public function Eliminar(){
        $this->model->Eliminar($_REQUEST['id']);
        header('Location: ?c=video&a=index');
    }
}
