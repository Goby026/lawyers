<?php
class Participantes
{
	private $pdo;
    
    public $id;
    public $nombre;
    public $apellidop;
    public $apellidom;
    public $foto;
    public $pais;
    

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

            $consulta = "CALL SP_GETPARTICIPANTES();";

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
            $consulta = "CALL SP_GETPARTICIPANTE(".$id.")";

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
            $consulta = "CALL SP_DELPARTICIPANTE(".$id.")";
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

    public function Actualizar(Participantes $data)
    {
        try
        {
            $consulta = "CALL SP_UPDATEPARTICIPANTE(".$data->id.", '$data->nombre', '$data->apellidop', '$data->apellidom', '$data->pais', '$data->foto')";

            if ($this->pdo->query($consulta)){
                return 1;
            }
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Registrar(Participantes $data)
    {
        try
        {

            $consulta = "CALL SP_REGPARTICIPANTES('".$data->nombre."' ,'".$data->apellidop."','".$data->apellidom."','".$data->pais."','".$data->foto."' )";

            $this->pdo->query($consulta);
            return 1;
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

}
