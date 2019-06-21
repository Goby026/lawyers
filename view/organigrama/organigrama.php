<div id="organigramafondo" class="col-md-12">
    <div class="col-md-12" style="padding-bottom: 100px;">
        <p><b>El siguiente ORGANIGRAMA nos permite conocer la estructura interna
                del Proyecto Especial para la Preparación y desarrollo de los XVIII
                Juegos Panamericanos del 2019</b></p>
    </div>

    <?php foreach($oficinas as $row): ?>
    <p><?php echo $row->oficina; ?></p>

    <p> <?php foreach( $this->unidades->Listar($row->codigo) as $r): ?></p>
        <li><?php echo $r->unidad ?></li>

        <?php endforeach; ?>
        <?php endforeach; ?>

  