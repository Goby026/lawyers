<?php
require_once 'model/caso.php';
require_once 'model/cliente.php';
require_once  'model/instancia.php';
require_once  'model/materia.php';
require_once  'model/abogado.php';

class CasoController{
    
    private $model;
    private $cliente;
    private $instancia;
    private $materia;
    private $abogado;
    
    public function __CONSTRUCT(){
        $this->model = new Caso();
        $this->cliente = new Cliente();
        $this->instancia = new Instancia();
        $this->materia = new Materia();
        $this->abogado = new Abogado();
    }
    
    public function Index(){

        session_start();

        $clientes = $this->cliente->Listar();
        $instancias = $this->instancia->Listar();
        $materias = $this->materia->Listar();
        $abogados = $this->abogado->Listar();

        require_once 'view/header.php';
        require_once 'view/caso/index.php';
        require_once 'view/footer.php';
    }
    
    public function Expedientes(){
        session_start();
        $casos = $this->model->Listar();

        if (isset($_REQUEST['t_CasoCod'])){
            $t_CasoCod = $_REQUEST['t_CasoCod'];
            $detalle = $this->model->Obtener($t_CasoCod);
        }
        
        require_once 'view/header.php';
        require_once 'view/caso/expedientes.php';
        require_once 'view/footer.php';
    }
    
    public function Guardar(){
        session_start();
        $caso = new Caso();

        $fecha = date("Y/m/d");

        $caso->caso_titulo = $_REQUEST['caso_titulo'];
        $caso->cod_demandante = $_REQUEST['cod_demandante'];
        $caso->cod_demandado = $_REQUEST['cod_demandado'];
        $caso->t_CasoFech = $fecha;
        $caso->t_CasoNumExp = 'S/N'; //--
        $caso->t_AboCod = $_REQUEST['t_AboCod'];
        $caso->t_CasoJuzgado = $_REQUEST['t_CasoJuzgado'];
        $caso->t_CasoObservaciones = "";
        $caso->t_pagoTotal = 0.0; //--
        $caso->idt_usuario = $_SESSION['user_id'];
        $caso->idt_cliente = $_REQUEST['idt_cliente'];
        $caso->t_MateCod = $_REQUEST['t_MateCod'];
        $caso->t_InsCod = $_REQUEST['t_InsCod'];
        $caso->idt_EstadoCaso = 1;

        $this->model->Registrar($caso);

        header('Location: ?c=caso&a=expediente');

//        $caso->id > 0 ? $this->model->Actualizar($caso) : $this->model->Registrar($caso);
//

    }
    
    public function Eliminar(){
        $this->model->Eliminar($_REQUEST['id']);
        header('Location: index.php');
    }
}
