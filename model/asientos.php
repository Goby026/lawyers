<?php
class Asientos
{
    private $pdo;

    public $idAsiento;
    public $numero;
    public $IdEstado;
    public $idCategAsiento;
    public $Precio;
    public $IdSede;

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

    public function ListarCategoriaAsientos()
    {
        try
        {
            $result = array();

            $consulta = "CALL get_AsientosxIdCategoriaxIdSede('".$_SESSION['IdCategoriaAsiento']."','".$_SESSION['IdSede']."');";

            $stm = $this->pdo->query($consulta);

            return $stm->fetchAll(PDO::FETCH_OBJ);
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }
}