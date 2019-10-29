<div class="container-fluid">
    <div class="row titulos">
        <h3>Clientes</h3>
    </div>
</div>
<div class="container">
    <div class="row">
<!--        <a href="?c=cliente&a=crud" class="btn btn-success ml-auto"><i class="fa fa-plus"></i> Nuevo cliente</a>-->
        <!-- Example single danger button -->
        <div class="btn-group ml-auto">
            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-plus"></i> Nuevo cliente
            </button>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="?c=cliente&a=crud&tipoCliente=1">Natural</a>
                <a class="dropdown-item" href="?c=cliente&a=crud&tipoCliente=2">Jurídico</a>
            </div>
        </div>
    </div>
    <div class="row mt-2">
        <div class="col-md-6 fuentes">
            <h5>CLIENTES NATURALES</h5>
            <hr>
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">Nombres y apellidos</th>
                    <th scope="col">Dni</th>
                    <th scope="col">Teléfono</th>
                    <th scope="col">Dirección</th>
                </tr>
                </thead>
                <tbody>
                <?php
                foreach ($naturales as $natural) {
                    ?>
                    <tr>
                        <th scope="row"><?php echo $natural->nombres." ".$natural->apellidos;?></th>
                        <td><?php echo $natural->dni;?></td>
                        <td><?php echo $natural->telefono;?></td>
                        <td><?php echo $natural->direccion;?></td>
                    </tr>
                    <?php
                }
                ?>
                </tbody>
            </table>
        </div>
        <div class="col-md-6 fuentes">
            <h5>CLIENTES JURIDICOS</h5>
            <hr>
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">Razon</th>
                    <th scope="col">Ruc</th>
                    <th scope="col">Teléfono</th>
                    <th scope="col">Dirección</th>
                </tr>
                </thead>
                <tbody>
                <?php
                foreach ($juridicos as $juridico) {
                    ?>
                    <tr>
                        <th scope="row"><?php echo $juridico->razon_social;?></th>
                        <td><?php echo $juridico->ruc;?></td>
                        <td><?php echo $juridico->telefono;?></td>
                        <td><?php echo $juridico->direccion;?></td>
                    </tr>
                    <?php
                }
                ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
