<?php

class Evento
{
    private $pdo;

    public $idEvento;
    public $idSede;
    public $idHorarioEventos;
    public $direccion;
    public $idDeportes;
    public $fecha;
    public $estado;


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

            $consulta = "CALL SP_GETEVENTOS();";

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
            $consulta = "CALL SP_GETEVENTO(".$id.")";

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

    public function Actualizar(Evento $data)
    {
        try
        {
            $consulta = "CALL SP_UPDATEEVENTO(".$data->idEvento.", '$data->idSede', '$data->idHorarioEventos', '$data->direccion', '$data->idDeportes', '$data->fecha', '$data->estado')";

            if ($this->pdo->query($consulta)){
                return 1;
            }
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Registrar(Evento $data)
    {
        try
        {
//            $consulta = "CALL SP_REGEVENTO('".$data->idSede."' ,'".$data->idHorarioEventos."','".$data->direccion."','".$data->idDeportes."','".$data->fecha."','".$data->estado."')";

            $sql = "CALL SP_REGEVENTO(?,?,?,?,?,?)";

            $this->pdo->prepare($sql)->execute(
                array($data->idSede, $data->idHorarioEventos, $data->direccion, $data->idDeportes, $data->fecha, $data->estado));

            return $this->get_last_id("idEvento","eventos");

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
