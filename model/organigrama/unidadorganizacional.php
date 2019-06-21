<?php
class UnidadOrganizacional
{
	private $pdo;
    
    public $idUnidadOrganizacional;
    public $U_nombre;
    public $idSecUniOrgFK;
    


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

	public function Listar($codigoOficina)
	{
		try
		{
           
            
            $consulta = "CALL mgc_mostrarUnidadesOrganigrama_sp($codigoOficina)";

            $stm = $this->pdo->query($consulta);
            
			return $stm->fetchAll(PDO::FETCH_OBJ);
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}
}