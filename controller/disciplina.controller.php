<?php
require_once 'model/disciplina.php';

class DisciplinaController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Disciplina();
    }

    public function Index(){

        session_start();

        $listaEmpleados = $this->getDisciplinas();
        // $c=0;

        require_once 'view/header.php';
        require_once 'view/Disciplina/disciplina.php';
        require_once 'view/footer.php';

    }

    public function getDisciplinas(){
        return $this->model->Listar();
    }

    public function verDatos(){
        $disciplina = $_POST['txtdisciplina'];
        $sede = $_POST['txtsede'];
        $direccion = $_POST['txtdireccion'];

        $newDisciplina = new Disciplina();

        $newDisciplina->disciplina = $disciplina;
        $newDisciplina->sede = $sede;
        $newDisciplina->direccion = $direccion;
        

        $resp = $this->model->Registrar($newDisciplina);

        echo $resp;

    }
}
