<?php

class MantenimientoController
{


    public function __CONSTRUCT()
    {
//        $this->model = new Usuarios();
    }

    public function Index()
    {

        session_start();

//        $notificaciones = $this->notificacion->Listar($_SESSION["id_usuario"]);

        require_once 'view/header.php';
        require_once 'view/mantenimiento/index.php';
        require_once 'view/footer.php';

    }
}
