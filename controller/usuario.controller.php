<?php
require_once 'model/usuarios.php';

class UsuarioController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Usuarios();
    }

    public function Index(){
        require_once 'view/header.php';
        require_once 'view/registro/registro.php';
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
            $activo = 0;
            $tipo_usuario = 2;
            $secret = '6LewZqUUAAAAAEaCCukFvTsagH7jzM49u94kgYDU';
            
            if(!$captcha){
                $errors[] = "Por favor verifica el captcha";
            }
            
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
                    $token = $this->generateToken();
                    
                    $registro = $this->model->registraUsuario($usuario, $pass_hash, $nombre, $apellidos, $telefono, $documento, $email, $activo, $token, $tipo_usuario);
                    
                    if($registro>0)
                    {
                        
                        $url = 'http://localhost/panamericanos/index.php?c=usuario&a=activar_registro?id='.$registro.'&val='.$token;
                       // $url = 'http://'.$_SERVER["SERVER_NAME"].'/webTecnoServ/activar.php?id='.$registro.'&val='.$token;
                        $asunto = 'Activar Cuenta - SISTEMA DE USUARIOS JUEGOS PANAMERICANOS 2019';
                        $cuerpo = "Estimado $nombre: <br /><br />Para continuar con el proceso de registro, es indispensable de click en la siguiente liga <a href='$url'>Activar Cuenta</a>";
                        
                        if($this->enviarEmail($email, $nombre, $asunto, $cuerpo)){
                        
                         echo '<script> alert("Para terminar el proceso de registro siga las instrucciones que le hemos enviado la direccion de correo electronico") </script>';
                         echo '<script> window.location="?c=login&a=Acceso"; </script>';
                        exit;
                        
                        } else {
                            $erros[] = "Error al enviar Email";
                        }
                        
                        
                    } 
                        else {
                        $errors[] = "Error al Registrar";
                    }
                    
                    } else {
                    $errors[] = 'Error al comprobar Captcha';
                }
                
            }
            
        }

    }

    
    public function activar_registro(){

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

    public function generateToken()
	{
		$gen = md5(uniqid(mt_rand(), false));	
		return $gen;
	}
	
	public function hashPassword($password) 
	{
		$hash = password_hash($password, PASSWORD_DEFAULT);
		return $hash;
    }
    
    public function enviarEmail($email, $nombre, $asunto, $cuerpo){
		
		require_once './assets/PHPMailer/PHPMailerAutoload.php';
		
		$mail = new PHPMailer();
		$mail->isSMTP();
		$mail->SMTPAuth = true;
		$mail->SMTPSecure = 'tipo de seguridad'; //Modificar
		$mail->Host = 'smtp.gmail.com'; //Modificar
		$mail->Port = 587; //Modificar
		
		$mail->Username = 'cesararriolachuco@gmail.com'; //Modificar
		$mail->Password = '08QZMMCLP2'; //Modificar
		
		$mail->setFrom('cesararriolachuco@gmail.com', 'Panamericanos 2019'); //Modificar
		$mail->addAddress($email, $nombre);
		
		$mail->Subject = $asunto;
		$mail->Body    = $cuerpo;
		$mail->IsHTML(true);
		
		if($mail->send())
		return true;
		else
		return false;
    }
    

	

    
    
}