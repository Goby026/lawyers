<?php
class Subnorma
{
	private $pdo;
    
    public $idSubNor;
    public $numSubNor;
    public $contSubNor;
    public $normaFK;
    


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
            
            $consulta = "CALL mgc_listarSubnorma_SP(".$id.")";

            $stm = $this->pdo->query($consulta);
            
			return $stm->fetchAll(PDO::FETCH_OBJ);
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}


}