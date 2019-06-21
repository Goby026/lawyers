
<div class="fondoreglamento">
<div class="col-md-12" id="tituloReglamento" ALIGN="center" style="font-family: Times New Roman Times serif">
    <h1>REGLAMENTO JUEGOS PANAMERICANOS LIMA 2019</h1>
</div>
        <div class="col-md-12">
        
         <?php  foreach($secciones as $row): ?>         
         
            
            <ul class="list-group"> 
            
            <h3><?php echo $row->seccion ?></h3>

                <?php foreach($this->norma->Listar($row->codigo) as $r): ?>

                    <li class="list-group-item"><?php echo $r->contenido; ?></li>
                    <?php foreach($this->subnorma->Listar($r->codigo) as $fila): ?>     
                            <li class="list-group-item"><div style="margin-left: 2%;"><?php echo $fila->contenido; ?></div></li>
                    <?php endforeach; ?>

                <?php endforeach; ?>
          
            </ul>
            <?php endforeach; ?>
        </div>
    </div>
