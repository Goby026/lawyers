<div class="container mt-5">
    <h2 class="text-center mt-4 mb-4">Categorias de entradas</h2>
    <hr>
    <div class="row">
        <div class="col-md-12 col-lg-8 text-center mt-5">
            <img src="./assets/images/categorias.jpg" alt="" width="60%">
        </div>
        <div class="col-md-12 col-lg-4 mt-5">
            <?php foreach($catasi as $row): ?>
            <div class="row m-2 text-center">
                    <div class="col-6">
                        <label for=""><?php echo $row->NombreCategoriaA ?></label>
                    </div>
                    <div class="col-6">
                        <a class="btn" href="?c=asientos&a=index&categ=<?php echo $row->idCategoriaAsiento; ?>" style="background: #<?php echo $row->Color; ?>">Ver</a>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
        
    </div>
</div>