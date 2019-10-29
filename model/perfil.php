<?php
class Perfil
{
    private $pdo;
    private $table = 't_perfil';

    public $idt_perfil;
    public $titulo;
    public $descripcion;

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
                ->prepare("SELECT * FROM ".$this->table." WHERE idt_perfil = ?");


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
                ->prepare("DELETE FROM ".$this->table." WHERE idt_perfil = ?");

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
            $sql = "UPDATE ".$this->table." SET titulo = ?, descripcion = ? WHERE idt_perfil = ?";

            $this->pdo->prepare($sql)->execute(
                array(
                    $data->titulo,
                    $data->descripcion
                ));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Registrar(Perfil $data)
    {
        try
        {
            $sql = "INSERT INTO ".$this->table." (titulo, descripcion) VALUES (?,?)";

            $this->pdo->prepare($sql)
                ->execute(
                    array(
                        $data->titulo,
                        $data->descripcion
                    ));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }
}
