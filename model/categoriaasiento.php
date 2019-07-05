<?php
class CategoriaAsiento
{
    private $pdo;

    public $idCategoriaAsiento;
    public $NombreCategoriaA;
    public $DescripCategoriaA;
    public $Color;

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

            $consulta = "CALL get_CategoriaAsiento();";

            $stm = $this->pdo->query($consulta);

            return $stm->fetchAll(PDO::FETCH_OBJ);
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }
    
    public function NombreCategoria()
    {
        try
        {
            $result = array();

            $consulta = "CALL get_CategoriaAsientoxidCategoriaAsiento('".$_SESSION['IdSede']."');";

            $stm = $this->pdo->query($consulta);

            return $stm->fetchAll(PDO::FETCH_OBJ);
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }
}