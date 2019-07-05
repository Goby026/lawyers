<?php
require_once 'model/asientos.php';
require_once 'model/categoriaasiento.php';
require_once 'model/sedes.php';

class AsientosController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Asientos();
        $this->modelc = new CategoriaAsiento();
        $this->models = new Sedes();
    }


    public function Index(){
        session_start();
        $Asientos = $this->getAsientos();
        $CategoriaRow = $this->getCategoria();
        foreach($CategoriaRow as $row):
            $Categoria = $row->NombreCategoriaA;
        endforeach;
        $UbicacionRow = $this->getUbicacion();
        foreach($UbicacionRow as $row):
            $Sede = $row->DireccionSede;
        endforeach;
        require_once 'view/header.php';
        require_once 'view/asientos/index.php';
        require_once 'view/footer.php';
    }

    public function getAsientos(){
        return $this->model->ListarCategoriaAsientos();
    }
    
    public function getCategoria(){
        return $this->modelc->NombreCategoria();
    }
    
    public function getUbicacion(){
        return $this->models->Ubicacion();
    }
    
}