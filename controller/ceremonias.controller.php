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

        $ceremonia = $this->getCeremonia(2);
        $tipoCeremonia2 = $this->getTipoCeremonia(2);
        $tipoCeremonia3 = $this->getTipoCeremonia(3);

        require_once 'view/header.php';
        require_once 'view/Ceremonias/ceremonias.php';
        require_once 'view/footer.php';

    }

    public function getCeremonia($id){

        return $this->model->Obtener($id);

    }

    public function getTipoCeremonia($id){

        return $this->tipoCeremonias->Obtener($id);

    }

    public function getInauguracion(){

        session_start();

        $ceremonia = $this->getCeremonia(3);

        $tipoCerem = $this->tipoCeremonias->_Obtener(3);

        require_once 'view/header.php';
        require_once 'view/Ceremonias/inauguracion.php';
        require_once 'view/footer.php';
    }

    public function getClausura(){

        session_start();

        $ceremonia = $this->getCeremonia(4);

        $tipoCerem = $this->tipoCeremonias->_Obtener(4);

        require_once 'view/header.php';
        require_once 'view/Ceremonias/clausura.php';
        require_once 'view/footer.php';
    }
}
