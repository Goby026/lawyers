<div class="container">
    <h2 class="text-center mt-5">Categorias Asientos</h2>
    <hr>
    <div class="row">
        <div class="col-lg-7 mt-5">
            <div class="table-responsive">
                <table class="table">
                    <thead class="text-center">
                        <tr>
                            <th>Categoria</th>
                            <th>Precio</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($categorias as $row): ?>
                            <tr>
                                <td><?php echo $row->Categoria ?></td>
                                <td><?php echo $row->Precio ?></td>
                                <td><a href="?c=asientos&a=index&categoria=<?php echo $row->IdCategoria; ?>" class="btn btn-primary">Compra tu entrada</a></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-lg-5 mt-5">
            <?php foreach($imagen as $row): ?>
                <img src="data:image/jpeg; base64, <?php echo  base64_encode($row->Imagen); ?>" class="card-img-top estadio" style="">
            <?php endforeach; ?>
            
        </div>
    </div>
</div>