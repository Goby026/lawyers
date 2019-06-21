<?php

require_once 'model/organigrama/oficinasorganigrama.php';
require_once 'model/organigrama/unidadorganizacional.php';


class OrganigramaController
{

    private $model;
    private $unidades;
 

    public function __CONSTRUCT()
    {
        $this->model = new OficinaOrganigrama();
        $this->unidades = new UnidadOrganizacional();
        
    }

    public function Index()
    {

        session_start();

        

        $oficinas= $this->getorganigrama();
  

        require_once 'view/header.php';
        require_once 'view/organigrama/organigrama.php';
        require_once 'view/footer.php';

    }

    public function getorganigrama(){
        return $this->model->Listar();
    }

}
