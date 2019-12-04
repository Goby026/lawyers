<?php
require_once 'model/usuarios.php';
require_once 'model/abogado.php';

class UsuarioController{

    private $model;
    private $abogados;

    public function __CONSTRUCT(){
        session_start();
        $this->model = new Usuarios();
        $this->abogados = new Abogado();
    }


    public function Index(){

        require_once 'view/header.php';
        require_once 'view/usuario/registro.php';
        require_once 'view/footer.php';
    }

    //configuracion
    public function perfil(){
        $usuario = $this->model->Obtener($_SESSION["user_id"]);

        $abogado = $this->abogados->Obtener($_SESSION["user_id"]);

        if (isset($_REQUEST['payments'])){
            $pagos = 1;
        }

        require_once 'view/header.php';
        require_once 'view/usuario/perfil.php';
        require_once 'view/footer.php';
    }

    public function Actualizar_perfil(){

        $_REQUEST['t_AboCod'];

        $abogado = new Abogado();

        $abogado->t_AboCod= $_REQUEST['t_AboCod'];
        $abogado->t_AboNombre= $_REQUEST['t_AboNombre'];
        $abogado->t_AboApellidos= $_REQUEST['t_AboApellidos'];
        $abogado->t_AboDni= $_REQUEST['t_AboDni'];
        $abogado->t_AboDireccion= $_REQUEST['t_AboDireccion'];
        $abogado->t_AboTelfcel= $_REQUEST['t_AboTelfcel'];
        $abogado->t_AboTelf= $_REQUEST['t_AboTelf'];
        $abogado->t_AboCorreo= $_REQUEST['t_AboCorreo'];
        $abogado->t_AboDepartamento= $_REQUEST['t_AboDepartamento'];
        $abogado->t_AboProvincia= $_REQUEST['t_AboProvincia'];
        $abogado->t_AboDistrito= $_REQUEST['t_AboDistrito'];
        $abogado->t_AboContrasena= '';
        $abogado->idt_usuario= $_REQUEST['idt_usuario'];

        $this->abogados->Actualizar($abogado);

         header("Location: ?c=usuario&a=perfil");
    }

    public function Guardar(){

        $usuario = new Usuarios();

        $usuario->idt_perfil = 2;
        $usuario->username = $_REQUEST['email'];
        $usuario->password = $_REQUEST['password'];
        $repass = $_REQUEST['repassword'];

        if (isset($_REQUEST['terminos'])){
            if ($this->validaPassword($_REQUEST['password'], $repass)){

                $pass = $this->hashPassword($_REQUEST['password']);

                $usuario->password = $pass;

                if (!$this->model->usuarioExiste($_REQUEST['email'])){

                    if ($this->minMax(20,6, $pass)){

                        $us = $this->model->Registrar($usuario);

                        if ($us->id > 0){

                        //registrar abogado

                            $abogado = new Abogado();
                            $abogado->t_AboNombre = "";
                            $abogado->t_AboApellidos = "";
                            $abogado->t_AboDni = 0;
                            $abogado->t_AboDireccion = "";
                            $abogado->t_AboTelfcel = 0;
                            $abogado->t_AboTelf = 0;
                            $abogado->t_AboCorreo = $_REQUEST['email'];
                            $abogado->t_AboDepartamento = "";
                            $abogado->t_AboProvincia = "";
                            $abogado->t_AboDistrito = "";
                            $abogado->t_AboContrasena = "";
                            $abogado->idt_usuario = $us->id;

                            $this->abogados->Registrar($abogado);

                            $success = "Gracias por registrarse, puede ingresar al sistema";

                            require_once 'view/header.php';
                            require_once 'view/login/login.php';
                            require_once 'view/footer.php';

                        }else{
                            $error = "Error al registrar usuario";
                            require_once 'view/header.php';
                            require_once 'view/usuario/registro.php';
                            require_once 'view/footer.php';
                        }

                    }else{
                        $error = "Su contraseña debe tener 6 caracteres como mínimo";
                        require_once 'view/header.php';
                        require_once 'view/usuario/registro.php';
                        require_once 'view/footer.php';
                    }

                }else{
                    $error = "¡Usuario ya existe!";
                    require_once 'view/header.php';
                    require_once 'view/usuario/registro.php';
                    require_once 'view/footer.php';
                }

            }else{
                $error = "Los passwords no coinciden";
                require_once 'view/header.php';
                require_once 'view/usuario/registro.php';
                require_once 'view/footer.php';
            }
        }else{
            $error = "Debe aceptar los términos y condiciones";
            require_once 'view/header.php';
            require_once 'view/usuario/registro.php';
            require_once 'view/footer.php';
        }



    }


    public function Recupera(){
        require_once 'view/header.php';
        require_once 'view/login/recupera.php';
        require_once 'view/footer.php';
    }
    
