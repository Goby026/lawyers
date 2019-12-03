<?php

require_once 'model/instancia.php';
require_once 'model/materia.php';
require_once 'model/modelo.php';

require './assets/vendor/fpdf181/fpdf.php';

class MantenimientoController
{

    private $instancia;
    private $materia;
    private $modelo;

    public function __CONSTRUCT()
    {
        session_start();
        $this->instancia = new Instancia();
        $this->materia = new Materia();
        $this->modelo = new Modelo();
    }

    public function Index()
    {

        $instancias = $this->instancia->Listar();
        $materias = $this->materia->Listar();
        $modelos = $this->modelo->Listar();

        require_once 'view/header.php';
        require_once 'view/mantenimiento/index.php';
        require_once 'view/footer.php';

    }

    public function makepdf(){
        $idmodelo = $_REQUEST['idmodelo'];

        $body = $this->modelo->Obtener($idmodelo);

        $pdf = new FPDF();
        $pdf->AddPage();
        $pdf->SetFont('Arial','B',16);
        $pdf->Cell(40,10,$body->body);
        $pdf->Output();

    }

}
