<?php
require_once 'model/cliente.php';

class ClienteController{

    private $model;

    public function __CONSTRUCT(){
        session_start();
        $this->model = new Cliente();
    }

    public function Index(){

        $naturales = $this->model->ListarTipo(1);
        $juridicos = $this->model->ListarTipo(2);

        require_once 'view/header.php';
        require_once 'view/clientes/clientes.php';
        require_once 'view/footer.php';
    }

    public function Crud(){

        if ($_GET['tipoCliente'] == 1){
            require_once 'view/header.php';
            require_once 'view/clientes/create.php';
            require_once 'view/footer.php';
        }else{
            require_once 'view/header.php';
            require_once 'view/clientes/createJuridico.php';
            require_once 'view/footer.php';
        }

    }

    public function Guardar(){

        $cliente = new Cliente();

        if ($_GET['tipoCliente'] == 1){
            //natural
            $cliente->idt_tipoCliente = 1;
            $cliente->nombres = $_POST['nombres'];
            $cliente->apellidos = $_POST['apellidos'];
            $cliente->dni = $_POST['dni'];
            $cliente->ruc = '';
            $cliente->razon_social = '';
            $cliente->direccion = $_POST['direccion'];
            $cliente->telefono = $_POST['telefono'];
            $cliente->telefono2 = $_POST['telefono2'];
            $cliente->fec_nac = $_POST['fec_nac'];
            $cliente->dpto = $_POST['dpto'];
            $cliente->prov = $_POST['prov'];
            $cliente->dist = $_POST['dist'];
        }else{
            //juridico
            $cliente->idt_tipoCliente = 2;
            $cliente->nombres = '';
            $cliente->apellidos = '';
            $cliente->dni = '';
            $cliente->ruc = $_POST['ruc'];
            $cliente->razon_social = $_POST['razon_social'];
            $cliente->direccion = $_POST['direccion'];
            $cliente->telefono = $_POST['telefono'];
            $cliente->telefono2 = $_POST['telefono2'];
            $cliente->fec_nac = '';
            $cliente->dpto = $_POST['dpto'];
            $cliente->prov = $_POST['prov'];
            $cliente->dist = $_POST['dist'];
        }

        $this->model->Registrar($cliente);

        header('Location: ?c=cliente&a=index');
    }

    public function Eliminar(){
        $this->model->Eliminar($_REQUEST['id']);
        header('Location: index.php');
    }
}
