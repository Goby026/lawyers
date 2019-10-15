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

    public function Acceso(){

        require_once 'view/header.php';
        require_once 'view/index/index.php';
        require_once 'view/footer.php';
    }

    public function Acceder(){

        $usuario = new Usuarios();

        $usuario->username = $_REQUEST['username'];
        $usuario->password = $_REQUEST['password'];

        if ($usuario->Login($usuario)){
            session_start();

            $user_log = $usuario->Login($usuario);

            $_SESSION['auth'] = $usuario->username;
            $_SESSION['user_id'] = $user_log->idt_usuario;

            require_once 'view/header.php';
            require_once 'view/index/index.php';
            require_once 'view/footer.php';

        }else{
            $error = "Error de datos¡¡¡¡¡";
            require_once 'view/header.php';
            require_once 'view/login/login.php';
            require_once 'view/footer.php';
        }

    }
    
    public function validar(){
        
       
        session_start();
        if(isset($_SESSION["id_usuario"])){ //En caso de existir la sesión redireccionamos
          header("Location: ?c=index&a=index");
        }
        
        $errors = array();
        
        if(!empty($_POST))
        {
          $usuario = $_POST['usuario'];
          $password =$_POST['password'];

         
          $resp=$this->model->login1($usuario,$password);
        
        //   if($resp>0){
        //     session_start();
        //     $_SESSION['auth'] = $_POST['email'];

        //     require_once 'view/header.php';
        //     require_once 'view/index/index.php';
        //     require_once 'view/footer.php';
        //   }else {
        //       echo 'error de datos';
        //   }

// var_dump($resp);
     
        }else{
            echo "INGRESE BIEN LOS DATOS";
        }

    }


    public function CerrarSession(){
        session_start();
        session_unset();
        session_destroy();

        header("Location: ?c=home");
    }



}
