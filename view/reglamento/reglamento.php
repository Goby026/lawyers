<main>
    <div class="container">
        <div class="row">
            <div class="col-md-12 border border-secondary mt-3" style="padding: 15px;">
                <h2 class="text-center">REGLAMENTO JUEGOS PANAMERICANOS LIMA 2019</h2>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-12">

                <div class="accordion" id="accordionExample">
                    <div class="card">
                        <?php foreach ($secciones as $row): ?>
                            <div class="card-header" id="headingOne">
                                <h2 class="mb-0">
                                    <button class="btn btn-link" type="button" data-toggle="collapse"
                                            data-target="#collapseOne<?php echo $row->codigo ?>" aria-expanded="true" aria-controls="collapseOne">
                                        <?php echo $row->seccion ?>
                                    </button>
                                </h2>
                            </div>

                            <?php foreach ($this->norma->Listar($row->codigo) as $r): ?>
                                <div id="collapseOne<?php echo $row->codigo ?>" class="collapse"
                                     aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body ml-3">
                                        <?php echo $r->contenido; ?>
                                    </div>
                                    <?php foreach ($this->subnorma->Listar($r->codigo) as $fila): ?>
                                        <div class="card-footer ml-5">
                                            <?php echo $fila->contenido; ?>
                                        </div>
                                    <?php endforeach; ?>
                                </div>
                            <?php endforeach; ?>
                        <?php endforeach; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

