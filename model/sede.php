<?php
class Sede
{
	private $pdo;
    
    public $idSede;
    public $idTipoSede;
    public $imgSede;
    public $DireccionSede;

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

            $consulta = "CALL SP_GETSEDES();";

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
            $consulta = "CALL SP_GETVIDEO(".$id.")";

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
            $consulta = "CALL SP_DELVIDEO(".$id.")";
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

    public function Actualizar(Video $data)
    {
        try
        {
            $consulta = "CALL SP_UPDATEVIDEO(".$data->codigo.", '$data->nombre', '$data->video')";

            if ($this->pdo->query($consulta)){
                return 1;
            }
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Registrar(Video $data)
    {
        try
        {

            $consulta = "CALL SP_REGVIDEO('".$data->nombre."' ,'".$data->video."' )";

            $this->pdo->query($consulta);
            return 1;
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }
}
