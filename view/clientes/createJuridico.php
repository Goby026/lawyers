<div class="container-fluid">
    <div class="row titulos">
        <h3>Nuevo cliente Jurídico</h3>
    </div>
</div>
<div class="container">
    <div class="row">
        <hr>
        <div class="col-md-8 offset-2">
            <form action="?c=cliente&a=guardar&tipoCliente=2" method="post">

                <div class="form-group">
                    <label for="ruc">Ruc</label>
                    <input type="text" class="form-control" name="ruc" id="ruc" placeholder="Ruc">
                </div>

                <div class="form-group">
                    <label for="razon">Razon Social</label>
                    <input type="text" class="form-control" name="razon_social" id="razon" placeholder="Razon Social">
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
