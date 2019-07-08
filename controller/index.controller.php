<?php
require_once 'model/usuarios.php';
require_once 'model/usuarioNotificacion.php';

class IndexController{

    private $model;
    private $notificacion;

    public function __CONSTRUCT(){
      $this->model = new Usuarios();
      $this->notificacion = new UsuarioNotificacion();
    }



    public function Index()
    {
        $nomb = array();

        if (isset($_GET['fb']))
        {
           session_start();
            $user_fb = $_GET['user'];
            $_SESSION['username'] = $_GET['user'];
        }

        else
        {
            session_start();

            if(!isset($_SESSION["id_usuario"])){ //Si no ha iniciado sesión redirecciona a index.php
                header("Location: ?c=login&a=acceso");
            }
            else{
                    $nombre = $this->model->Bienvenido($nomb);
                    $_SESSION['username']= $nombre;
                }

        }

        require_once 'view/header.php';
        require_once 'view/index/index.php';
        require_once 'view/footer.php';
    }

    public function cargarMenu(){
        session_start();
        $notis = $this->notificacion->Listar($_SESSION['id_usuario']);
        echo json_encode($notis);
    }
}
