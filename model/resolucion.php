<?php
class Resolucion
{
    private $pdo;
    private $table = 't_resolucion';

    public $idResoCod;
    public $t_ResoDescripcion;
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
                ->prepare("SELECT * FROM ".$this->table." WHERE idResoCod = ?");


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
                ->prepare("DELETE FROM ".$this->table." WHERE idResoCod = ?");

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
            $sql = "UPDATE ".$this->table." SET t_ResoDescripcion = ?, t_CasoCod = ? WHERE idResoCod = ?";

            $this->pdo->prepare($sql)->execute(
                array(
                    $data->t_ResoDescripcion,
                    $data->t_CasoCod,
                    $data->idResoCod
                ));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Registrar(Resolucion $data)
    {
        try
        {
            $sql = "INSERT INTO ".$this->table." (t_ResoDescripcion, t_CasoCod) VALUES (?,?)";

            $this->pdo->prepare($sql)
                ->execute(
                    array(
                        $data->t_ResoDescripcion,
                        $data->t_CasoCod,
                    ));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }
}
