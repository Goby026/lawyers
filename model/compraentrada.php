<?php
class CompraEntrada
{
    private $pdo;

    // public $idAsiento;
    // public $numero;
    // public $IdEstado;
    // public $idCategAsiento;
    // public $Precio;
    // public $IdSede;

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

            $consulta = "CALL get_CompraEntradas('".$_SESSION['id_usuario']."');";

            $stm = $this->pdo->query($consulta);

            return $stm->fetchAll(PDO::FETCH_OBJ);
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }
    
    public function Registrar($ArrayAsientos)
    {
        try
        {
            $result = array();
            for($i = 0; $i <count($ArrayAsientos); $i++) {
                $consulta = "CALL set_CompraEntrada('".$_SESSION['id_usuario']."','".$_SESSION['IdEvento']."','".$ArrayAsientos[$i]."','".$_SESSION['Precio']."');";

                $stm = $this->pdo->query($consulta);
            }

            return $stm->fetchAll(PDO::FETCH_OBJ);
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }
}