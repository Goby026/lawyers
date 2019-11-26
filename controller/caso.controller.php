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
require_once  'model/notificacion.php';
require_once  'model/usuarioNotificacion.php';

class CasoController{
    
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
    private $notificacion;
    private $usunotificacion;
    
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
        $this->notificacion = new Notificacion();
        $this->usunotificacion = new UsuarioNotificacion();
    }
    
    public function Index(){

        $clientes = $this->cliente->Listar();
        $instancias = $this->instancia->Listar();
        $materias = $this->materia->Listar();
        $abogados = $this->abogado->Listar();

        require_once 'view/header.php';
        require_once 'view/caso/index.php';
        require_once 'view/footer.php';
    }
    
    public function Expedientes(){

        $tipoCliente = 3;
        $monto = 0;

        if (isset($_REQUEST['tipoCliente'])){

                $tipoCliente = $_REQUEST['tipoCliente'];

                $tipoCliente++;

                if ($tipoCliente > 3){
                    $tipoCliente = 1;
                }

                switch ($tipoCliente){

                    case 1://naturales
                        $casos = $this->model->Listar(1, $tipoCliente, $_SESSION['user_id']);
                        break;
                    case 2://juridicos
                        $casos = $this->model->Listar(1, $tipoCliente, $_SESSION['user_id']);
                        break;
                    case 3://todos
                        $casos = $this->model->Listar(1, $tipoCliente, $_SESSION['user_id']);
                        break;
                    default:
                        $casos = $this->model->Listar(1, $tipoCliente, $_SESSION['user_id']);
                }

        }else{

            $casos = $this->model->Listar(1, $tipoCliente, $_SESSION['user_id']);

        }

        if (isset($_REQUEST['t_CasoCod'])){

            $t_CasoCod = $_REQUEST['t_CasoCod'];

            $audiencias = $this->audiencia->Listar($t_CasoCod);
            $documentos = $this->documentos->Listar($t_CasoCod);
            $observaciones = $this->observacion->Listar($t_CasoCod);
            $pagos = $this->pagos->Listar($t_CasoCod);
            $estados = $this->estado->Listar();
            $juzgados = $this->juzgado->Listar();
            $detalle = $this->model->Obtener($t_CasoCod);

            $instancias = $this->instancia->Listar();

            $materias = $this->materia->Listar();
//            $materia = $this->materia->Obtener();

        }
        
        require_once "view/header.php";
        require_once "view/caso/expedientes.php";
        require_once "view/footer.php";
    }
    
    public function Guardar(){

        $data = [];

        $caso = new Caso();

        $fecha = date("Y/m/d");

        $caso->caso_titulo = $_REQUEST['caso_titulo'];
        $caso->cod_demandante = $_REQUEST['cod_demandante'];
        $caso->cod_demandado = $_REQUEST['cod_demandado'];
        $caso->t_CasoFech = $fecha;
        $caso->t_CasoNumExp = $_REQUEST['t_CasoNumExp'];
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

        $fecha = date('Y-m-d', time());

        //Registrar Notificacion
        $noti = new Notificacion();
        $noti->fecha = $fecha;
        $noti->estado = 1;
        $noti->titulo = "Nuevo caso";
        $noti->descripcion = "Nuevo caso";
        $noti->idtiponotificacion = 4;

        $noti_inserted = $this->notificacion->Registrar($noti);

        //Registrar usuarioNotificacion
        $usunoti = new UsuarioNotificacion();
        $usunoti->idnotificacion = $noti_inserted->id;
        $usunoti->idusuario = $_SESSION['user_id'];
        $usunoti->estado = 1;

        $this->usunotificacion->Registrar($usunoti);

        header('Location: ?c=caso&a=expedientes');

//        $caso->id > 0 ? $this->model->Actualizar($caso) : $this->model->Registrar($caso);

//        $data['caso'] = $caso;
//        $data['notificacion'] = $noti;
//        $data['usuarioNotificacion'] = $usunoti;

//        print_r($data);

    }

    public function CerrarCaso(){

        $caso = new Caso();

        $caso->t_CasoCod = $_REQUEST['t_casocod'];

        if ($this->model->CerrarCaso($caso)){
            header("Location: ?c=caso&a=expedientes&caseClosed=OK");
        }else{
            header("Location: ?c=caso&a=expedientes&caseClosed=NO");
        }

    }
    
    public function Eliminar(){
        $this->model->Eliminar($_REQUEST['id']);
        header('Location: index.php');
    }


//    =================================REST=================================

    public function getCasos(){
        $notis = $this->model->Listar(1, 3, $_SESSION['user_id']);
        echo json_encode($notis);
    }

    public function updateInstancia(){

        $caso = new Caso();
        $caso->t_InsCod = $_REQUEST['t_InsCod'];
        $caso->t_CasoCod = $_REQUEST['t_CasoCod'];

        if ($this->model->updateInstancia($caso)){
            echo json_encode($caso);
        }else{
            return false;
        }
    }

    public function updateMateria(){

        $caso = new Caso();
        $caso->t_MateCod = $_REQUEST['t_MateCod'];
        $caso->t_CasoCod = $_REQUEST['t_CasoCod'];

        if ($this->model->updateMateria($caso)){
            echo json_encode($caso);
        }else{
            return false;
        }
    }
}
