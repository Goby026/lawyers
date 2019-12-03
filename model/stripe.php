<?php
class Stripe
{
    private $pdo;
    private $table = 'stripe';

    public $id;
    public $name;
    public $email;
    public $card_number;
    public $card_exp_month;
    public $card_exp_year;
    public $item_name;
    public $item_number;
    public $item_price;
    public $item_price_currency;
    public $paid_amount;
    public $paid_amount_currency;
    public $txn_id;
    public $payment_status;
    public $created;
    public $modified;
    public $idt_usuario;

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

            $stm = $this->pdo->prepare("SELECT * FROM ".$this->table." WHERE id = ".$id); //debe ser por usuario
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
                ->prepare("SELECT * FROM ".$this->table." WHERE id = ?");


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
                ->prepare("DELETE FROM ".$this->table." WHERE id = ?");

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
//            $sql = "UPDATE ".$this->table." SET t_PagoMonto = ?, t_PagoMontoInicial = ?, t_PagoDescrip = ?, t_CasoCod = ? WHERE idPagoCod = ?";

//            $this->pdo->prepare($sql)->execute(
//                array(
//                    $data->t_PagoMonto,
//                    $data->t_PagoMontoInicial,
//                    $data->t_PagoDescrip,
//                    $data->t_CasoCod,
//                    $data->idPagoCod
//                ));
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }

    public function Registrar(Stripe $data)
    {
        try
        {
            $sql = "INSERT INTO ".$this->table."(name,email,card_number,card_exp_month,card_exp_year,item_name,item_number,item_price,item_price_currency,paid_amount,paid_amount_currency,txn_id,payment_status,created,modified, idt_usuario) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,NOW(),NOW(),?)";

//            $sql = "INSERT INTO ".$this->table." (t_PagoMonto, t_PagoMontoInicial, t_PagoDescrip, t_CasoCod) VALUES (?,?,?,?)";

            $this->pdo->prepare($sql)
                ->execute(
                    array(
                        $data->name,
                        $data->email,
                        $data->card_number,
                        $data->card_exp_month,
                        $data->card_exp_year,
                        $data->item_name,
                        $data->item_number,
                        $data->item_price,
                        $data->item_price_currency,
                        $data->paid_amount,
                        $data->paid_amount_currency,
                        $data->txn_id,
                        $data->payment_status,
                        $data->idt_usuario
                    )
                );
        } catch (Exception $e)
        {
            die($e->getMessage());
        }
    }
}
