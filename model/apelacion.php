<?php
class Apelacion
{
    private $pdo;
    private $table = 't_apelacion';

    public $t_ApeCod;
    public $t_ApeResolucion;
    public $t_ApeObservacion;
    public $t_CasoCod;
    public $t_estado;

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

            $stm = $this->pdo->prepare("SELECT * FROM ".$this->table);
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
                ->prepare("SELECT * FROM ".$this->table." WHERE t_ApeCod = ?");


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
                ->prepare("DELETE FROM ".$this->table." WHERE t_ApeCod = ?");

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
            $sql = "UPDATE ".$this->table." SET t_ApeResolucion = ?, t_ApeObservacion = ?, t_CasoCod = ?, t_estado = ? WHERE t_ApeCod = ?";

            $this->pdo->prepare($sql)->execute(
                array(
                    $data->t_ApeResolucion,
                    $data->t_ApeObservacion,
                    $data->t_CasoCod,
                    $data->t_estado,
                    $data->t_ApeCod
                ));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Registrar(Apelacion $data)
    {
        try
        {
            $sql = "INSERT INTO ".$this->table." (t_ApeResolucion, t_ApeObservacion, t_CasoCod,t_estado) VALUES (?,?,?,?)";

            $this->pdo->prepare($sql)
                ->execute(
                    array(
                        $data->t_ApeResolucion,
                        $data->t_ApeObservacion,
                        $data->t_CasoCod,
                        $data->t_estado,
                    ));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }
}
