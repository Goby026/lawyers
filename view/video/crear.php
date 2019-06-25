<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="jumbotron">
                    <h3>Nuevo Video</h3>
                    <form action="?c=video&a=Guardar" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" name="nombre" id="nombre"
                                   value="" required>
                        </div>

                        <div class="form-group">
                            <label for="fileUpload">Url-Video</label>
                            <input type="text" class="form-control" name="video" required>
                        </div>

                        <button type="submit" name="regVideo" class="btn btn-success btn-block">Registrar</button>

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
