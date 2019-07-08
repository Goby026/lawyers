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

            $consulta = "CALL get_AsientosxIdCategoriaxIdSede('".$_SESSION['IdCategoria']."','".$_SESSION['IdEvento']."');";

            $stm = $this->pdo->query($consulta);

            return $stm->fetchAll(PDO::FETCH_OBJ);
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }
    
    public function ListarDetalleEvento()
    {
        try
        {
            $result = array();

            $consulta = "CALL get_DetalleEvento('".$_SESSION['IdEvento']."','".$_SESSION['IdCategoria']."');";

            $stm = $this->pdo->query($consulta);

            return $stm->fetchAll(PDO::FETCH_OBJ);
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }
}