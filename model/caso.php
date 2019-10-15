<?php
class Caso
{
	private $pdo;
	private $table = 't_caso';
    
    public $t_CasoCod;
    public $caso_titulo;
    public $cod_demandante;
    public $cod_demandado;
    public $t_CasoFech;
    public $t_CasoNumExp;
    public $t_AboCod;
    public $t_CasoJuzgado;
    public $t_CasoObservaciones;
    public $t_pagoTotal;
    public $idt_usuario;
    public $idt_cliente;
    public $t_MateCod;
    public $t_InsCod;
    public $idt_EstadoCaso;

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

			$stm = $this->pdo->prepare("SELECT * FROM ".$this->table." c
inner join t_cliente cli on c.idt_cliente = cli.idt_cliente");
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
			          ->prepare("SELECT * FROM ".$this->table." WHERE t_CasoCod = ?");
			          

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
			            ->prepare("DELETE FROM ".$this->table." WHERE t_CasoCod = ?");

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
			$sql = "UPDATE ".$this->table." SET caso_titulo = ?,cod_demandante  = ?, cod_demandado = ?, t_CasoFech = ?, t_CasoNumExp = ?, t_AboCod = ?,t_CasoJuzgado = ?, t_CasoObservaciones = ?, t_pagoTotal = ?, idt_usuario = ?, idt_cliente = ?, t_MateCod = ?, t_InsCod = ?, idt_EstadoCaso = ? WHERE t_CasoCod= ?";

			$this->pdo->prepare($sql)->execute(
				    array(
                        $data->caso_titulo,
                        $data->cod_demandante,
                        $data->cod_demandado,
                        $data->t_CasoFech,
                        $data->t_CasoNumExp,
                        $data->t_AboCod,
                        $data->t_CasoJuzgado,
                        $data->t_CasoObservaciones,
                        $data->t_pagoTotal,
                        $data->idt_usuario,
                        $data->idt_cliente,
                        $data->t_MateCod,
                        $data->t_InsCod,
                        $data->idt_EstadoCaso,
                        $data->t_CasoCod,
                    )
				);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

	public function Registrar(Caso $data)
	{
		try 
		{
		$sql = "INSERT INTO ".$this->table." (caso_titulo,cod_demandante,cod_demandado,t_CasoFech,t_CasoNumExp,t_AboCod, t_CasoJuzgado,t_CasoObservaciones,t_pagoTotal,idt_usuario,idt_cliente,t_MateCod,t_InsCod, idt_EstadoCaso) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		$this->pdo->prepare($sql)
		     ->execute(
				array(
                    $data->caso_titulo,
                    $data->cod_demandante,
                    $data->cod_demandado,
                    $data->t_CasoFech,
                    $data->t_CasoNumExp,
                    $data->t_AboCod,
                    $data->t_CasoJuzgado,
                    $data->t_CasoObservaciones,
                    $data->t_pagoTotal,
                    $data->idt_usuario,
                    $data->idt_cliente,
                    $data->t_MateCod,
                    $data->t_InsCod,
                    $data->idt_EstadoCaso,
                )
			);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}
}
