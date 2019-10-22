<?php
class Cliente
{
	private $pdo;
	private $table = 't_cliente';

    public $idt_cliente;
    public $idt_tipoCliente;
    public $nombres;
    public $apellidos;
    public $dni;
    public $ruc;
    public $razon_social;
    public $direccion;
    public $telefono;
    public $telefono2;
    public $fec_nac;
    public $dpto;
    public $prov;
    public $dist;
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

    public function ListarTipo($tipo)
    {
        try
        {
            $result = array();

            $stm = $this->pdo->prepare("SELECT * FROM ".$this->table." WHERE idt_tipoCliente = ".$tipo.";");
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
			          ->prepare("SELECT * FROM ".$this->table." WHERE idt_cliente = ?");
			          

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
			            ->prepare("DELETE FROM ".$this->table." WHERE idt_cliente = ?");

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
			$sql = "UPDATE ".$this->table." SET idt_tipoCliente= ?, nombres = ?,apellidos  = ?, dni = ?, ruc = ?, razon_social = ?, direccion = ?, telefono = ?, telefono2 = ?, fec_nac = ?, dpto = ?, prov = ?, dist = ?, fechaSistema = ? WHERE idt_cliente = ?";

			$this->pdo->prepare($sql)->execute(
				    array(
                        $data->idt_tipoCliente,
                        $data->nombres,
                        $data->apellidos,
                        $data->dni,
                        $data->ruc,
                        $data->razon_social,
                        $data->direccion,
                        $data->telefono,
                        $data->telefono2,
                        $data->fec_nac,
                        $data->dpto,
                        $data->prov,
                        $data->dist,
                        $data->fechaSistema,
                        $data->idt_cliente,
                    ));
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

	public function Registrar(Cliente $data)
	{
		try 
		{
		$sql = "INSERT INTO ".$this->table." (idt_tipoCliente,nombres,apellidos,dni,ruc, razon_social,direccion,telefono,telefono2,fec_nac,dpto, prov,dist,fechaSistema) 
		        VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?,?,?)";

		$this->pdo->prepare($sql)
		     ->execute(
				array(
                    $data->idt_tipoCliente,
                    $data->nombres,
                    $data->apellidos,
                    $data->dni,
                    $data->ruc,
                    $data->razon_social,
                    $data->direccion,
                    $data->telefono,
                    $data->telefono2,
                    $data->fec_nac,
                    $data->dpto,
                    $data->prov,
                    $data->dist,
                    $data->fechaSistema,
                )
			);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}
}
