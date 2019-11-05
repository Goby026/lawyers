<?php
require_once 'model/modelo.php';

class ModeloController{
    
    private $model;
    
    public function __CONSTRUCT(){
        session_start();
        $this->model = new Modelo();
    }
    
    public function Index(){
//        require_once 'view/header.php';
//        require_once 'view/alumno/alumno.php';
//        require_once 'view/footer.php';
    }

    //funcion para llamar a la VISTA de edicion de modelo
    public function editar(){

        $modelo = $this->model->Obtener($_REQUEST['idmodelo']);

        require_once 'view/header.php';
        require_once 'view/mantenimiento/modelo.php';
        require_once 'view/footer.php';
    }
    
    public function Crud(){
        $modelo = new Modelo();

        if (isset($_REQUEST['idmodelo'])){
            $modelo->idmodelo = $_REQUEST['idmodelo'];
        }

        $modelo->t_url = "";
        $modelo->t_title = $_REQUEST['t_title'];

        if (isset($_REQUEST['body'])){
            $modelo->body = $_REQUEST['body'];
        }else{
            $modelo->body = "";
        }

        $modelo->idt_usuario = $_REQUEST['idt_usuario'];

        $modelo->idmodelo > 0
            ? $this->model->Actualizar($modelo)
            : $this->model->Registrar($modelo);

        header('Location: ?c=mantenimiento&a=index');
    }
    
    public function Eliminar(){
        if ($this->model->Eliminar($_REQUEST['id'])){
            header('Location: ?c=mantenimiento&a=index&delete=OK');
        }else{
            header('Location: ?c=mantenimiento&a=index&delete=NO');
        }

    }
}
