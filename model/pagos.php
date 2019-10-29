<?php
class Pagos
{
    private $pdo;
    private $table = 't_pagos';

    public $idPagoCod;
    public $t_PagoMonto;
    public $t_PagoMontoInicial;
    public $t_PagoDescrip;
    public $t_CasoCod;

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

    public function Listar($id)
    {
        try
        {
            $result = array();

            $stm = $this->pdo->prepare("SELECT * FROM ".$this->table." WHERE t_CasoCod = ".$id);
            $stm->execute();

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
            $stm = $this->pdo
                ->prepare("SELECT * FROM ".$this->table." WHERE idPagoCod = ?");


            $stm->execute(array($id));
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
            $stm = $this->pdo
                ->prepare("DELETE FROM ".$this->table." WHERE idPagoCod = ?");

            $stm->execute(array($id));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Actualizar($data)
    {
        try
        {
            $sql = "UPDATE ".$this->table." SET t_PagoMonto = ?, t_PagoMontoInicial = ?, t_PagoDescrip = ?, t_CasoCod = ? WHERE idPagoCod = ?";

            $this->pdo->prepare($sql)->execute(
                array(
                    $data->t_PagoMonto,
                    $data->t_PagoMontoInicial,
                    $data->t_PagoDescrip,
                    $data->t_CasoCod,
                    $data->idPagoCod
                ));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Registrar(Pagos $data)
    {
        try
        {
            $sql = "INSERT INTO ".$this->table." (t_PagoMonto, t_PagoMontoInicial, t_PagoDescrip, t_CasoCod) VALUES (?,?,?,?)";

            $this->pdo->prepare($sql)
                ->execute(
                    array(
                        $data->t_PagoMonto,
                        $data->t_PagoMontoInicial,
                        $data->t_PagoDescrip,
                        $data->t_CasoCod,
                    )
                );
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }
}
