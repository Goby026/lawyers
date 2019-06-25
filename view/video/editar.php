<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="jumbotron">
                    <h3>Editar foto</h3>
                    <form action="?c=video&a=Guardar" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" name="nombre" id="nombre"
                                   value="<?php echo $video->nombre ?>" required>
                        </div>


                        <div class="form-group">
                            <label for="video">Url-Video</label>
                            <input type="text" class="form-control" name="video" id="video"
                                   value="https://www.youtube.com/watch?v=<?php echo $video->video ?>" required>
                        </div>

                        <input type="hidden" value="<?php echo $video->codigo ?>" name="codigo">
                        <button type="submit" class="btn btn-warning btn-block">Actualizar</button>

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
