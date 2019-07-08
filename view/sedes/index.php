<div class="container mt-5">
    <h2 class="text-center mt-4 mb-4">Sedes</h2>
    <hr>
    <div class="row">
        <div class="col-md-12 d-flex flex-wrap justify-content-around">
            <?php foreach($sedes as $row): ?>
                <div class="card text-center mb-5" style="width: 18rem">
                    <a href="?c=eventos&a=index&sede=<?php echo $row->idSede ?>"><img src="data:image/jpeg; base64, <?php echo  base64_encode($row->imgSede); ?>" class="card-img-top estadio" style="height: 200px"></a>
                    <div class="card-body">
                        <h4 class="card-title"><?php echo $row->DireccionSede; ?></h4>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</div>