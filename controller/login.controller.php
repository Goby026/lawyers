<?php
require_once 'model/usuarios.php';
require_once 'model/abogado.php';
require_once 'model/modelo.php';

class LoginController{

    private $model;
    private $modelos;
    private $abogado;

    public function __CONSTRUCT(){
        $this->model = new Usuarios();
        $this->modelos = new Modelo();
        $this->abogado = new Abogado();
    }

    public function Index(){
        if (isset($_GET['msg'])){
            $msg = $_GET['msg'];
        }elseif (isset($_GET['msgerr'])){
            $msgerr = $_GET['msgerr'];
        }
        require_once 'view/header.php';
        require_once 'view/login/login.php';
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

        if(isset($_SESSION["user_id"])){ //En caso de existir la sesión redireccionamos
          header("Location: ?c=home");
        }

        $err = "¡Error de datos!";

        if(!empty($_POST))
        {
          $usuario = $_POST['username'];
          $password =$_POST['password'];

          $resp=$this->model->login1($usuario,$password);

          $lawyer = $this->abogado->Obtener($resp->idt_usuario);

            $_SESSION['user_data'] = $lawyer->t_AboNombre." ".$lawyer->t_AboApellidos;

           if($resp){

             require_once 'view/header.php';
             require_once 'view/index/index.php';
             require_once 'view/footer.php';

           }else {
               header("Location: ?c=login&a=index&msgerr=$err");
           }

        }else{
            header("Location: ?c=login&a=index&msgerr=$err");
        }

    }

    public function validarFb(){
        $models = $this->modelos->Listar();
        echo json_encode($models);
    }

    public function recuperarview(){
        require_once 'view/header.php';
        require_once 'view/login/recupera.php';
        require_once 'view/footer.php';
    }

    public function recuperar(){
//        if (isset($_POST['reset_request'])){
//
//            $selector = bin2hex(random_bytes(8));
//
//            $token = random_bytes(32);
//
////            $hashed_pass = password_hash($token, PASSWORD_DEFAULT);
//            $hashed_pass = $this->model->hashPassword($token);
//
//            //registrar token
//
//
//            $url = "http://localhost/app-abogados/?c=login&a=recuperar&token=".$hashed_pass;
//
//            $to = $_POST['email'];
//
//            $subject = "Reestablecer contraseña - AppLawyers";
//
//            $message = "<p>Recibimos una petición para reestablecer tu contraseña, por favor ingresa al siguiente link para establecer una nueva contraseña: </p>";
//            $message .= "<p>Aqui esta tu link: </p>";
//            $message .= "<a href=".$url.">".$url."</a>";
//
//            $headers = "From: systemcase <stripe_dev@protonmail.com>\r\n";
//            $headers .= "Reply-To: stripe_dev@protonmail.com\r\n";
//            $headers .= "Content-type: text/html\r\n";
//
//            mail($to, $subject, $message, $headers);
//
//            header("Location: ?c=login&a=index&msg=¡Hemos enviado un enlace a su correo¡");
//
//        }else{
//            header('Location: ?c=home');
//        }
        $data = $this->model->emailExiste($_POST['email']);

        var_dump($data);
    }


    public function CerrarSession(){
        session_start();
        session_unset();
        session_destroy();

        header("Location: ?c=home");
    }



}
