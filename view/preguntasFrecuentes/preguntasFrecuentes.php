<!---->
<!---->
<!--<div class="col-md-12"><h1>PREGUNTAS FRECUENTES</h1></div>-->
<!--<div class="col-md-12" id="contenidoPreguntasFrecuentes">-->
<!---->
<!--            -->
<!--            --><?php //foreach($pregFrecAreas as $row): ?>
<!--            <div class="col-md-12"><h3><p>--><?php //echo $row->area; ?><!--</p></h3></div>-->
<!---->
<!--            <p>--><?php //foreach($this->model->Listar($row->codigo) as $r): ?><!--</<p>-->
<!--            <div class="col-md-6"><h5><li>--><?php //echo $r->pregunta ?><!--</li></h5></div>-->
<!---->
<!--                --><?php //foreach($this->respuestas->Listar($r->codigo) as $fila): ?>
<!--                    <h5><li>--><?php //echo $fila->respuesta ?><!--</li></h5>-->
<!---->
<!---->
<!--                    --><?php //endforeach; ?>
<!--                </p>-->
<!--                --><?php //endforeach; ?>
<!--            -->
<!---->
<!---->
<!---->
<!--            --><?php //endforeach; ?>
<!--        </div>-->
<!---->
<!---->
<!---->
<!--    </div>-->
<!--</div>-->

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
<!--                    <div class="col-md-12"><h3><p></p></h3></div>-->

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><?php echo $row->area; ?></h5>

                            <?php foreach($this->model->Listar($row->codigo) as $r): ?>
<!--                                <div class="col-md-6"><h5><li></li></h5></div>-->
                                <h6 class="card-subtitle mb-2 text-muted"><?php echo $r->pregunta ?></h6>

                                <?php foreach($this->respuestas->Listar($r->codigo) as $fila): ?>
<!--                                    <h5><li>--><?php //echo $fila->respuesta ?><!--</li></h5>-->

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
