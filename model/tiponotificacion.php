<?php
class Tiponotificacion
{
	private $pdo;
	private $table = "tiponotificacion";
    
    public $idtiponotificacion;
    public $nombre;
    public $descripcion;
    public $icono;
    public $state;

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
			          ->prepare("SELECT * FROM ".$this->table." WHERE idtiponotificacion = ?");
			          

			$stm->execute(array($id));
			return $stm->fetch(PDO::FETCH_OBJ);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

    public function ObtenerPorUsuario($idUsuario)
    {
        try
        {
            $stm = $this->pdo
                ->prepare("SELECT * FROM ".$this->table." WHERE idtiponotificacion = ?");


            $stm->execute(array($idUsuario));
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
                    ->prepare("DELETE FROM ".$this->table." WHERE idtiponotificacion = ?");

			$stm->execute(array($id));
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

	public function Actualizar(Tiponotificacion $data)
	{
		try 
		{
			$sql = "UPDATE ".$this->table." SET state = ? WHERE idtiponotificacion = ?";

			$this->pdo->prepare($sql)->execute(
				    array(
                        $data->state,
                        $data->idtiponotificacion
                    )
				);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

	public function Registrar(Tiponotificacion $data)
	{
		try
		{

		$sql = "INSERT INTO ".$this->table." (nombre, description, icono, state) VALUES (?,?,?,?)";

		$this->pdo->prepare($sql)
		     ->execute(
				array(
                    $data->nombre,
                    $data->descripcion,
                    $data->icono,
                    $data->state
                )
			);

            return $this->get_last_id("idnotificacion",$this->table);

		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

    function get_last_id($nombre_id, $tabla){
        try
        {
            $result = array();
            $stm = $this->pdo->prepare("SELECT MAX($nombre_id) AS id FROM $tabla");
            $stm->execute();
            $result = $stm->fetch(PDO::FETCH_OBJ);
            return $result;
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }
}
