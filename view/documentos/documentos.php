<?php
if (isset($_SESSION['tipo_usuario'])) {
    if ($_SESSION['tipo_usuario'] === "2") {
        ?>

        <main>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-right mt-2">
                            <a href="?c=documentos&a=registrarDocumento" class="btn btn-outline-success"><i
                                        class="fas fa-plus"></i> Nuevo Documento</a>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table">
                            <thead class="thead-dark">
                            <tr>
                                <th scope="col">Nombre</th>
                                <th scope="col">Ruta</th>
                                <th scope="col">Doc.</th>
                                <th scope="col" colspan="2">Acciones</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($documentos as $row): ?>
                                <tr>
                                    <td><?php echo $row->nombre; ?></td>
                                    <td><?php echo $row->documentos; ?></td>
                                    <td>
                                        <button class="btn btn-outline-danger manual"
                                                onclick="ver('<?php echo $row->documentos ?>')"><i
                                                    class="far fa-file-pdf"></i></button>
                                    </td>
                                    <td>
                                        <a class="btn btn-warning btn-sm"
                                           href="?c=documentos&a=Crud&id=<?php echo $row->id; ?>">Editar</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-danger btn-sm"
                                           href="?c=documentos&a=Eliminar&id=<?php echo $row->id; ?>">Eliminar</a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </main>

        <?php
    } else {
        ?>

        <main>
            <div class="container-fluid">
                <div class="row" style="background-color: orange">
                    <div class="col-md-8 offset-2">
                        <br>
                        <h1>DOCUMENTOS</h1>
                        <p>Utilice esta sección del formulario para identificar los documentos de los eventos y organización de los juegos. Estos documentos pueden incluir dibujos, especificaciones, y otros archivos de documentos.</p>
                        <br>
                    </div>

                </div>
            </div>
            <div class="container">
                <div class="col-md-8 offset-2">
                    <br>
                    <br>
                    <table class="table">
                        <?php foreach ($documentos as $row): ?>
                            <tr>
                                <td>
                                    <?php echo $row->nombre; ?>
                                </td>
                                <td>
                                    <button class="btn btn-outline-danger manual"
                                            onclick="ver('<?php echo $row->documentos ?>')"><i class="far fa-file-pdf"></i>
                                    </button>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </table>
                    <br>
                </div>
            </div>
        </main>

        <?php
    }
} else {
    ?>

    <main>
        <div class="container-fluid">
            <div class="row" style="background-color: orange">
                <div class="col-md-8 offset-2">
                    <br>
                    <h1>DOCUMENTOS</h1>
                    <p>Utilice esta sección del formulario para identificar los documentos de los eventos y organización de los juegos. Estos documentos pueden incluir dibujos, especificaciones, y otros archivos de documentos.</p>
                    <br>
                </div>

            </div>
        </div>
        <div class="container">
            <div class="col-md-8 offset-2">
                <br>
                <br>
                <table class="table">
                    <?php foreach ($documentos as $row): ?>
                    <tr>
                        <td>
                            <?php echo $row->nombre; ?>
                        </td>
                        <td>
                            <button class="btn btn-outline-danger manual"
                                    onclick="ver('<?php echo $row->documentos ?>')"><i class="far fa-file-pdf"></i>
                            </button>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </table>
                <br>
            </div>
        </div>
    </main>

    <?php
}
?>


<script>
    function ver(archivo) {
        window.open(archivo, '_blank');
        //console.log(archivo);
    }
</script>
