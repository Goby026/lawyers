<?php
class Materia
{
	private $pdo;
	private $table = 't_materia';

    public $t_MateCod;
    public $t_MateDescripcion;

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
			          ->prepare("SELECT * FROM ".$this->table." WHERE t_MateCod = ?");
			          

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
			            ->prepare("DELETE FROM ".$this->table." WHERE t_MateCod = ?");

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
			$sql = "UPDATE ".$this->table." SET t_MateDescripcion = ? WHERE t_MateCod = ?";

			$this->pdo->prepare($sql)->execute(
				    array($data->t_MateDescripcion, $data->t_MateCod)
				);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Registrar(Materia $data)
	{
		try 
		{
		$sql = "INSERT INTO ".$this->table." (t_MateDescripcion) VALUES (?)";

		$this->pdo->prepare($sql)
		     ->execute(
				array(
                    $data->t_MateDescripcion,
                )
			);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}
}
