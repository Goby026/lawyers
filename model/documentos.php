<?php
class Documentos
{
    private $pdo;
    private $table = 't_documento';

    public $t_DocuCod;
    public $t_DocuDescripcion;
    public $t_url;
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
                ->prepare("SELECT * FROM ".$this->table." WHERE t_DocuCod = ?");


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
                ->prepare("DELETE FROM ".$this->table." WHERE t_DocuCod = ?");

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
            $sql = "UPDATE ".$this->table." SET t_DocuDescripcion = ?, t_url = ?, t_CasoCod = ? WHERE t_DocuCod = ?";

            $this->pdo->prepare($sql)->execute(
                array(
                    $data->t_DocuDescripcion,
                    $data->t_url,
                    $data->t_CasoCod,
                    $data->t_DocuCod
                ));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Registrar(Documentos $data)
    {
        try
        {
            $sql = "INSERT INTO ".$this->table." (t_DocuDescripcion, t_url, t_CasoCod) VALUES (?,?,?)";

            $this->pdo->prepare($sql)
                ->execute(
                    array(
                        $data->t_DocuDescripcion,
                        $data->t_url,
                        $data->t_CasoCod,
                    )
                );
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }
}
