<?php
class Deportista
{
	private $pdo;
    
    public $idDeportistas;
    public $idDeporte;
    public $descripcion;
    public $idPais;
    public $nombres;
    public $apellidos;
    public $peso;
    public $talla;

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

			$stm = $this->pdo->prepare("CALL SP_GETDEPORTISTAS()");
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
			          ->prepare("CALL SP_GETDEPORTISTAS(?)");
			          

			$stm->execute(array($id));
			return $stm->fetch(PDO::FETCH_OBJ);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

    public function Busqueda($id)
    {
        try
        {
            $stm = $this->pdo
                ->prepare("CALL SP_FINDDEPORTISTA(?)");


            $stm->execute(array($id));
            return $stm->fetchAll(PDO::FETCH_OBJ);

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
			            ->prepare("CALL SP_DELDEPORTISTA(?)");

			$stm->execute(array($id));
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

	public function Actualizar(Deportista $data)
	{
		try 
		{
			$sql = "CALL SP_UPDATEDEPORTISTA(?,?,?,?,?,?,?,?)";

			$this->pdo->prepare($sql)->execute(
				    array(
				        $data->idDeportistas,
                        $data->idDeporte,
                        $data->descripcion,
                        $data->idPais,
                        $data->nombres,
                        $data->apellidos,
                        $data->peso,
                        $data->talla)
				);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

	public function Registrar(Deportista $data)
	{
		try 
		{
		$sql = "CALL SP_REGDEPORTISTA(?,?,?,?,?,?,?)";

		$this->pdo->prepare($sql)
		     ->execute(
				array(
                    $data->idDeporte,
                    $data->descripcion,
                    $data->idPais,
                    $data->nombres,
                    $data->apellidos,
                    $data->peso,
                    $data->talla
                )
			);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}
}
