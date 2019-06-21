<?php
class Participantes
{
	private $pdo;
    
    public $id;
    public $nombre;
    public $apellidop;
    public $apellidom;
    public $pais;
    public $foto;
    

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

            $consulta = "CALL SP_GETPARTICIPANTES();";

			$stm = $this->pdo->query($consulta);

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
			          ->prepare("SELECT * FROM alumnos WHERE id = ?");
			          

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
			            ->prepare("DELETE FROM alumnos WHERE id = ?");			          

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
			$sql = "UPDATE alumnos SET 
						Nombre          = ?, 
						Apellido        = ?,
                        Correo        = ?,
						Sexo            = ?, 
						FechaNacimiento = ?
				    WHERE id = ?";

			$this->pdo->prepare($sql)
			     ->execute(
				    array(
                        $data->Nombre, 
                        $data->Correo,
                        $data->Apellido,
                        $data->Sexo,
                        $data->FechaNacimiento,
                        $data->id
					)
				);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}

	public function Registrar(Participantes $data)
	{
		try 
		{

			$consulta = "CALL SP_REGPARTICIPANTES('".$data->nombre."' ,'".$data->apellidop."','".$data->apellidom."','".$data->pais."','".$data->foto."' )";

			$this->pdo->query($consulta);

		// $this->pdo->prepare($sql)
		//      ->execute(
		// 		array(
        //             $data->Nombre,
        //             $data->Correo, 
        //             $data->Apellido, 
        //             $data->Sexo,
        //             $data->FechaNacimiento,
        //             date('Y-m-d')
        //         )
		// 	);

			return 1;
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}
	}
}