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
        require_once 'view/login/acceso.php';
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
    public function validar1(){
        
       
  
        // if(isset($_SESSION["id_usuario"])){ //En caso de existir la sesión redireccionamos
        //   header("Location: home.php");
        // }
        
        // $errors = array();
        
        if(!empty($_POST))
        {
          $usuario = $_POST['usuario'];
          $password =$_POST['password'];


          $resp=$this->model->Login($usuario,$password);
          if($resp>0){
            session_start();
            $_SESSION['auth'] = $_POST['email'];

            require_once 'view/header.php';
            require_once 'view/index/index.php';
            require_once 'view/footer.php';
          }else {
              echo 'error de datos';
          }

// echo $password;
     
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

        header("Location: index.php");
    }
}
