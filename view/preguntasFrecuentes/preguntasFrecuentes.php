<div class="col-md-12">PREGUNTAS FRECUENTES</div>
<div class="col-md-12" id="contenidoPreguntasFrecuentes">
    <div class="col-md-12">'


        <div class="col-md-12">
            <h3></h3>
            <?php foreach($pregFrecAreas as $row): ?>
            <p><?php echo $row->area; ?></p>

            <p> <?php foreach($this->model->Listar($row->codigo) as $r): ?>
                <li><?php echo $r->pregunta ?></li>

                <?php foreach($this->respuestas->Listar($r->codigo) as $fila): ?>
                    <li><?php echo $fila->respuesta ?></li>


                    <?php endforeach; ?>
                </p>
                <?php endforeach; ?>
            



            <?php endforeach; ?>
        </div>

        <div class="col-md-12"></div>

        <div class="col-md-12"></div>

    </div>
</div>