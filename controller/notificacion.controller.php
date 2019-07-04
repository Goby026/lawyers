<?php
require_once "model/usuarioNotificacion.php";
require_once "model/resultado.php";

class NotificacionController{

//    private $model;
    private $notificacion;
    private $resultados;

    public function __CONSTRUCT(){
//        $this->model = new Usuarios();
        $this->notificacion = new UsuarioNotificacion();
        $this->resultados = new Resultado();
    }

    public function Index(){

        session_start();

        $notificaciones = $this->notificacion->Listar($_SESSION["id_usuario"]);

        require_once 'view/header.php';
        require_once 'view/Notificaciones/index.php';
        require_once 'view/footer.php';

    }

}
