<div class="container-fluid">
    <div class="row titulos">
        <h3>Nuevo cliente Natural</h3>
    </div>
</div>
<div class="container">
    <div class="row">
        <hr>
        <div class="col-md-8 offset-2">
            <form action="?c=cliente&a=guardar&tipoCliente=1" method="post">

                <div class="form-group">
                    <label for="nombres">Nombres</label>
                    <input type="text" class="form-control" name="nombres" id="nombres" placeholder="Nombres">
                </div>

                <div class="form-group">
                    <label for="apellidos">Apellidos</label>
                    <input type="text" class="form-control" name="apellidos" id="apellidos" placeholder="Apellidos">
                </div>

                <div class="form-group">
                    <label for="dni">Dni</label>
                    <input type="text" class="form-control" name="dni" id="dni" placeholder="Dni">
                </div>

                <div class="form-group">
                    <label for="direccion">Dirección</label>
                    <input type="text" class="form-control" name="direccion" id="direccion" placeholder="Dirección">
                </div>

                <div class="form-group">
                    <label for="telefono">Teléfono</label>
                    <input type="text" class="form-control" name="telefono" id="telefono" placeholder="Teléfono">
                </div>

                <div class="form-group">
                    <label for="telefono2">Teléfono-2</label>
                    <input type="text" class="form-control" name="telefono2" id="telefono2" placeholder="Teléfono-2">
                </div>

                <div class="form-group">
                    <label for="nacimiento">Fecha Nacimiento</label>
                    <input type="date" class="form-control" name="fec_nac" id="nacimiento">
                </div>

                <div class="form-group">
                    <label for="departamento">Departamento</label>
                    <select class="form-control" name="dpto" id="">
                        <option value="1">Junín</option>
                        <option value="2">Lima</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="provincia">Provincia</label>
                    <select class="form-control" name="prov" id="">
                        <option value="1">Huancayo</option>
                        <option value="2">Concepción</option>
                        <option value="2">Jauja</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="distrito">Distrito</label>
                    <select class="form-control" name="dist" id="">
                        <option value="1">Huancayo</option>
                        <option value="2">El tambo</option>
                        <option value="2">Chilca</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-success">Registrar</button>
            </form>
        </div>
    </div>
</div>
