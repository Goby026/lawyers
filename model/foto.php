<?php
class Foto
{
	private $pdo;
    
    public $codigo;
    public $nombre;
    public $foto;
    

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

            $consulta = "CALL SP_GETFOTOS();";

			$stm = $this->pdo->query($consulta);

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
		    $consulta = "CALL SP_GETFOTO(".$id.")";

			$stm = $this->pdo->query($consulta);

			//$stm->execute(array($id));

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
		    $consulta = "CALL SP_DELFOTO(".$id.")";
			$stm = $this->pdo->query($consulta);

			if ($stm){
			    return 1;
            }

			//$stm->execute(array($id));
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

	public function Actualizar(Foto $data)
	{
		try
		{
			$consulta = "CALL SP_UPDATEFOTO(".$data->codigo.", '$data->nombre', '$data->foto')";

			if ($this->pdo->query($consulta)){
			    return 1;
            }
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Registrar(Foto $data)
	{
		try
		{

			$consulta = "CALL SP_REGFOTO('".$data->nombre."' ,'".$data->foto."' )";

			$this->pdo->query($consulta);
			return 1;
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}
}
