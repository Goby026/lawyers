<div class="container-fluid">
    <div class="row titulos">
        <h3>Lista de casos</h3>
    </div>
</div>
<div class="container bg-light">
    <div class="row">
        <div class="col-md-6 p-0 m-0 fuentes">
            <div class="row">
                <div class="col-md-12 p-2 ml-4">
                    <form class="form-inline" style="width: 100%">
                        <input class="form-control" type="search" placeholder="Busqueda"
                               aria-label="Search">
                        &nbsp;<button class="btn btn-primary my-2 my-sm-0" type="button"><i class="fas fa-search"></i>
                        </button>
                    </form>
                </div>
            </div>
            <!--            <nav class="navbar navbar-light bg-light p-0 m-0">-->
            <!--                -->
            <!--                <form class="form-inline my-auto">-->
            <!--                    <button class="btn btn-warning" type="button"><i class="fas fa-arrows-alt-h"></i></button>-->
            <!--                    <button class="btn btn-success" type="button"><i class="fa fa-user"></i></button>-->
            <!--                </form>-->
            <!--            </nav>-->
            <div class="row mt-1">
                <div class="col-md-12">
                    <table class="table table-hover">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Inicio Proc.</th>
                            <th scope="col">Caso</th>
                            <th scope="col">Cliente</th>
                            <th scope="col">&nbsp;</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        foreach ($casos as $caso) {
                            ?>
                            <tr>
                                <th scope="row"><?php echo $caso->t_CasoCod; ?></th>
                                <td><?php echo $caso->t_CasoFech; ?></td>
                                <td><?php echo $caso->caso_titulo; ?></td>
                                <td><?php echo $caso->nombres . " " . $caso->apellidos; ?></td>
                                <td>
                                    <a href="?c=caso&a=expedientes&t_CasoCod=<?php echo $caso->t_CasoCod; ?>"
                                       class="btn btn-next"><i class="fas fa-chevron-circle-right"></i>
                                    </a>
                                </td>
                            </tr>
                            <?php
                        }
                        ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-6 p-0 m-0 fuentes">
            <?php
            if (isset($detalle)) {
                ?>
                <div class="row">
                    <div class="col-md-12 text-right">
                        <a href="?c=caso&a=expedientes" class="btn btn-danger btn-sm mr-1 mt-1"><i
                                    class="fa fa-window-close"></i></a>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group ml-2">
                            <label for="exampleFormControlSelect1">Instancia:</label>
                            <select class="form-control" id="exampleFormControlSelect1">
                                <option>Juzgado</option>
                                <option>Sala</option>
                                <option>Casación</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group mr-2">
                            <label for="exampleFormControlSelect1">Materia:</label>
                            <select class="form-control" id="exampleFormControlSelect1">
                                <option>Civil</option>
                                <option>Penal</option>
                                <option>Constitucional</option>
                            </select>
                        </div>
                    </div>
                </div>
                <!-- audiencia -->
                <div class="row juzgado">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <form>
                                    <div class="form-row">
                                        <div class="col-10">
                                            <h5>AUDIENCIAS</h5>
                                        </div>
                                        <div class="col text-right m-0 p-0">
                                            <a href="" class="btn btn-success ml-auto" data-target="#audiencia"
                                               data-toggle="modal"><i class="fas fa-plus"></i>
                                            </a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!--modal-->
                            <div class="modal fade" id="audiencia">
                                <form action="?c=audiencia&a=guardar" method="post">
                                    <div class="modal-dialog modal-dialog-centered modal-sx">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">JUZGADO:</h4>
                                            </div>
                                            <div class="modal-body">

                                                <div class="form-group">
                                                    <label for="asunto">Asunto:</label>
                                                    <input type="text" class="form-control" name="asunto" id="asunto"
                                                           required/>
                                                </div>

                                                <div class="form-group">
                                                    <label for="t_AudiDireccion">Direccion:</label>
                                                    <input type="text" name="t_AudiDireccion" class="form-control"
                                                           id="t_AudiDireccion" required/>
                                                </div>

                                                <div class="form-group">
                                                    <label for="t_AudiHora">Hora:</label>
                                                    <input type="time" name="t_AudiHora" class="form-control"
                                                           id="t_AudiHora" required/>
                                                </div>

                                                <div class="form-group">
                                                    <label for="t_AudiFecha">Fecha:</label>
                                                    <input type="date" name="t_AudiFecha" class="form-control"
                                                           id="t_AudiFecha" required/>
                                                </div>

                                                <div class="form-group">
                                                    <label for="t_AudiObservaciones">Observación:</label>
                                                    <textarea class="form-control" name="t_AudiObservaciones"
                                                              id="t_AudiObservaciones" cols="10" rows="5"></textarea>
                                                </div>

                                                <!--id de caso-->
                                                <input type="hidden" name="t_casocod" value="<?php echo $t_CasoCod; ?>">

                                                <div class="form-group">
                                                    <label for="idt_juzgado">Juzgado:</label>
                                                    <select class="form-control" name="idt_juzgado"
                                                            id="idt_juzgado">
                                                        <?php
                                                        foreach ($juzgados as $juzgado) {
                                                            ?>
                                                            <option value="<?php echo $juzgado->idt_juzgado; ?>"><?php echo $juzgado->nombre; ?></option>
                                                            <?php
                                                        }
                                                        ?>
                                                    </select>
                                                </div>

                                                <div class="form-group">
                                                    <label for="t_estado">Estado</label>
                                                    <select class="form-control" name="t_estado" id="t_estado">
                                                        <?php
                                                        foreach ($estados as $estado) {
                                                            ?>
                                                            <option value="<?php echo $estado->t_estado; ?>"><?php echo $estado->title; ?></option>
                                                            <?php
                                                        }
                                                        ?>
                                                        <!--                                                        <option selected>Acuerdo</option>-->
                                                        <!--                                                        <option>Pospuesto</option>-->
                                                        <!--                                                        <option>Nueva Audiencia</option>-->
                                                        <!--                                                        <option>Desacuerdo</option>-->
                                                    </select>
                                                </div>

                                            </div>

                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-primary">Guardar</button>

                                                <button type="button" class="btn btn-danger" data-dismiss="modal">
                                                    Cerrar
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div class="card-body p-1">
                                <table class="table table-hover">
                                    <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th>Fecha y hora</th>
                                        <th>Asunto</th>
                                        <th>Lugar</th>
                                        <th>Estado</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php
                                    foreach ($audiencias as $audiencia) {
                                        ?>
                                        <tr>
                                            <td><?php echo $audiencia->t_AudiCod; ?></td>
                                            <td><?php echo $audiencia->t_AudiFecha . " " . $audiencia->t_AudiHora; ?></td>
                                            <td><?php echo $audiencia->asunto; ?></td>
                                            <td><?php echo $audiencia->t_AudiDireccion; ?></td>
                                            <td><?php echo $audiencia->title; ?></td>
                                            <td>
                                                <button type="button" class="btn btn-warning btn-sm"><i
                                                            class="fas fa-pen"></i></button>
                                            </td>
                                        </tr>
                                        <?php
                                    }
                                    ?>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <!-- documentos -->
                <div class="row documentos">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <form>
                                    <div class="form-row">
                                        <div class="col-10">
                                            <h5 class="card-title">DOCUMENTOS</h5>
                                        </div>
                                        <div class="col text-right m-0 p-0">
                                            <button type="button" class="btn btn-success text-right"
                                                    data-toggle="modal"
                                                    data-target="#documentos">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!--modal-->
                            <div class="modal fade" id="documentos">
                                <form action="?c=documentos&a=guardar" method="post" enctype="multipart/form-data">
                                    <div class="modal-dialog modal-dialog-centered modal-sx">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">DOCUMENTOS</h4>
                                            </div>
                                            <div class="modal-body">

                                                <div class="form-group">
                                                    <label for="t_docudescripcion">Nombre:</label>
                                                    <input type="text" name="t_docudescripcion" id="t_docudescripcion"
                                                           class="form-control">
                                                </div>

                                                <!--id de caso-->
                                                <input type="hidden" name="t_casocod" value="<?php echo $t_CasoCod; ?>">

                                                <div class="form-group">
                                                    <label for="documento">Archivo:</label>
                                                    <input type="file" name="documento" id="documento"
                                                           class="form-control">
                                                </div>

                                            </div>

                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-primary">Guardar</button>

                                                <button type="button" class="btn btn-danger" data-dismiss="modal">
                                                    Cerrar
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="card-body p-1">
                                <table class="table table-hover">
                                    <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th>Tipo</th>
                                        <th>Fecha</th>
                                        <th>Archivo</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php
                                    foreach ($documentos as $doc) {
                                        ?>
                                        <tr>
                                            <th scope="row"><?php echo $doc->t_DocuCod; ?></th>
                                            <td><?php echo $doc->t_DocuDescripcion; ?></td>
                                            <td><?php echo $doc->fechaSistema; ?></td>
                                            <td>
                                                <a href="">
                                                    <i class="far fa-file-alt"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-warning btn-sm"><i
                                                            class="fas fa-pen"></i></button>
                                            </td>
                                        </tr>
                                        <?php
                                    }
                                    ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <!-- Observaciones -->
                <div class="row observaciones">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <form>
                                    <div class="form-row">
                                        <div class="col-10">
                                            <h5 class="card-title">
                                                OBSERVACIONES:
                                            </h5>
                                        </div>
                                        <div class="col text-right m-0 p-0">
                                            <a href="" class="btn btn-success ml-auto" data-target="#observaciones"
                                               data-toggle="modal"><i class="fas fa-plus"></i>
                                            </a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!--modal-->
                            <div class="modal fade" id="observaciones">
                                <form action="?c=observacion&a=guardar" method="post">
                                    <div class="modal-dialog modal-dialog-centered modal-sx">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">OBSERVACIONES:</h4>
                                            </div>
                                            <div class="modal-body">

                                                <div class="form-group">
                                                    <label for="title">Título:</label>
                                                    <input type="text" name="title" id="title" class="form-control"/>

                                                    <div class="form-group">
                                                        <label for="description">Descripción:</label>
                                                        <textarea class="form-control" rows="5" id="description"
                                                                  name="description"></textarea>
                                                    </div>

                                                    <!--id de caso-->
                                                    <input type="hidden" name="t_casocod"
                                                           value="<?php echo $t_CasoCod; ?>">

                                                    <!--                                                    <button type="submit" class="btn btn-primary">Programar-->
                                                    <!--                                                        recordatorio-->
                                                    <!--                                                    </button>-->
                                                </div>

                                            </div>

                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-primary">Guardar</button>

                                                <button type="button" class="btn btn-danger"
                                                        data-dismiss="modal">
                                                    Cerrar
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="card-body p-1">
                                <table class="table table-hover">
                                    <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th>Título</th>
                                        <th>Descripción</th>
                                        <th>Fecha</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php
                                    foreach ($observaciones as $obs) {
                                        ?>
                                        <tr>
                                            <td><?php echo $obs->idt_observacion; ?></td>
                                            <td><?php echo $obs->title; ?></td>
                                            <td><?php echo $obs->description; ?></td>
                                            <td><?php echo $obs->fechaSistema; ?></td>
                                            <td>
                                                <button type="button" class="btn btn-warning btn-sm"><i
                                                            class="fas fa-pen"></i></button>
                                            </td>
                                        </tr>
                                        <?php
                                    }
                                    ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <!-- Pagos-adelantos -->
                <div class="row pagos_adelantos">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <form>
                                    <div class="form-row">
                                        <div class="col-10">
                                            <h5 class="card-title">PAGOS / ADELANTOS</h5>
                                        </div>
                                        <div class="col text-right m-0 p-0">
                                            <button type="button" class="btn btn-success text-right" data-toggle="modal" data-target="#pagos_ad">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!--modal-->
                            <div class="modal fade" id="pagos_ad">
                                <form action="?c=pagosad&a=guardar" method="post">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <!-- Modal Header -->
                                            <div class="modal-header">
                                                <h4 class="modal-title">PAGOS/ADELANTOS:</h4>
                                            </div>
                                            <!-- Modal body -->
                                            <div class="modal-body">

                                                <!--id de caso-->
                                                <input type="hidden" name="t_casocod" value="<?php echo $t_CasoCod;?>">

                                                <div class="form-group">
                                                    <label for="t_PagoMonto">Total:</label>
                                                    <input type="number" class="form-control" name="t_PagoMonto" id="t_PagoMonto" placeholder="S/." required/>
                                                </div>

<!--                                                <div class="form-group">-->
<!--                                                    <label for="t_PagoMontoInicial">Monto Inicial:</label>-->
<!--                                                    <input type="number" class="form-control" name="t_PagoMontoInicial" id="t_PagoMontoInicial" placeholder="S/." required/>-->
<!--                                                </div>-->

                                                <div class="form-group">
                                                    <label for="t_PagoDescrip">Concepto:</label>
                                                    <input type="text" class="form-control" name="t_PagoDescrip" id="t_PagoDescrip" required/>
                                                </div>

                                            </div>

                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-primary">Guardar</button>

                                                <button type="button" class="btn btn-danger"
                                                        data-dismiss="modal">
                                                    Cerrar
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="card-body p-1">
                                <table class="table table-hover">
                                    <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th>Concepto</th>
                                        <th>Fecha</th>
                                        <th>Monto</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php
                                    foreach ($pagos as $pago) {
                                        ?>
                                        <tr>
                                            <td scope="row"><?php echo $pago->idPagoCod; ?></td>
                                            <td><?php echo $pago->t_PagoDescrip; ?></td>
                                            <td><?php echo $pago->fechaSistema; ?></td>
                                            <td><?php echo "S/. ".$pago->t_PagoMonto; ?></td>
                                            <td>
                                                <button type="button" class="btn btn-warning btn-sm"><i
                                                            class="fas fa-pen"></i></button>
                                            </td>
                                        </tr>
                                        <?php
                                    }
                                    ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <?php
            }
            ?>
        </div>
    </div>
</div>
