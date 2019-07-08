<?php
class UsuarioNotificacion
{
	private $pdo;
    
    public $idusuario_notificaciones;
    public $idnotificacion;
    public $idusuario;
    public $estado;

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

	public function Listar($idusuario)
	{
		try
		{
			$result = array();

            $stm = $this->pdo->prepare("CALL SP_GETNOTIFICACIONUSUARIO('".$idusuario."')");
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
			          ->prepare("CALL SP_GETNOTIFICACION(?)");
			          

			$stm->execute(array($id));
			return $stm->fetch(PDO::FETCH_OBJ);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

//    public function ObtenerPorUsuario($idUsuario)
//    {
//        try
//        {
//            $stm = $this->pdo
//                ->prepare("SELECT * FROM alumnos WHERE id = ?");
//
//
//            $stm->execute(array($idUsuario));
//            return $stm->fetch(PDO::FETCH_OBJ);
//        } catch (Exception $e)
//        {
//            die($e->getMessage());
//        }
//    }

//	public function Eliminar($id)
//	{
//		try
//		{
//			$stm = $this->pdo
//			            ->prepare("DELETE FROM alumnos WHERE id = ?");
//
//			$stm->execute(array($id));
//		} catch (Exception $e)
//		{
//			die($e->getMessage());
//		}
//	}

	public function Actualizar(UsuarioNotificacion $data)
	{
		try 
		{
			$sql = "CALL SP_UPDATEUSUARIONOTIFICACION(?,?,?,?)";

			$this->pdo->prepare($sql)->execute(
				    array(
				        $data->idusuario_notificaciones,
                        $data->idnotificacion,
                        $data->idusuario,
                        $data->estado
                    )
				);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

	public function Registrar(UsuarioNotificacion $data)
	{
		try 
		{
		$sql = "CALL SP_REGUSUARIONOTIFICACION(?,?,?)";

		$this->pdo->prepare($sql)
		     ->execute(
				array(
                    $data->idnotificacion,
                    $data->idusuario,
                    $data->estado
                )
			);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}
}
