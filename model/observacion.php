<?php
class Observacion
{
    private $pdo;
    private $table = 't_observacion';

    public $idt_observacion;
    public $title;
    public $description;
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
                ->prepare("SELECT * FROM ".$this->table." WHERE idt_observacion = ?");


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
                ->prepare("DELETE FROM ".$this->table." WHERE idt_observacion = ?");

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
            $sql = "UPDATE ".$this->table." SET title = ?, description = ?, t_CasoCod = ? WHERE idt_observacion = ?";

            $this->pdo->prepare($sql)->execute(
                array(
                    $data->title,
                    $data->description,
                    $data->t_CasoCod
                ));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Registrar(Observacion $data)
    {
        try
        {
            $sql = "INSERT INTO ".$this->table." (title, description, t_CasoCod) VALUES (?,?,?)";

            $this->pdo->prepare($sql)
                ->execute(
                    array(
                        $data->title,
                        $data->description,
                        $data->t_CasoCod
                    )
                );
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }
}
