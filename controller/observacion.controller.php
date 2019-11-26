<?php
require_once 'model/observacion.php';
require_once 'model/notificacion.php';
require_once 'model/usuarioNotificacion.php';

class ObservacionController{
    
    private $model;
    private $notificacion;
    private $usunotificacion;
    
    public function __CONSTRUCT(){
        session_start();
        $this->model = new Observacion();
        $this->notificacion = new Notificacion();
        $this->usunotificacion = new UsuarioNotificacion();
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

        $fecha = date("Y/m/d");

        //Registrar Notificacion
        $noti = new Notificacion();
        $noti->fecha = $fecha;
        $noti->estado = 1;
        $noti->titulo = $_REQUEST['title'];
        $noti->descripcion = $_REQUEST['description'];
        $noti->idtiponotificacion = 2;

        $noti_inserted = $this->notificacion->Registrar($noti);

        //Registrar usuarioNotificacion
        $usunoti = new UsuarioNotificacion();
        $usunoti->idnotificacion = $noti_inserted->id;
        $usunoti->idusuario = $_SESSION['user_id'];
        $usunoti->estado = 1;

        $this->usunotificacion->Registrar($usunoti);

        header("Location: ?c=caso&a=expedientes&t_CasoCod=$t_casocod");
    }

    public function Actualizar(){

        $t_CasoCod = $_REQUEST['t_CasoCod'];
        $idt_observacion = $_REQUEST['idt_observacion'];

        $observacion = new Observacion();
        $observacion->idt_observacion = $idt_observacion;
        $observacion->title = $_REQUEST['title'];
        $observacion->description = $_REQUEST['description'];
        $observacion->t_CasoCod = $t_CasoCod;

        $this->model->Actualizar($observacion);

        header("Location: ?c=caso&a=expedientes&t_CasoCod=$t_CasoCod");
    }
    
    public function Eliminar(){
        $this->model->Eliminar($_REQUEST['id']);
        header('Location: index.php');
    }
}
