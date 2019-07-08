<?php
if (isset($_SESSION['tipo_usuario'])) {
    if ($_SESSION['tipo_usuario'] === "2") {
        ?>
        <main>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-right mt-2">
                            <a href="?c=foto&a=registrarFotos" class="btn btn-outline-success"><i
                                        class="fas fa-plus"></i> Nueva Foto</a>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <?php foreach ($fotos as $row): ?>
                        <div class="col-md-4">
                            <div class="card" style="width: 18rem;">
                                <img src="<?php echo $row->foto; ?>" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title"><?php echo $row->nombre; ?></h5>

                                    <div class="dropdown">
                                        <button class="btn btn-outline-info btn-block dropdown-toggle" type="button"
                                                id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false">
                                            Acciones
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item"
                                               href="?c=foto&a=Crud&id=<?php echo $row->codigo; ?>">Editar</a>
                                            <a class="dropdown-item"
                                               href="?c=foto&a=Eliminar&id=<?php echo $row->codigo; ?>">Eliminar</a>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>

        </main>
        <?php
    }else{
        ?>
        <main>
                <div class="container gallery-container">

                    <div class="tz-gallery">

                        <div class="row mb-3">
                            <?php foreach ($fotos as $row): ?>
                                <div class="col-md-4 mt-2">
                                    <div class="card">
                                        <a class="lightbox" href="<?php echo $row->foto; ?>">
                                            <img src="<?php echo $row->foto; ?>" alt="Park" class="card-img-top">
                                        </a>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        </div>

                    </div>

                </div>
        </main>

        <script>
            baguetteBox.run('.tz-gallery');
        </script>
        <?php
    }
} else {
    ?>
    <main>

            <div class="container gallery-container">

                <div class="tz-gallery">

                    <div class="row mb-3">
                        <?php foreach ($fotos as $row): ?>
                            <div class="col-md-4 mt-2">
                                <div class="card">
                                    <a class="lightbox" href="<?php echo $row->foto; ?>">
                                        <img src="<?php echo $row->foto; ?>" alt="Park" class="card-img-top">
                                    </a>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>

                </div>

            </div>

    </main>

    <script>
        baguetteBox.run('.tz-gallery');
    </script>
    <?php
}
?>
