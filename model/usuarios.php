<?php
class Usuarios
{
    private $pdo;

    public $idUsuario;
    public $NombreU;
    public $ApellidoU;
    public $emailU;
    public $telefonoU;
    public $passwordU;
    public $DocIdentidad;
    public $idTipoUsuario;
    public $idGaleria;
    public $idEstadoUsuario;

    public function __CONSTRUCT()
    {
        try
        {
            $this->pdo = Database::StartUp();
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Listar()
    {
        try
        {
            $result = array();

            $stm = $this->pdo->prepare("SELECT * FROM alumnos");
            $stm->execute();

            return $stm->fetchAll(PDO::FETCH_OBJ);
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Obtener($id)
    {
        try
        {
            $stm = $this->pdo
                ->prepare("SELECT * FROM alumnos WHERE id = ?");


            $stm->execute(array($id));
            return $stm->fetch(PDO::FETCH_OBJ);
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Eliminar($id)
    {
        try
        {
            $stm = $this->pdo
                ->prepare("DELETE FROM alumnos WHERE id = ?");

            $stm->execute(array($id));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Actualizar($data)
    {
        try
        {
            $sql = "UPDATE alumnos SET 
						Nombre          = ?, 
						Apellido        = ?,
                        Correo        = ?,
						Sexo            = ?, 
						FechaNacimiento = ?
				    WHERE id = ?";

            $this->pdo->prepare($sql)
                ->execute(
                    array(
                        $data->Nombre,
                        $data->Correo,
                        $data->Apellido,
                        $data->Sexo,
                        $data->FechaNacimiento,
                        $data->id
                    )
                );
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Registrar(Alumno $data)
    {
        try
        {
            $sql = "INSERT INTO alumnos (Nombre,Correo,Apellido,Sexo,FechaNacimiento,FechaRegistro) 
		        VALUES (?, ?, ?, ?, ?, ?)";

            $this->pdo->prepare($sql)
                ->execute(
                    array(
                        $data->Nombre,
                        $data->Correo,
                        $data->Apellido,
                        $data->Sexo,
                        $data->FechaNacimiento,
                        date('Y-m-d')
                    )
                );
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Login($user, $pass){
        try
        {
            $result = array();

            $consulta = "CALL LOGIN_USUARIO('".$user."','".$pass."');";

            $stm = $this->pdo->query($consulta);

//            $stm->execute();

//            return $stm->fetchAll(PDO::FETCH_OBJ);

            return $stm->rowCount();
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function login1($usuario, $password)
	{
		// global $mysqli;
        
            $result = array();
            $stm = $this->pdo->prepare("SELECT id, id_tipo, password FROM usuarios WHERE usuario = ? || correo = ? LIMIT 1");
            $stm->execute(array($usuario, $usuario));
            $login = $stm->fetch(PDO::FETCH_OBJ);
            $rows = $stm->rowCount();
            
		// $stmt = $mysqli->prepare("SELECT id, id_tipo, password FROM usuarios WHERE usuario = ? || correo = ? LIMIT 1");
		// $stmt->bind_param("ss", $usuario, $usuario);
		// $stmt->execute();
		// $stmt->store_result();
		// $rows = $stmt->num_rows;
		
		if($rows > 0) {

			if($this->isActivo($usuario)){
				// $stmt->bind_result($id, $id_tipo, $passwd);
				// $stmt->fetch();
				
				$validaPassw = password_verify($password, $login->password);
				
				if($validaPassw){
					
					$this->lastSession($login->id);
					$_SESSION['id_usuario'] = $login->id;
					$_SESSION['tipo_usuario'] = $login->id_tipo;
					
					header("location: ?c=index&a=index");
					} else {
					
					$errors = "La contrase&ntilde;a es incorrecta";
				}
				} else {
				$errors = 'El usuario no esta activo';
            }
            
			} else {
			$errors = "El nombre de usuario o correo electr&oacute;nico no existe";
		}
		return $errors;
    }


    public function isActivo($usuario)
	{
		// global $mysqli;
        
        
        $stm = $this->pdo->prepare("SELECT activacion FROM usuarios WHERE usuario = ? || correo = ? LIMIT 1");
            
        $stm->execute(array($usuario, $usuario));

        $resp = $stm->fetch(PDO::FETCH_OBJ);

        //$stm->rowCount();
		// $stmt = $mysqli->prepare("SELECT activacion FROM usuarios WHERE usuario = ? || correo = ? LIMIT 1");
		// $stmt->bind_param('ss', $usuario, $usuario);
		// $stmt->execute();
		// $stmt->bind_result($activacion);
		// $stmt->fetch();
		
		if ($resp->activacion == 1)
		{
			return true;
		}
		else
		{
			return false;	
        }
    }

    public function lastSession($id)
	{

        $sql = "UPDATE usuarios SET last_session=NOW(), token_password='', password_request=0 WHERE id = ?";
        $this->pdo->prepare($sql)->execute(array($id));


		// $stmt = $mysqli->prepare("UPDATE usuarios SET last_session=NOW(), token_password='', password_request=0 WHERE id = ?");
		// $stmt->bind_param('s', $id);
		// $stmt->execute();
		// $stmt->close();
    }
    
    public function usuarioExiste($usuario)
	{
	
		// $stmt = $mysqli->prepare("SELECT id FROM usuarios WHERE usuario = ? LIMIT 1");
		// $stmt->bind_param("s", $usuario);
		// $stmt->execute();
		// $stmt->store_result();
		// $num = $stmt->num_rows;
        // $stmt->close();
        
        $stm = $this->pdo->prepare("SELECT id FROM usuarios WHERE usuario = ? LIMIT 1");
            $stm->execute(array($usuario));
            $Usuarioexiste = $stm->fetch(PDO::FETCH_OBJ);
            $num = $stm->rowCount();

		if ($num > 0){
			return true;
			} else {
			return false;
		}
    }
    
    public function emailExiste($email)
	{
	
		// $stmt = $mysqli->prepare("SELECT id FROM usuarios WHERE correo = ? LIMIT 1");
		// $stmt->bind_param("s", $email);
		// $stmt->execute();
		// $stmt->store_result();
		// $num = $stmt->num_rows;
        // $stmt->close();
        
        $stm = $this->pdo->prepare("SELECT id FROM usuarios WHERE correo = ? LIMIT 1");
        $stm->execute(array($email));
        $Emailexiste = $stm->fetch(PDO::FETCH_OBJ);
        $num = $stm->rowCount();
		
		if ($num > 0){
			
		return true;
			} else {
			return false;	
		}
    }

    public function registraUsuario($usuario, $pass_hash, $nombre, $apellido, $telefono, $documento, $email, $activo, $token, $tipo_usuario)
    {
        $sql = "INSERT INTO usuarios (usuario, password, nombre, ApellidoU, telefonoU, DocIdentidad, correo, activacion, token, id_tipo) VALUES(?,?,?,?,?,?,?,?,?,?)";

    $stmt = $this->pdo->prepare($sql)
        ->execute(
            array(
                $usuario, $pass_hash, $nombre, $apellido, $telefono, $documento, $email, $activo, $token, $tipo_usuario)
        );
        if($stmt){
            return 1;
        }else{
            return 0;
        }
		// $stmt = $mysqli->prepare("INSERT INTO usuarios (usuario, password, nombre, ApellidoU, telefonoU, DocIdentidad, correo, activacion, token, id_tipo) VALUES(?,?,?,?,?,?,?,?,?,?)");
		// $stmt->bind_param('sssssssisi', $usuario, $pass_hash, $nombre, $apellido, $telefono, $documento, $email, $activo, $token, $tipo_usuario);
        
        // if ($stmt->execute()){
		// 	return $mysqli->insert_id;
		// 	} else {
		// 	return 0;	
		// }		
    }

    
	public function validaIdToken($id, $token){

        
        $stm = $this->pdo->prepare("SELECT activacion FROM usuarios WHERE id = ? AND token = ? LIMIT 1");
        $stm->execute(array($id, $token));

        $verifica = $stm->fetch(PDO::FETCH_OBJ);
        $rows = $stm->rowCount();


		if($rows > 0) {
			
			if($verifica->activacion == 1){
				$msg = "La cuenta ya se activo anteriormente.";
				} else {
				if($this->activarUsuario($id)){
					$msg = 'Cuenta activada.';
					} else {
					$msg = 'Error al Activar Cuenta';
				}
			}
			} else {
			$msg = 'No existe el registro para activar.';
		}
		return $msg;
    }
    
    function activarUsuario($id)
	{

        $sql = "UPDATE usuarios SET activacion=1 WHERE id = ?";
        $resp= $this->pdo->prepare($sql)->execute(array($id));
		return $resp;
	}
    

}
