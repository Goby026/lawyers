<?php
class Audiencia
{
    private $pdo;
    private $table = 't_audiencia';

    public $t_AudiCod;
    public $asunto;
    public $t_AudiDireccion;
    public $t_AudiHora;
    public $t_AudiFecha;
    public $t_AudiObservaciones;
    public $t_casocod;
    public $t_estado;
    public $idt_juzgado;

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

            $stm = $this->pdo->prepare("SELECT * FROM t_caso c 
inner join ".$this->table." a on a.t_casocod = c.t_CasoCod
inner join t_juzgado j on a.idt_juzgado = j.idt_juzgado
inner join t_estado e on a.t_estado = e.t_estado where c.t_CasoCod = ".$id);
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
                ->prepare("SELECT * FROM ".$this->table." WHERE t_AudiCod = ?");


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
                ->prepare("DELETE FROM ".$this->table." WHERE t_AudiCod = ?");

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
            $sql = "UPDATE ".$this->table." SET asunto = ?, t_AudiDireccion = ?, t_AudiHora = ?, t_AudiFecha = ?, t_AudiObservaciones = ?, t_casocod = ?, t_estado = ?, idt_juzgado = ? WHERE t_AudiCod = ?";

            $this->pdo->prepare($sql)->execute(
                array(
                    $data->asunto,
                    $data->t_AudiDireccion,
                    $data->t_AudiHora,
                    $data->t_AudiFecha,
                    $data->t_AudiObservaciones,
                    $data->t_casocod,
                    $data->t_estado,
                    $data->idt_juzgado,
                    $data->t_AudiCod
                ));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Registrar(Audiencia $data)
    {
        try
        {
            $sql = "INSERT INTO ".$this->table." (asunto, t_AudiDireccion, t_AudiHora, t_AudiFecha,t_AudiObservaciones, t_casocod, t_estado, idt_juzgado) VALUES (?,?,?,?,?,?,?,?)";

            $this->pdo->prepare($sql)
                ->execute(
                    array(
                        $data->asunto,
                        $data->t_AudiDireccion,
                        $data->t_AudiHora,
                        $data->t_AudiFecha,
                        $data->t_AudiObservaciones,
                        $data->t_casocod,
                        $data->t_estado,
                        $data->idt_juzgado
                    ));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }
}
