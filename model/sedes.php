<?php
class Sedes
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
            $result = array();

            $consulta = "CALL get_Sedes();";

            $stm = $this->pdo->query($consulta);

            return $stm->fetchAll(PDO::FETCH_OBJ);
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }
    
    public function Ubicacion()
    {
        try
        {
            $result = array();

            $consulta = "CALL get_SedexIdSede('".$_SESSION['IdSede']."');";

            $stm = $this->pdo->query($consulta);

            return $stm->fetchAll(PDO::FETCH_OBJ);
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }
}