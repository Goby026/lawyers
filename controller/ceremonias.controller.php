<?php
require_once 'model/ceremonia.php';
require_once 'model/tipoceremonia.php';

class CeremoniasController{

    private $model;
    private $tipoCeremonias;

    public function __CONSTRUCT(){
        $this->model = new Ceremonia();
        $this->tipoCeremonias = new TipoCeremonia();
    }

    public function Index(){

        session_start();

        $ceremonia = $this->getCeremonias();
        $tipoCeremonia2 = $this->getTipoCeremonia(2);
        $tipoCeremonia3 = $this->getTipoCeremonia(3);

        require_once 'view/header.php';
        require_once 'view/Ceremonias/ceremonias.php';
        require_once 'view/footer.php';

    }

    public function getCeremonias(){

        return $this->model->Listar();

    }

    public function getTipoCeremonia($id){

        return $this->tipoCeremonias->Obtener($id);

    }
}