    public function validar_registro(){

        $errors = array();

        if(!empty($_POST))
        {
            $nombre =  $_POST['nombre'];
            $apellidos =  $_POST['apellidos'];
            $usuario =  $_POST['usuario'];
            $documento =  $_POST['documento'];
            $telefono =  $_POST['telefono'];
            $email =  $_POST['email'];
            $password =  $_POST['password'];    
            $con_password = $_POST['con_password'];
            $captcha =  $_POST['g-recaptcha-response'];
            $activo = 1;
            $tipo_usuario = 1;
            $secret = '6LeUoaoUAAAAAF37vU0xD9dRviuSszziR9rZfPal';
            
//            if(!$captcha){
//              $errors[] = "Por favor verifica el captcha";
//            }
            
            if($this->isNull($nombre, $usuario, $password, $con_password, $email))
            {
                $errors[] = "Debe llenar todos los campos";
            }

            if(!$this->isEmail($email))
            {
                $errors[] = "Dirección de correo inválida";
            }
            
            if(!$this->validaPassword($password, $con_password))
            {
                $errors[] = "Las contraseñas no coinciden";
            }
            
            if($this->model->usuarioExiste($usuario))
            {
                $errors[] = "El nombre de usuario $usuario ya existe";
            }
            
            if($this->model->emailExiste($email))
            {
                $errors[] = "El correo electronico $email ya existe";
                // echo "Email YA EXISTE";
            }
            
            if(count($errors) == 0)
            {
               $response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=$secret&response=$captcha");
                
             $arr = json_decode($response, TRUE);
                
                if($arr['success'])
                {
                    
                    $pass_hash = $this->hashPassword($password);
                    $token = $this->model->generateToken();
                    
                    $registro = $this->model->registraUsuario($usuario, $pass_hash, $nombre, $apellidos, $telefono, $documento, $email, $activo, $token, $tipo_usuario);
                    
                    if($registro>0)
                    {
                        
                        // $url = 'http://www.tecnoweplay.com/?c=usuario&a=activar_usuario&id='.$registro.'&val='.$token;
                       
                        // $asunto = 'Activar Cuenta - SISTEMA DE USUARIOS JUEGOS PANAMERICANOS 2019';
                        // $cuerpo = "Estimado $nombre: <br /><br />Para continuar con el proceso de registro, es indispensable de click en la siguiente liga <a href='$url'>Activar Cuenta</a>";
                        
                       
                        // if($this->enviarEmail($email, $nombre, $asunto, $cuerpo)){
                        
                        //  echo '<script> alert("Para terminar el proceso de registro siga las instrucciones que le hemos enviado la direccion de correo electronico") </script>';
                        //  echo '<script> window.location="?c=login&a=Acceso"; </script>';
                        // exit;
                        
                        echo '<script> alert("REGISTRO EXITOSO") </script>';
                        echo '<script> window.location="?c=login&a=Acceso"; </script>';
                        exit;
                        
                        // } else {
                        //     $errors[] = "Error al enviar Email";
                        // }  
                    } 
                        else {
                        $errors[] = "Error al Registrar";
                    }
                    
                     } else {
                     $errors[] = 'Error al comprobar Captcha';
                }
                

            }

        require_once 'view/header.php'; 
        require_once 'view/registro/registro.php';
//        $fallas = $this->resultBlock($errors);
        require_once 'view/footer.php';
        }
        



    }


   public function isNull($nombre, $user, $pass, $pass_con, $email){
		if(strlen(trim($nombre)) < 1 || strlen(trim($user)) < 1 || strlen(trim($pass)) < 1 || strlen(trim($pass_con)) < 1 || strlen(trim($email)) < 1)
		{
			return true;
			} else {
			return false;
		}		
    }
    
    public function isEmail($email)
	{
		if (filter_var($email, FILTER_VALIDATE_EMAIL)){
			return true;
			} else {
			return false;
		}
    }
    
    public function validaPassword($var1, $var2)
	{
		if (strcmp($var1, $var2) !== 0){
			return false;
			} else {
			return true;
		}
    }
    	
	public function minMax($min, $max, $valor){
		if(strlen(trim($valor)) < $min)
		{
			return true;
		}
		else if(strlen(trim($valor)) > $max)
		{
			return true;
		}
		else
		{
			return false;
		}
    }


	
	public function hashPassword($password) 
	{
		$hash = password_hash($password, PASSWORD_DEFAULT);
		return $hash;
    }
    
//    public function enviarEmail($email, $nombre, $asunto, $cuerpo){
//
//		require_once './assets/PHPMailer/PHPMailerAutoload.php';
//
//            $mail = new PHPMailer(true);
//            $mail->SMTPOptions = array(
//                'ssl' => array(
//                    'verify_peer' => false,
//                    'verify_peer_name' => false,
//                    'allow_self_signed' => true
//                )
//            );
//            $mail->SMTPDebug = 2;
//            $mail->IsSMTP();
//            $mail->SMTPAuth = true;
//            $mail->SMTPSecure = 'tls';
//            $mail->Host = 'smtp.gmail.com';
//            $mail->Port = 587;// TCP port to connect to
//            $mail->CharSet = 'UTF-8';
//            $mail->Username ='cesararriolachuco@gmail.com'; //Email para enviar
//            $mail->Password = '08QZMMCLP80'; //Su password
//            //Agregar destinatario
//            $mail->setFrom('cesararriolachuco@gmail.com', 'Panamericanos 2019');
//            $mail->AddAddress($email, $nombre); //A quien mandar email
//            $mail->SMTPKeepAlive = true;
//            $mail->Mailer = "smtp";
//
//
//                //Content
//            $mail->isHTML(true); // Set email format to HTML
//
//
//            $mail->Subject = $asunto;
//            $mail->Body    = $cuerpo;
//
//            if(!$mail->send()) {
//              echo 'Error al enviar email';
//              echo 'Mailer error: ' . $mail->ErrorInfo;
//            } else {
//              echo 'Mail enviado correctamente';
//            }
//    }

