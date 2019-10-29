<?php
require_once 'model/observacion.php';

class ObservacionController{
    
    private $model;
    
    public function __CONSTRUCT(){
        session_start();
        $this->model = new Observacion();
    }
    
    public function Index(){
        require_once 'view/header.php';
        require_once 'view/alumno/alumno.php';
        require_once 'view/footer.php';
    }
    
    public function Crud(){
        $observacion = new Observacion();
        
        if(isset($_REQUEST['id'])){
            $observacion = $this->model->Obtener($_REQUEST['id']);
        }
        
        require_once 'view/header.php';
        require_once 'view/index/index.php';
        require_once 'view/footer.php';
    }
    
    public function Guardar(){

        $t_casocod = $_REQUEST['t_casocod'];

        $observacion = new Observacion();

        $observacion->title = $_REQUEST['title'];
        $observacion->description = $_REQUEST['description'];
        $observacion->t_CasoCod = $_REQUEST['t_casocod'];

        $this->model->Registrar($observacion);

        header("Location: ?c=caso&a=expedientes&t_CasoCod=$t_casocod");
    }
    
    public function Eliminar(){
        $this->model->Eliminar($_REQUEST['id']);
        header('Location: index.php');
    }
}
