<?php
require_once 'model/audiencia.php';
//require_once 'model/cliente.php';
//require_once  'model/instancia.php';
//require_once  'model/materia.php';
//require_once  'model/abogado.php';

class AudienciaController{
    
    private $model;
//    private $cliente;
//    private $instancia;
//    private $materia;
//    private $abogado;
    
    public function __CONSTRUCT(){
        session_start();
        $this->model = new Audiencia();
//        $this->cliente = new Cliente();
//        $this->instancia = new Instancia();
//        $this->materia = new Materia();
//        $this->abogado = new Abogado();
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

        header("Location: ?c=caso&a=expedientes&t_CasoCod=$t_casocod");

//        print_r($audiencia);

    }
    
    public function Eliminar(){
        $this->model->Eliminar($_REQUEST['id']);
        header('Location: index.php');
    }
}
