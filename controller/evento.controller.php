<?php
require_once 'model/evento.php';
require_once 'model/detalleeventos.php';
require_once 'model/resultado.php';
require_once "model/sede.php";
require_once "model/pais.php";
require_once "model/deporte.php";
require_once "model/notificacion.php";
require_once "model/usuarioNotificacion.php";

class EventoController{

    private $model;
    private $detalleEvento;
    private $resultado;
    private $sede;
    private $pais;
    private $deporte;
    private $notificacion;
    private $uNotificacion;

    public function __CONSTRUCT(){
        $this->model = new Evento();
        $this->sede = new Sede();
        $this->pais = new Pais();
        $this->deporte = new Deporte();
        $this->detalleEvento = new DetalleEvento();
        $this->resultado = new Resultado();
        $this->notificacion = new Notificacion();
        $this->uNotificacion = new UsuarioNotificacion();
    }

    public function Index(){

        session_start();

        $resultados = $this->resultado->Listar();

        require_once 'view/header.php';
        require_once "view/eventos/index.php";
        require_once 'view/footer.php';

    }

    //vista para administrar los resultados
    public function adminResultados(){

        session_start();

        $eventos = $this->model->Listar();

        require_once 'view/header.php';
        require_once "view/eventos/eventos.php";
        require_once 'view/footer.php';

    }

    //funcion para llamar a la vista de registro de eventos
    public function registrarEventos(){

        session_start();

        $sedes = $this->sede->Listar();
        $paises = $this->pais->Listar();
        $deportes = $this->deporte->Listar();

        require_once 'view/header.php';
        require_once 'view/eventos/crear.php';
        require_once 'view/footer.php';
    }

    public function Crud(){

        session_start();

        $evento = new Evento();
        $sedes = $this->sede->Listar();
        $paises = $this->pais->Listar();
        $deportes = $this->deporte->Listar();

        if(isset($_REQUEST['id'])){
            $evento = $this->model->Obtener($_REQUEST['id']);
        }

        require_once 'view/header.php';
        require_once "view/eventos/editar.php";
        require_once 'view/footer.php';
    }

    public function Guardar(){
        session_start();
    //se debe registrar tambien en la tabla resultado que sirve solo como presentacion

        $evento = new Evento();

        $evento->idEvento = $_REQUEST['codigo'];
        $evento->idSede = $_REQUEST['sede'];
        $evento->idHorarioEventos = 1;
        $evento->direccion = "";
        $evento->idDeportes = $_REQUEST['deporte'];
        $evento->fecha = $_REQUEST['fecha'];
        $evento->estado = 1;

        $lastId = $this->model->Registrar($evento);

        $newResultado = new Resultado();

//        $newResultado->idresutado = $_REQUEST['idResultado'];
        $newResultado->idEvento = $lastId->id;
        $newResultado->pais1 = $_REQUEST['pais1'];
        $newResultado->pais2 = $_REQUEST['pais2'];
        $newResultado->res1 = $_REQUEST['res1'];
        $newResultado->res2 = $_REQUEST['res2'];

        $this->resultado->Registrar($newResultado);

        //registrar notificacion

        $fecha = date('Y-m-d', time());

        $noti = new Notificacion();
        $noti->fecha = $fecha;
        $noti->idEvento = $lastId->id;
        $noti->estado = 1;
        $noti->titulo = "Fin de encuentro";
        $noti->descripcion = $_REQUEST['pais1']." vs ".$_REQUEST['pais2']." finalizó";
        $noti->idtiponotificacion = 2; //tipo: notificacion despues del evento

        $lastNoti = $this->notificacion->Registrar($noti);

        //registrar usuario-notificaciones

        $usuarioNoti = new UsuarioNotificacion();

        $usuarioNoti->idnotificacion = $lastNoti->id;
        $usuarioNoti->idusuario = $_SESSION["id_usuario"];
        $usuarioNoti->estado = 1;

        $this->uNotificacion->Registrar($usuarioNoti);

        header('Location: ?c=evento&a=adminResultados');

    }

    public function Modificar(){
        //se debe registrar tambien en la tabla resultado que sirve solo como presentacion

        $evento = new Evento();

        $evento->idEvento = $_REQUEST['idEvento'];
        $evento->idSede = $_REQUEST['sede'];
        $evento->idHorarioEventos = 1;
        $evento->direccion = "";
        $evento->idDeportes = $_REQUEST['deporte'];
        $evento->fecha = $_REQUEST['fecha'];
        $evento->estado = 1;

        $this->model->Actualizar($evento);

        $newResultado = new Resultado();

        $newResultado->idresutado = $_REQUEST['idresutado'];
        $newResultado->idEvento = $evento->idEvento;
        $newResultado->pais1 = $_REQUEST['pais1'];
        $newResultado->pais2 = $_REQUEST['pais2'];
        $newResultado->res1 = $_REQUEST['res1'];
        $newResultado->res2 = $_REQUEST['res2'];

        $this->resultado->Actualizar($newResultado);

        header('Location: ?c=evento&a=adminResultados');

    }

    public function Eliminar(){
        $this->model->Eliminar($_REQUEST['id']);
        header('Location: ?c=evento&a=index');
    }
}
