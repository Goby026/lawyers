<?php
require_once 'model/audiencia.php';
require_once 'model/notificacion.php';
require_once 'model/usuarioNotificacion.php';

class AudienciaController{
    
    private $model;
    private $notificacion;
    private $usunotificacion;
    
    public function __CONSTRUCT(){
        session_start();
        $this->model = new Audiencia();
        $this->notificacion = new Notificacion();
        $this->usunotificacion = new UsuarioNotificacion();
    }
    
    public function Index(){

//        $audiencias = $this->model->Listar();

        require_once 'view/header.php';
        require_once 'view/caso/expedientes.php';
        require_once 'view/footer.php';
    }
    
    public function Guardar(){
        $audiencia = new Audiencia();

        $t_casocod = $_REQUEST['t_casocod'];

//        $fecha = date("Y/m/d");

        $audiencia->asunto = $_REQUEST['asunto'];
        $audiencia->t_AudiDireccion = $_REQUEST['t_AudiDireccion'];
        $audiencia->t_AudiHora = $_REQUEST['t_AudiHora'];
        $audiencia->t_AudiFecha = $_REQUEST['t_AudiFecha'];
        $audiencia->t_AudiObservaciones = $_REQUEST['t_AudiObservaciones'];
        $audiencia->t_casocod = $t_casocod;
        $audiencia->t_estado = $_REQUEST['t_estado'];
        $audiencia->idt_juzgado = $_REQUEST['idt_juzgado'];

        $this->model->Registrar($audiencia);

        $fecha = date("Y/m/d");

        //Registrar Notificacion
        $noti = new Notificacion();
        $noti->fecha = $fecha;
        $noti->estado = 1;
        $noti->titulo = $_REQUEST['asunto'];
        $noti->descripcion = "Nueva audiencia";
        $noti->idtiponotificacion = 1;

        $noti_inserted = $this->notificacion->Registrar($noti);

        //Registrar usuarioNotificacion
        $usunoti = new UsuarioNotificacion();
        $usunoti->idnotificacion = $noti_inserted->id;
        $usunoti->idusuario = $_SESSION['user_id'];
        $usunoti->estado = 1;

        $this->usunotificacion->Registrar($usunoti);

        header("Location: ?c=caso&a=expedientes&t_CasoCod=$t_casocod");

//        print_r($audiencia);

    }
    
    public function Eliminar(){
        $this->model->Eliminar($_REQUEST['id']);
        header('Location: index.php');
    }
}
