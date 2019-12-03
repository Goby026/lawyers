<div class="container-fluid">
    <div class="row titulos">
        <h3>Configuración de notificaciones</h3>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <!-- style="width: 25rem;" -->
            <div class="card mt-3">
                <div class="card-header">
                    Notificaciones
                </div>

                <div class="card-body">
                    <ul class="list-group list-group-flush">
                        <?php
                        foreach ($tiponotificaciones as $tipo) {
                            ?>

                            <li class="list-group-item">
                                <div class="form-check">
                                    <?php
                                    if ($tipo->state == 0){
                                        ?>
                                        <input class="form-check-input" type="checkbox" value="" id="newcase<?php echo $tipo->idtiponotificacion;?>" onchange="ver(<?php echo $tipo->idtiponotificacion;?>)">
                                        <?php
                                    }else{
                                        ?>
                                        <input class="form-check-input" type="checkbox" value="" id="newcase<?php echo $tipo->idtiponotificacion;?>" onchange="ver(<?php echo $tipo->idtiponotificacion;?>)" checked>
                                        <?php
                                    }
                                    ?>

                                    <label class="form-check-label" for="newcase<?php echo $tipo->idtiponotificacion;?>">
                                        <?php echo $tipo->nombre; ?>
                                    </label>
                                </div>
                            </li>

                            <?php
                        }
                        ?>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    //actualizar instancia
    // document.getElementById("newcase").onchange = function () {
    //     var checkedValue = document.querySelector('#newcase').checked;
    //     console.log("val:", checkedValue);
    // };

    function ver(id){
        if (document.querySelector('#newcase'+id).checked){
            var checkedValue = 1;
        }else{
            var checkedValue = 0;
        }

        $.ajax({
            type: 'POST',
            dataType: "json",
            url: "?c=notificacion&a=tiponoti",
            data: {
                idtiponotificacion: id,
                val: checkedValue
            },
            success: function (response) {
                console.log(response);
            }
        });
    }
</script>