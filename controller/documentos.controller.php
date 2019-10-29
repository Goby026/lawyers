<?php
require_once 'model/documentos.php';

class DocumentosController{

    private $model;

    public function __CONSTRUCT(){
        session_start();
        $this->model = new Documentos();
    }

    public function Index(){

        session_start();

        $documentos = $this->model->Listar();
        // $c=0;

        require_once 'view/header.php';
        require_once 'view/documentos/documentos.php';
        require_once 'view/footer.php';

    }

    public function Crud(){

        session_start();

        $documento = new Documentos();

        if(isset($_REQUEST['id'])){
            $documento = $this->model->Obtener($_REQUEST['id']);
        }

        require_once 'view/header.php';
        require_once "view/documentos/editar.php";
        require_once 'view/footer.php';
    }

    public function Guardar(){
        $id = $_REQUEST['t_casocod'];

        $documento = new Documentos();
        $documento->t_DocuDescripcion = $_REQUEST['t_docudescripcion'];

        if (isset($_FILES['documento'])){
            $archivoSubido = $this->subirDocumento();
            $documento->t_url = $archivoSubido;
        }

        $documento->t_CasoCod = $id;

        $documento->Registrar($documento);

        header("Location: ?c=caso&a=expedientes&t_CasoCod=$id");

//        print_r($_REQUEST);
    }

    public function subirDocumento(){
        $fileDestination = "--";

        $fileName = $_FILES['documento']['name'];
        $fileTmpName = $_FILES['documento']['tmp_name'];
        $fileSize = $_FILES['documento']['size'];
        $fileError = $_FILES['documento']['error'];
        $fileType = $_FILES['documento']['type'];

        $fileExt = explode(".",$fileName);
        $fileActualExt = strtolower( end($fileExt)); // end() solo toma la ultima posicion del array $fileExt

        $allowed = array("jpg", "jpeg", "png", "pdf", "txt", "docx", ".xlsx");

        if (in_array($fileActualExt, $allowed)){
            if ($fileError === 0){

                if ($fileSize < 5000000){ //menor a 5mb
                    $fileNameNew = uniqid("", true).".".$fileActualExt;
                    $fileDestination = "./assets/documentos/".$fileNameNew;

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
        header('Location: ?c=documentos&a=index');
    }
}
