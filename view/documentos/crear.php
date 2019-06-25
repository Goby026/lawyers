<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="jumbotron">
                    <h3>Nuevo Documento</h3>
                    <form action="?c=documentos&a=Guardar" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" name="nombre" id="nombre"
                                   value="" required>
                        </div>

                        <div class="form-group">
                            <label for="fileUpload">Documento</label>
                            <input type="file" class="form-control-file" id="fileUpload" name="documento">
                        </div>

                        <button type="submit" name="regFoto" class="btn btn-success btn-block">Registrar</button>

                    </form>
                </div>
            </div>

            <div class="col-md-6">
                <div class="text-center">
                    <br><br><br>
                    <img src="./assets/images/5a0543434931c.jpeg" class="img-fluid rounded" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
