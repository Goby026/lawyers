<?php
class Abogado
{
	private $pdo;
	private $table = 't_abogado';

    public $t_AboCod;
    public $t_AboNombre;
    public $t_AboApellidos;
    public $t_AboDni;
    public $t_AboDireccion;
    public $t_AboTelfcel;
    public $t_AboTelf;
    public $t_AboCorreo;
    public $t_AboDepartamento;
    public $t_AboProvincia;
    public $t_AboDistrito;
    public $t_AboContrasena;
    public $idt_usuario;

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

			$stm = $this->pdo->prepare("SELECT * FROM ".$this->table);
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
			          ->prepare("SELECT * FROM ".$this->table." WHERE t_AboCod = ?");
			          

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
			            ->prepare("DELETE FROM ".$this->table." WHERE t_AboCod = ?");

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
			$sql = "UPDATE ".$this->table." SET t_AboNombre= ?, t_AboApellidos = ?,t_AboDni  = ?, t_AboDireccion = ?, t_AboTelfcel = ?, t_AboTelf = ?, t_AboCorreo = ?, t_AboDepartamento = ?, t_AboProvincia = ?, t_AboDistrito = ?, t_AboContraseña = ?, idt_usuario = ? WHERE t_AboCod = ?";

			$this->pdo->prepare($sql)->execute(
				    array(
                        $data->t_AboNombre,
                        $data->t_AboApellidos,
                        $data->t_AboDni,
                        $data->t_AboDireccion,
                        $data->t_AboTelfcel,
                        $data->t_AboTelf,
                        $data->t_AboCorreo,
                        $data->t_AboDepartamento,
                        $data->t_AboProvincia,
                        $data->t_AboDistrito,
                        $data->t_AboContraseña,
                        $data->idt_usuario,
                        $data->t_AboCod,
                    ));
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

	public function Registrar(Alumno $data)
	{
		try 
		{
		$sql = "INSERT INTO ".$this->table." (t_AboNombre,t_AboApellidos,t_AboDni,t_AboDireccion,t_AboTelfcel,t_AboTelf,t_AboCorreo,t_AboDepartamento,t_AboProvincia,t_AboDistrito,t_AboContraseña,idt_usuario) 
		        VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?)";

		$this->pdo->prepare($sql)
		     ->execute(
				array(
                    $data->t_AboNombre,
                    $data->t_AboApellidos,
                    $data->t_AboDni,
                    $data->t_AboDireccion,
                    $data->t_AboTelfcel,
                    $data->t_AboTelf,
                    $data->t_AboCorreo,
                    $data->t_AboDepartamento,
                    $data->t_AboProvincia,
                    $data->t_AboDistrito,
                    $data->t_AboContraseña,
                    $data->idt_usuario,
                )
			);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}
}
