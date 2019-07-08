<?php
require_once 'model/asientos.php';
require_once 'model/categorias.php';
require_once 'model/sedes.php';

class AsientosController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Asientos();
    }


    public function Index(){
        session_start();
        $_SESSION['IdCategoria'] = $_GET['categoria'];
    
        $Asientos = $this->getAsientos();
        $DetalleEvento = $this->getListarDetalleEvento();
        foreach($DetalleEvento as $row):
            $Categoria = $row->Categoria;
            $Sede = $row->DireccionSede;
            $Lugar = $row->Lugar;
            $NombDeporte = $row->NombDeporte;
            $Precio = $row->Precio;
        endforeach;
        $_SESSION['Precio'] = $Precio;
        require_once 'view/header.php';
        require_once 'view/asientos/index.php';
        require_once 'view/footer.php';
    }

    public function getAsientos(){
        return $this->model->ListarCategoriaAsientos();
    }
    
    public function getListarDetalleEvento(){
        return $this->model->ListarDetalleEvento();
    }
    
    
}