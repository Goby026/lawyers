<?php
class Norma
{
	private $pdo;
    
    public $idNormaPK;
    public $numNor;
    public $contNor;
    public $SecRegFK;
    


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
            
            $consulta = "CALL mgc_listarNorma_SP(".$id.")";

            $stm = $this->pdo->query($consulta);
            
			return $stm->fetchAll(PDO::FETCH_OBJ);
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}


}