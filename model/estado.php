<?php
class Estado
{
    private $pdo;
    private $table = 't_estado';

    public $t_estado;
    public $title;
    public $color;
    public $t_observacion;

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
                ->prepare("SELECT * FROM ".$this->table." WHERE t_estado = ?");


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
                ->prepare("DELETE FROM ".$this->table." WHERE t_estado = ?");

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
            $sql = "UPDATE ".$this->table." SET title = ?, color = ?, t_observacion = ? WHERE t_estado = ?";

            $this->pdo->prepare($sql)->execute(
                array(
                    $data->title,
                    $data->color,
                    $data->t_observacion,
                    $data->t_estado
                ));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Registrar(Estado $data)
    {
        try
        {
            $sql = "INSERT INTO ".$this->table." (title, color, t_observacion) VALUES (?,?,?)";

            $this->pdo->prepare($sql)
                ->execute(
                    array(
                        $data->title,
                        $data->color,
                        $data->t_observacion
                    ));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }
}
