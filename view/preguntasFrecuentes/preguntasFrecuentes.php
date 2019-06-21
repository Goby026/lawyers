

<div class="col-md-12"><h1>PREGUNTAS FRECUENTES</h1></div>
<div class="col-md-12" id="contenidoPreguntasFrecuentes">

            
            <?php foreach($pregFrecAreas as $row): ?>
            <div class="col-md-12"><h3><p><?php echo $row->area; ?></p></h3></div>

            <p><?php foreach($this->model->Listar($row->codigo) as $r): ?></<p>
            <div class="col-md-6"><h5><li><?php echo $r->pregunta ?></li></h5></div>

                <?php foreach($this->respuestas->Listar($r->codigo) as $fila): ?>
                    <h5><li><?php echo $fila->respuesta ?></li></h5>


                    <?php endforeach; ?>
                </p>
                <?php endforeach; ?>
            



            <?php endforeach; ?>
        </div>



    </div>
</div>