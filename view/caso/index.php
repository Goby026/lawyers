<div class="container">
    <div class="row">
        <div class="col-md-12">
            <form action="?c=caso&a=guardar" method="post">
                <div class="form-row">
                    <div class="col">
                        <div class="card">
                            <h5 class="card-header">Partes procesales 1:</h5>
                            <div class="card-body">

                                <div class="form-group">
                                    <label for="demandante">Demandante:</label> <br>

                                    <select class="selectpicker" name="cod_demandante" data-live-search="true">
                                        <?php
                                        foreach ($clientes as $cliente) {
                                            ?>
                                            <option value="<?php echo $cliente->idt_cliente; ?>"><?php echo $cliente->nombres . " " . $cliente->apellidos; ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>

                                </div>

                                <div class="form-group">
                                    <label for="demandado">Demandado:</label> <br>
                                    <select class="selectpicker" name="cod_demandado" data-live-search="true">
                                        <?php
                                        foreach ($clientes as $cliente) {
                                            ?>
                                            <option value="<?php echo $cliente->idt_cliente; ?>"><?php echo $cliente->nombres . " " . $cliente->apellidos; ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSelect1">Instancia:</label><br>
                                    <select class="selectpicker" name="t_InsCod" data-live-search="true">
                                        <?php
                                        foreach ($instancias as $instancia) {
                                            ?>
                                            <option value="<?php echo $instancia->t_InsCod; ?>"><?php echo $instancia->t_InsNombre; ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="juzgado">Juzgado</label>
                                    <input type="text" name="t_CasoJuzgado" class="form-control" required/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card">
                            <h5 class="card-header">Partes procesales 2:</h5>
                            <div class="card-body">

                                <div class="form-group">
                                    <label for="Abogado">Abogado:</label><br>
                                    <select class="selectpicker" data-width='75%' name="t_AboCod"
                                            data-live-search="true">
                                        <?php
                                        foreach ($abogados as $abogado) {
                                            ?>
                                            <option value="<?php echo $abogado->t_AboCod; ?>"><?php echo $abogado->t_AboNombre . " " . $abogado->t_AboApellidos; ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="cliente">Cliente</label><br>
                                    <select class="selectpicker" name="idt_cliente" data-live-search="true">
                                        <?php
                                        foreach ($clientes as $cliente) {
                                            ?>
                                            <option value="<?php echo $cliente->idt_cliente; ?>"><?php echo $cliente->nombres . " " . $cliente->apellidos; ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSelect1">Materia:</label><br>
                                    <select class="selectpicker" name="t_MateCod" data-live-search="true">
                                        <?php
                                        foreach ($materias as $materia) {
                                            ?>
                                            <option value="<?php echo $materia->t_MateCod; ?>"><?php echo $materia->t_MateDescripcion; ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="caso">Caso</label>
                                    <input type="text" name="caso_titulo" class="form-control" required/>
                                </div>
                                <div class="form-row mt-3">
                                    <div class="form-group col-md-6"></div>
                                    <div class="form-group col-md-6">
                                        <button type="submit" class="btn btn-success align-center btn-block">Registrar caso
                                        </button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
