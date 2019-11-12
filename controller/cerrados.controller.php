<?php
require_once 'model/caso.php';
require_once 'model/cliente.php';
require_once  'model/instancia.php';
require_once  'model/materia.php';
require_once  'model/abogado.php';
require_once  'model/audiencia.php';
require_once  'model/estado.php';
require_once  'model/juzgado.php';
require_once  'model/documentos.php';
require_once  'model/observacion.php';
require_once  'model/pagos.php';

class CerradosController{
    private $model;
        private $cliente;
    private $instancia;
    private $materia;
    private $abogado;
    private $audiencia;
    private $estado;
    private $juzgado;
    private $documentos;
    private $observacion;
    private $pagos;
    
    public function __CONSTRUCT(){
        session_start();
        $this->model = new Caso();
        $this->cliente = new Cliente();
        $this->instancia = new Instancia();
        $this->materia = new Materia();
        $this->abogado = new Abogado();
        $this->audiencia = new Audiencia();
        $this->estado = new Estado();
        $this->juzgado = new Juzgado();
        $this->documentos = new Documentos();
        $this->observacion = new Observacion();
        $this->pagos = new Pagos();
    }
    
    public function Index(){

        $casos = $this->model->Listar(2, 3);

        if (isset($_REQUEST['t_CasoCod'])){

            $t_CasoCod = $_REQUEST['t_CasoCod'];

            $audiencias = $this->audiencia->Listar($t_CasoCod);
            $documentos = $this->documentos->Listar($t_CasoCod);
            $observaciones = $this->observacion->Listar($t_CasoCod);
            $pagos = $this->pagos->Listar($t_CasoCod);
            $estados = $this->estado->Listar();
            $juzgados = $this->juzgado->Listar();

            $detalle = $this->model->Obtener($t_CasoCod);
        }

        require_once 'view/header.php';
        require_once 'view/caso/cerrados.php';
        require_once 'view/footer.php';
    }
}
