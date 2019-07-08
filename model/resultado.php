<?php
class Resultado
{
    private $pdo;

    public $idresutado;
    public $idEvento;
    public $pais1;
    public $pais2;
    public $res1;
    public $res2;
    public $fechaSistema;

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

            $consulta = "CALL SP_GETRESULTADOS();";

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
            $consulta = "CALL SP_GETRESULTADO(".$id.")";

            $stm = $this->pdo->query($consulta);

            //$stm->execute(array($id));

            return $stm->fetchAll(PDO::FETCH_OBJ);

        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Eliminar($id)
    {
        try
        {
            $consulta = "CALL .......(".$id.")";
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

    public function Actualizar(Resultado $data)
    {
        try
        {
            $sql = "CALL SP_UPDATERESULTADO(?,?,?,?,?,?)";

            $this->pdo->prepare($sql)->execute(
                array(
                    $data->idresutado,
                    $data->idEvento,
                    $data->pais1,
                    $data->pais2,
                    $data->res1,
                    $data->res2
                ));

        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Registrar(Resultado $data)
    {
        try
        {
            $sql = "CALL SP_REGRESULTADO(?, ?, ?, ?, ?)";

            $this->pdo->prepare($sql)
                ->execute(
                    array(
                        $data->idEvento,
                        $data->pais1,
                        $data->pais2,
                        $data->res1,
                        $data->res2
                    )
                );
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }
}
