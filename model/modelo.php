<?php
class Modelo
{
    private $pdo;
    private $table = 't_modelo';

    public $idmodelo;
    public $t_url;
    public $t_title;
    public $body;
    public $idt_usuario;
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
                ->prepare("SELECT * FROM ".$this->table." WHERE idmodelo = ?");


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
                ->prepare("DELETE FROM ".$this->table." WHERE idmodelo = ?");

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
            $sql = "UPDATE ".$this->table." SET t_url = ?, t_title = ?, body = ?, idt_usuario = ? WHERE idmodelo = ?";

            $this->pdo->prepare($sql)->execute(
                array(
                    $data->t_url,
                    $data->t_title,
                    $data->body,
                    $data->idt_usuario,
                    $data->idmodelo
                ));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Registrar(Modelo $data)
    {
        try
        {
            $sql = "INSERT INTO ".$this->table." (t_url, t_title, body,idt_usuario) VALUES (?,?,?,?)";

            $this->pdo->prepare($sql)
                ->execute(
                    array(
                        $data->t_url,
                        $data->t_title,
                        $data->body,
                        $data->idt_usuario
                    )
                );
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }
}
