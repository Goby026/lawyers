<?php
class Estadocaso
{
    private $pdo;
    private $table = 't_estadocaso';

    public $idt_EstadoCaso;
    public $title;
    public $description;
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
                ->prepare("SELECT * FROM ".$this->table." WHERE idt_EstadoCaso = ?");


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
                ->prepare("DELETE FROM ".$this->table." WHERE idt_EstadoCaso = ?");

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
            $sql = "UPDATE ".$this->table." SET title = ?, description = ? WHERE idt_EstadoCaso = ?";

            $this->pdo->prepare($sql)->execute(
                array(
                    $data->title,
                    $data->description,
                    $data->idt_EstadoCaso
                ));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Registrar(Estadocaso $data)
    {
        try
        {
            $sql = "INSERT INTO ".$this->table." (title, description) VALUES (?,?)";

            $this->pdo->prepare($sql)
                ->execute(
                    array(
                        $data->title,
                        $data->description
                    )
                );
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }
}
