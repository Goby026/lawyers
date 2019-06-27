<?php
class DetalleEvento
{
    private $pdo;

    public $idDetalleEvento;
    public $idEvento;
    public $idDeportista;
    public $idPais;

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

            $consulta = "CALL SP_GETDETALLEEVENTOS();";

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
            $consulta = "CALL GET_EVENTO(".$id.")";

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
            $consulta = "CALL SP_UPDATEFOTO(".$data->codigo.", '$data->nombre', '$data->foto')";

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
            $consulta = "CALL SP_REGEVENTO('".$data->idSede."' ,'".$data->idHorarioEventos."','".$data->direccion."','".$data->idDeportes."','".$data->fecha."','".$data->estado."')";

            $this->pdo->query($consulta);
            return 1;
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }
}
