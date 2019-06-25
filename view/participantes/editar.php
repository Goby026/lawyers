<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="jumbotron">
                    <h3>Editar Participante</h3>
                    <form action="?c=participantes&a=Guardar" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" name="nombre" id="nombre"
                                   value="<?php echo $participante->Nombre;?>" required>
                        </div>

                        <div class="form-group">
                            <label for="apellidop">Apellido Paterno</label>
                            <input type="text" class="form-control" name="apellidop" id="apellidop" value="<?php echo $participante->ApellidoP;?>" required>
                        </div>

                        <div class="form-group">
                            <label for="apellidom">Apellido Materno</label>
                            <input type="text" class="form-control" name="apellidom" id="apellidom" value="<?php echo $participante->ApellidoM;?>" required>
                        </div>

                        <div class="form-group">
                            <label for="pais">País</label>
                            <input type="text" class="form-control" name="pais" id="pais" value="<?php echo $participante->Pais;?>" required>
                        </div>

                        <div class="form-group" id="imagen_bd">
                            <!--                            <label for="fileUpload">Imagen</label>-->
                            <img src="<?php echo $participante->Foto;?>" class="img-fluid rounded" alt="">
                        </div>

                        <div class="form-group">
                            <div id="image-holder"></div>
                        </div>

                        <div class="form-group">
                            <label for="fileUpload">Imagen</label>
                            <input type="file" class="form-control-file" id="fileUpload" name="foto">
                        </div>

                        <input type="hidden" value="<?php echo $participante->id ?>" name="codigo">

                        <button type="submit" name="regParticipante" class="btn btn-success btn-block">Actualizar</button>

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


<script>
    var myReader = new FileReader();

    //*
    $("#fileUpload").on('change', function () {

        $("#imagen_bd").remove();

        if (typeof (FileReader) != "undefined") {

            var image_holder = $("#image-holder");
            image_holder.empty();

            var reader = new FileReader();
            reader.onload = function (e) {
                $("<img />", {
                    "src": e.target.result,
                    "class": "img-fluid rounded"
                }).appendTo(image_holder);

            }
            image_holder.show();
            reader.readAsDataURL($(this)[0].files[0]);
        } else {
            alert("This browser does not support FileReader.");
        }
    });
    //*
</script>
