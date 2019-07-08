<?php
class Categorias
{
    private $pdo;

    // public $IdEvento;
    // public $Dia;
    // public $HoraInicio;
    // public $HoraFin;
    // public $IdSede;
    // public $IdDeporte;


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

    public function CategoriasxIdEvento()
    {
        try
        {

            $consulta = "CALL get_CategoriaPrecioxIdEvento('".$_SESSION['IdEvento']."');";

            $stm = $this->pdo->query($consulta);

            return $stm->fetchAll(PDO::FETCH_OBJ);
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }
    
    public function ImagenxIdEvento()
    {
        try
        {

            $consulta = "CALL get_ImagenxIdEvento('".$_SESSION['IdEvento']."');";

            $stm = $this->pdo->query($consulta);

            return $stm->fetchAll(PDO::FETCH_OBJ);
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }
    
    public function NombreCategoriaxIdCategoria()
    {
        try
        {

            $consulta = "CALL get_NombreCategoriaxIdCategoria('".$_SESSION['IdCategoria']."');";

            $stm = $this->pdo->query($consulta);

            return $stm->fetchAll(PDO::FETCH_OBJ);
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }
    
    
}