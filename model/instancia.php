<?php
class Instancia
{
	private $pdo;
	private $table = 't_instancia';

    public $t_InsCod;
    public $t_InsNombre;
    public $t_InsDescripcion;

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
			          ->prepare("SELECT * FROM ".$this->table." WHERE t_InsCod = ?");
			          

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
			            ->prepare("DELETE FROM ".$this->table." WHERE t_InsCod = ?");

			$stm->execute(array($id));

			return true;
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
		return false;
	}

	public function Actualizar($data)
	{
		try 
		{
			$sql = "UPDATE ".$this->table." SET t_InsNombre= ?, t_InsDescripcion = ? WHERE t_InsCod = ?";

			$this->pdo->prepare($sql)->execute(
				    array($data->t_InsNombre, $data->t_InsDescripcion, $data->t_InsCod)
				);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Registrar(Instancia $data)
	{
		try 
		{
		$sql = "INSERT INTO ".$this->table." (t_InsNombre,t_InsDescripcion) VALUES (?, ?)";

		$this->pdo->prepare($sql)
		     ->execute(
				array(
                    $data->t_InsNombre,
                    $data->t_InsDescripcion,
                )
			);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

}
