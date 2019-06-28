<?php
require_once 'model/deportista.php';
require_once 'model/pais.php';

class DeportistaController{

    private $model;
    private $pais;

    public function __CONSTRUCT(){
        $this->model = new Deportista();
        $this->pais = new Pais();
    }

    public function Index(){

        session_start();

        $deportistas = [];
        $paises = $this->pais->Listar();

        require_once 'view/header.php';
        require_once 'view/deportistas/deportistas.php';
        require_once 'view/footer.php';

    }

    public function registrarDeportista(){

        session_start();

        require_once 'view/header.php';
        require_once 'view/Foto/crear.php';
        require_once 'view/footer.php';
    }

    public function Crud(){

        session_start();

        $foto = new Foto();

        if(isset($_REQUEST['id'])){
            $foto = $this->model->Obtener($_REQUEST['id']);
        }

        require_once 'view/header.php';
        require_once "view/foto/editar.php";
        require_once 'view/footer.php';
    }

    public function buscar(){

        session_start();

        if (isset( $_REQUEST['pais'] )){
            $pais = $_REQUEST['pais'];
        }else{
            $pais = '';
        }

        $deportistas = $this->model->Busqueda($pais);
        $paises = $this->pais->Listar();

        require_once 'view/header.php';
        require_once 'view/deportistas/deportistas.php';
        require_once 'view/footer.php';
    }

    public function Guardar(){
        $foto = new Foto();

        $foto->codigo = $_REQUEST['codigo'];
        $foto->nombre = $_REQUEST['nombre'];
        $foto->foto = null;

        if (isset($_FILES['foto'])){
            $archivoSubido = $this->subirImagen();
            $foto->foto = $archivoSubido;
        }

        $foto->codigo > 0
            ? $this->model->Actualizar($foto)
            : $this->model->Registrar($foto);

        header('Location: ?c=foto&a=index');
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
                    $fileDestination = "./assets/images/fotos/".$fileNameNew;

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
        header('Location: ?c=foto&a=index');
    }
}
