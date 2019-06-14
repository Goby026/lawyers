<?php
require_once 'model/usuarios.php';

class LoginController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Usuarios();
    }

    public function Index(){
        require_once 'view/header.php';
        require_once 'view/login/login.php';
        require_once 'view/footer.php';
    }

    public function Acceder(){

        $usuarios = new Usuarios();

        if ($usuarios->Login($_POST['email'], $_POST['password']) > 0){

            session_start();
            $_SESSION['auth'] = $_POST['email'];

            require_once 'view/header.php';
            require_once 'view/index/index.php';
            require_once 'view/footer.php';
        }

    }

    public function CerrarSession(){
        session_start();
        session_unset();
        session_destroy();

        header("Location: index.php");
    }
}
