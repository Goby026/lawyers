<main>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="jumbotron jumbotron-fluid">
                            <div class="container">
                                <h1 class="display-4">MARCO LEGAL</h1>
                                <p class="lead">Juegos panamericanos Lima 2019</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php
    //var_dump($decretos);
    ?>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h4 class="text-danger">NORMAS DE CREACIÓN</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">

                <?php
                foreach($decretos as $row):
                    ?>
                    <div class="card">
                        <div class="card-header">
                            <?php echo $row->titulo ?>
                        </div>
                        <div class="card-body">
                            <p class="card-text"><?php echo $row->descripcion ?></p>
                            <button class="btn btn-primary manual" onclick="ver('<?php echo $row->rutaPdf ?>')"><i class="far fa-file-pdf"></i></button>
                        </div>
                    </div>
                <?php endforeach; ?>


            </div>
        </div>
    </div>

</main>

<script>
    function ver(archivo){
        window.open(archivo, '_blank');
        //console.log(archivo);
    }
</script>

