
  <main>
      <div class="container">
          <div class="row">
              <div class="col-md-12 border border-secondary mt-3" style="padding: 15px;">
                  <p class="text-center">El siguiente ORGANIGRAMA nos permite conocer la estructura interna del Proyecto Especial para la Preparación y desarrollo de los XVIII Juegos Panamericanos del 2019</p>
              </div>
          </div>

          <div class="row">
              <?php foreach($oficinas as $row): ?>
              <div class="col-md-4">
                  <div class="col-md-12 border border-secondary mt-3" style="padding: 15px;">
                  <p style="color: #0f0f0f;"><?php echo $row->oficina; ?></p>

                  </div>

                      <?php foreach( $this->unidades->Listar($row->codigo) as $r): ?>
                        <ul style="color: #0f0f0f;"><?php echo $r->unidad ?></ul>
                      <?php endforeach; ?>
              </div>
              <?php endforeach; ?>
          </div>
      </div>
  </main>
