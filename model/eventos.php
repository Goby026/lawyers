<?php
class Eventos
{
    private $pdo;

    public $IdEvento;
    public $Dia;
    public $HoraInicio;
    public $HoraFin;
    public $IdSede;
    public $IdDeporte;


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

    public function EventosxIdSede()
    {
        try
        {

            $consulta = "CALL get_EventosxSede('".$_SESSION['IdSede']."');";

            $stm = $this->pdo->query($consulta);

            return $stm->fetchAll(PDO::FETCH_OBJ);
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }
}