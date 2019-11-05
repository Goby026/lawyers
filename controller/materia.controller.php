<?php
require_once 'model/materia.php';

class MateriaController{
    
    private $model;
    
    public function __CONSTRUCT(){
        session_start();
        $this->model = new Materia();
    }
    
    public function Index(){
//        require_once 'view/header.php';
//        require_once 'view/alumno/alumno.php';
//        require_once 'view/footer.php';
    }
    
    public function Crud(){
        $materia = new Materia();

        if (isset($_REQUEST['id'])){
            $materia->t_MateCod = $_REQUEST['id'];
        }

        $materia->t_MateDescripcion = $_REQUEST['t_MateDescripcion'];

        $materia->t_MateCod > 0
            ? $this->model->Actualizar($materia)
            : $this->model->Registrar($materia);

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
