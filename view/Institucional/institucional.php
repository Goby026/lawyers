<main>
    <div class="container">
        <div class="row">
            <?php foreach ($institucional as $r): ?>
                <div class="col-md-6">
                    <div class="card mb-3">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <img src="<?php echo $r->imagenInstitucional; ?>" class="card-img" alt="...">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title"><?php echo $r->NombreInstitucional; ?></h5>
                                    <p class="card-text"><?php echo $r->descripInstitucional; ?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</main>
