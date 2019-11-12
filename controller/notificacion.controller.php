<?php
require_once "model/usuarioNotificacion.php";

class NotificacionController{

//    private $model;
    private $notificacion;

    public function __CONSTRUCT(){
//        $this->model = new Usuarios();
        $this->notificacion = new UsuarioNotificacion();
    }

    public function Index(){

        session_start();

        $notificaciones = $this->notificacion->Listar($_SESSION["user_id"]);

        require_once 'view/header.php';
        require_once 'view/Notificaciones/index.php';
        require_once 'view/footer.php';

    }

    public function Config(){

        session_start();

        require_once 'view/header.php';
        require_once 'view/Notificaciones/configuracion.php';
        require_once 'view/footer.php';

    }

    public function leer(){

        $this->notificacion->Eliminar($_REQUEST['id']);

        header("Location: ?c=notificacion&a=index");

    }

}
