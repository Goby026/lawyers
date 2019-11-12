<?php
require_once 'model/usuarios.php';
require_once 'model/usuarioNotificacion.php';

class IndexController
{

    private $model;
    private $notificacion;

    public function __CONSTRUCT()
    {
        session_start();
        $this->model = new Usuarios();
        $this->notificacion = new UsuarioNotificacion();
    }


    public function Index()
    {
        require_once 'view/header.php';
        require_once 'view/index/index.php';
        require_once 'view/footer.php';

    }

    public function cargarMenu(){
        $notis = $this->notificacion->Listar($_SESSION['user_id']);
        echo json_encode($notis);
    }
}
