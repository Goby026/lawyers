<main>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>PREGUNTAS FRECUENTES</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">

                <?php foreach($pregFrecAreas as $row): ?>

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><?php echo $row->area; ?></h5>

                            <?php foreach($this->model->Listar($row->codigo) as $r): ?>
                                <h6 class="card-subtitle mb-2 text-muted"><?php echo $r->pregunta ?></h6>

                                <?php foreach($this->respuestas->Listar($r->codigo) as $fila): ?>

                                    <p class="card-text" style="margin-left: 5%;"><?php echo $fila->respuesta ?></p>


                                <?php endforeach; ?>
                                </p>
                            <?php endforeach; ?>

                        </div>
                    </div>

                <?php endforeach; ?>
            </div>
        </div>
    </div>
</main>
