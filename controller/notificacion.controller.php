<?php
require_once "model/usuarioNotificacion.php";
require_once "model/tiponotificacion.php";

class NotificacionController{

//    private $model;
    private $notificacion;
    private $tiponotificacion;

    public function __CONSTRUCT(){

        session_start();

//        $this->model = new Usuarios();
        $this->notificacion = new UsuarioNotificacion();
        $this->tiponotificacion = new Tiponotificacion();
    }

    public function Index(){

        $notificaciones = $this->notificacion->Listar($_SESSION["user_id"]);

        require_once 'view/header.php';
        require_once 'view/notificaciones/index.php';
        require_once 'view/footer.php';

    }

    public function Config(){

        $tiponotificaciones = $this->tiponotificacion->Listar();

        require_once 'view/header.php';
        require_once 'view/notificaciones/configuracion.php';
        require_once 'view/footer.php';

    }

    public function tiponoti(){
        $idtiponotificacion = $_REQUEST['idtiponotificacion'];
        $val = $_REQUEST['val'];

        $tipo = new Tiponotificacion();
        $tipo->state = $val;
        $tipo->idtiponotificacion = $idtiponotificacion;

        $tipo->Actualizar($tipo);

        echo json_encode($tipo);
    }

    public function leer(){

        $this->notificacion->Eliminar($_REQUEST['id']);

        header("Location: ?c=notificacion&a=index");

    }

}
