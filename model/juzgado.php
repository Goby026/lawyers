<?php
class Juzgado
{
    private $pdo;
    private $table = 't_juzgado';

    public $idt_juzgado;
    public $nombre;
    public $direccion;
    public $telefono;
    public $horariom;
    public $horariot;

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
                ->prepare("SELECT * FROM ".$this->table." WHERE idt_juzgado = ?");


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
                ->prepare("DELETE FROM ".$this->table." WHERE idt_juzgado = ?");

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
            $sql = "UPDATE ".$this->table." SET nombre = ?, direccion = ?, telefono = ?, horariom = ?, horariot = ? WHERE idt_juzgado = ?";

            $this->pdo->prepare($sql)->execute(
                array(
                    $data->nombre,
                    $data->direccion,
                    $data->telefono,
                    $data->horariom,
                    $data->horariot,
                    $data->idt_juzgado
                ));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Registrar(Juzgado $data)
    {
        try
        {
            $sql = "INSERT INTO ".$this->table." (nombre, direccion, telefono,horariom, horariot) VALUES (?,?,?,?,?)";

            $this->pdo->prepare($sql)
                ->execute(
                    array(
                        $data->nombre,
                        $data->direccion,
                        $data->telefono,
                        $data->horariom,
                        $data->horariot
                    ));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }
}
