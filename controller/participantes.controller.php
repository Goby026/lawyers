<?php
require_once 'model/participantes.php';

class ParticipantesController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Participantes();
    }

    public function Index(){

        session_start();

        $participantes = $this->model->Listar();
        // $c=0;

        require_once 'view/header.php';
        require_once 'view/Participantes/participantes.php';
        require_once 'view/footer.php';

    }


    public function registrarParticipantes(){

        session_start();

        require_once 'view/header.php';
        require_once "view/participantes/crear.php";
        require_once 'view/footer.php';
    }

    public function Crud(){

        session_start();

        $participante = new Participantes();

        if(isset($_REQUEST['id'])){
            $participante = $this->model->Obtener($_REQUEST['id']);
        }

        require_once 'view/header.php';
        require_once "view/participantes/editar.php";
        require_once 'view/footer.php';
    }

    public function Guardar(){
        $participante = new Participantes();

        $participante->id = $_REQUEST['codigo'];

        $participante->nombre = $_REQUEST['nombre'];
        $participante->apellidop = $_REQUEST['apellidop'];
        $participante->apellidom = $_REQUEST['apellidom'];
        $participante->pais = $_REQUEST['pais'];
        $participante->foto = null;

        if (isset($_FILES['foto'])){
            $archivoSubido = $this->subirImagen();
            $participante->foto = $archivoSubido;
        }

        $participante->id > 0
            ? $this->model->Actualizar($participante)
            : $this->model->Registrar($participante);

        header('Location: ?c=participantes&a=index');
    }

    public function subirImagen(){
        $fileDestination = "--";

        $fileName = $_FILES['foto']['name'];
        $fileTmpName = $_FILES['foto']['tmp_name'];
        $fileSize = $_FILES['foto']['size'];
        $fileError = $_FILES['foto']['error'];
        $fileType = $_FILES['foto']['type'];

        $fileExt = explode(".",$fileName);
        $fileActualExt = strtolower( end($fileExt)); // end() solo toma la ultima posicion del array $fileExt

        $allowed = array("jpg", "jpeg", "png");

        if (in_array($fileActualExt, $allowed)){
            if ($fileError === 0){

                if ($fileSize < 500000){ //menor a 5mb
                    $fileNameNew = uniqid("", true).".".$fileActualExt;
                    $fileDestination = "./assets/images/participantes/".$fileNameNew;

                    move_uploaded_file($fileTmpName ,$fileDestination);

                }else{
                    echo "El archivo es demasiado grande.";
                }

            }else{
                echo "Hubo un problema subiendo el archivo.";
            }

        }else{
            echo "Tipo de imagen incorrecto, por favor seleccione solo archivos .jpg - .jpeg - .png";
        }

        return $fileDestination;
    }

    public function Eliminar(){
        $this->model->Eliminar($_REQUEST['id']);
        header('Location: ?c=participantes&a=index');
    }
}
