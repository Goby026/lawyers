<?php

class Documentos
{
    private $pdo;

    public $id;
    public $nombre;
    public $documentos;


    public function __CONSTRUCT()
    {
        try {
            $this->pdo = Database::StartUp();
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    public function Listar()
    {
        try {

            $consulta = "CALL SP_GETDOCUMENTOS();";

            $stm = $this->pdo->query($consulta);

            return $stm->fetchAll(PDO::FETCH_OBJ);
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    public function Obtener($id)
    {
        try {
            $consulta = "CALL SP_GETDOCUMENTO(" . $id . ")";

            $stm = $this->pdo->query($consulta);

            //$stm->execute(array($id));

            return $stm->fetch(PDO::FETCH_OBJ);

        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    public function Eliminar($id)
    {
        try {
            $consulta = "CALL SP_DELDOCUMENTO(" . $id . ")";
            $stm = $this->pdo->query($consulta);

            if ($stm) {
                return 1;
            }

            //$stm->execute(array($id));
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    public function Actualizar(Documentos $data)
    {
        try {
            $consulta = "CALL SP_UPDATEDOCUMENTO(" . $data->id . ", '$data->nombre', '$data->documentos')";

            if ($this->pdo->query($consulta)) {
                return 1;
            }
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    public function Registrar(Documentos $data)
    {
        try {

            $consulta = "CALL SP_REGDOCUMENTOS('" . $data->nombre . "' ,'" . $data->documentos . "' )";

            $this->pdo->query($consulta);
            return 1;
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }
}