    public function enviarEmail($email, $subject, $message){

        $to = $email;

        $headers = "From: systemcase <stripe_dev@protonmail.com>\r\n";
        $headers .= "Reply-To: stripe_dev@protonmail.com\r\n";
        $headers .= "Content-type: text/html\r\n";

        return mail($to, $subject, $message, $headers);

    //header("Location: ?c=login&a=index&msg=¡Hemos enviado un enlace a su correo¡");

    }

    public function activar_usuario()
    {

        if(isset($_GET["id"]) AND isset($_GET['val']))
        {
            $idUsuario = $_GET['id'];
            $token = $_GET['val'];
            
            $mensaje = $this->model->validaIdToken($idUsuario, $token);	

            require_once 'view/header.php';
            require_once 'view/registro/activar.php';
            require_once 'view/footer.php';
        }
        
    }

    public function recuperar_pass(){

        if(isset($_SESSION["user_id"])){
            header("Location: ?c=index&a=index");
        }
        
        $errors = array();
        
        if(!empty($_POST))
        {
            $email =  $_POST['email'];
            
            if(!$this->isEmail($email))
            {
                $errors[] = "Debe ingresar un correo electronico valido";
            }
            
            if($this->model->emailExiste($email))
            {
                $user_id = $this->model->getValor('idt_usuario', 'username', $email);
                $nombre =  $this->model->getValor('username', 'username', $email);
                
                $token = $this->model->generaTokenPass($user_id);
                
                $url = 'http://localhost/app-abogados/?c=usuario&a=restablecer_pass&user_id='.$user_id.'&token='.$token;
                
                $asunto = 'Recuperar Password - SYSTEMCASE';
                $cuerpo = "Hola $nombre: <br /><br />Se ha solicitado un reinicio de contrase&ntilde;a. <br/><br/>Para restaurar la contrase&ntilde;a, visita la siguiente direcci&oacute;n: <a href='$url'>$url</a>";
               //  var_dump($asunto);
                if($this->enviarEmail($email, $asunto, $cuerpo)){
                     var_dump($asunto);
                    echo '<script> alert("Hemos enviado un correo electronico a su email para restablecer tu password ") </script>';
                    echo '<script> window.location="?c=login"; </script>';
                    exit;
                }

                } else {
//                $errors[] = "La direccion de correo electronico no existe";
                header("Location: ?c=login&a=index&msgerr=¡Algo salio mal¡");
            }
          
        }
    }


     public function restablecer_pass()
     {
            if(empty($_GET['user_id'])){
                header('Location: ?c=index');
            }
            
            if(empty($_GET['token'])){
                header('Location: ?c=index');
            }
            
            $user_id = $_GET['user_id'];
            $token = $_GET['token'];
            
            if(!$this->model->verificaTokenPass($user_id, $token))
            {
                echo 'No se pudo verificar los Datos';
                exit;
            }

            require_once 'view/header.php';
            require_once 'view/login/cambia_pass.php';
            require_once 'view/footer.php';
            
     }

     public function guarda_pass()
     {

        $user_id = $_POST['user_id'];
        $token = $_POST['token'];
        $password = $_POST['password'];
        $con_password = $_POST['con_password'];
        
        if($this->validaPassword($password, $con_password))
        {
            
            $pass_hash = $this->hashPassword($password);
            
            if($this->model->cambiaPassword($pass_hash, $user_id, $token))
            {
                echo '<script> alert("Contraseña Modificada") </script>';
                echo '<script> window.location="?c=login&a=acceso"; </script>';
            } 
            else {
                echo '<script> alert("Error al modificar contraseña") </script>';
                echo '<script> window.location="?c=login&a=acceso"; </script>';
            }
            
            } else {
            
                'http://www.tecnoweplay.com/?c=usuario&a=restablecer_pass&user_id='.$user_id.'&token='.$token;
            echo '<script> alert("Las contraseñas no coinciden vuelvelo a intentarlo Gracias.") </script>';
            echo '<script> window.location="?c=usuario&a=recupera"</script>';
            
        }

     }

     public function resultBlock($errors)
     {
        if(count($errors) > 0)
        {
            echo "<div id='error' class='alert alert-info ' role='alert'>
            <a href='?c=usuario&a=Index' onclick=\"showHide('error');\">[X]
            <ul>";
            foreach($errors as $error)
            {
                echo "<li>".$error."</li>";
            }
            echo "</ul>";
            echo "</div>";

        }
    }




    
}
