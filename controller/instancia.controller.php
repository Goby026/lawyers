<?php
require_once 'model/instancia.php';

class InstanciaController{
    
    private $model;
    
    public function __CONSTRUCT(){
        session_start();
        $this->model = new Instancia();
    }
    
    public function Index(){
//        require_once 'view/header.php';
//        require_once 'view/alumno/alumno.php';
//        require_once 'view/footer.php';
    }
    
    public function Crud(){
        $instancia = new Instancia();

        if (isset($_REQUEST['id'])){
            $instancia->t_InsCod = $_REQUEST['id'];
        }

        $instancia->t_InsNombre = $_REQUEST['t_InsNombre'];
        $instancia->t_InsDescripcion = $_REQUEST['t_InsDescripcion'];

        $instancia->t_InsCod > 0
            ? $this->model->Actualizar($instancia)
            : $this->model->Registrar($instancia);

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
