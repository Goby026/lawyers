<div class="container-fluid">
    <div class="row titulos">
        <h3>Lista de casos</h3>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-6 p-0 m-0">
            <nav class="navbar navbar-light bg-light p-0 m-0">
                <form class="form-inline">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-primary my-2 my-sm-0" type="button">Search</button>
                </form>
                <form class="form-inline my-auto">
                    <button class="btn btn-warning" type="button"><i class="fas fa-arrows-alt-h"></i></button>
                    <button class="btn btn-success" type="button"><i class="fa fa-user"></i></button>
                </form>
            </nav>
            <div class="row mt-1">
                <div class="col-md-12">
                    <table class="table table-hover table-responsive">
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
                        foreach ($casos as $caso){
                        ?>
                        <tr>
                            <th scope="row">1</th>
                            <td><?php echo $caso->t_CasoFech; ?></td>
                            <td><?php echo $caso->caso_titulo; ?></td>
                            <td><?php echo $caso->nombres." ".$caso->apellidos; ?></td>
                            <td>
                                <a href="?c=caso&a=expedientes&t_CasoCod=<?php echo $caso->t_CasoCod;?>" class="btn btn-next"><i class="fas fa-chevron-circle-right"></i>
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
        <div class="col-md-6">
            <?php
            if (isset($detalle)) {
                ?>
                <div class="row">
                    <a href="?c=caso&a=expedientes" class="btn btn-danger btn-sm ml-auto"><i class="fa fa-window-close"></i></a>
                </div>
                <div class="detail mt-4">
                    <div class="row m-0 p-0">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleFormControlSelect1">Instancia:</label>
                                <select class="form-control" id="exampleFormControlSelect1" disabled>
                                    <option>Juzgado</option>
                                    <option>Sala</option>
                                    <option>Casación</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleFormControlSelect1">Materia:</label>
                                <select class="form-control" id="exampleFormControlSelect1" disabled>
                                    <option>Civil</option>
                                    <option>Penal</option>
                                    <option>Constitucional</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <!-- juzgado -->
                    <div class="row juzgado">
                        <div class="card">
                            <div class="card-header">
                                <form>
                                    <div class="form-row">
                                        <div class="col-10">
                                            <h5>JUZGADO:</h5>
                                        </div>
                                        <div class="col">
                                            <button class="btn btn-success text-right">
                                                <i class="fas fa-plus" data-toggle="modal" data-target="#myModal1"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="card-body">
                                <div class="container">
                                    <div class="modal fade" id="myModal1">
                                        <div class="modal-dialog modal-dialog-centered modal-sx">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">JUZGADO:</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="/action_page.php">
                                                        <div class="form-group">
                                                            <div
                                                                    class="input-group date"
                                                                    id="datetimepicker1"
                                                                    data-target-input="nearest"
                                                            >
                                                                <input
                                                                        type="text"
                                                                        class="form-control datetimepicker-input"
                                                                        data-target="#datetimepicker1"
                                                                />
                                                                <div
                                                                        class="input-group-append"
                                                                        data-target="#datetimepicker1"
                                                                        data-toggle="datetimepicker"
                                                                >
                                                                    <div class="input-group-text">
                                                                        <i class="fa fa-calendar"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for>Asunto:</label>
                                                            <input type="text" class="form-control" id required/>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="fechapagos">Lugar:</label>
                                                            <div class="form-group">
                                                                <label for="exampleFormControlSelect1">Buscar el
                                                                    Juzgado:</label>
                                                                <select class="form-control"
                                                                        id="exampleFormControlSelect1">
                                                                    <option>1</option>
                                                                    <option>2</option>
                                                                    <option>3</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </form>
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
                                    </div>
                                </div>

                                <table class="table table-dark table-responsive table-hover">
                                    <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Fecha y hora</th>
                                        <th scope="col">Asunto</th>
                                        <th scope="col">Lugar</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>
                                            <div class="form-group">
                                                <input type="text" class="form-control" id/>
                                            </div>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control" id/>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control" id/>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-danger">Borrar</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>

                                <div class="form-group">
                                    <label for="exampleFormControlSelect1">Seguimiento:</label>
                                    <select class="form-control" id="exampleFormControlSelect1">
                                        <option>Acuerdo</option>
                                        <option>Pospuesto</option>
                                        <option>Nueva Audiencia</option>
                                        <option>Desacuerdo</option>
                                    </select>
                                </div>
                                <button type="button" class="btn btn-danger">Borrar</button>
                            </div>
                        </div>
                    </div>
                    <!-- documentos -->
                    <div class="row documentos">
                        <div class="card">
                            <div class="card-header">
                                <form>
                                    <div class="form-row">
                                        <div class="col-10">
                                            <h5 class="card-title">DOCUMENTOS:</h5>
                                        </div>
                                        <div class="col">
                                            <button class="btn btn-success text-right">
                                                <i
                                                        style="font-size: 2em"
                                                        class="fas fa-plus-square float-right"
                                                        data-toggle="modal"
                                                        data-target="#myModal2"
                                                ></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="card-body">
                                <div class="container">
                                    <div class="modal fade" id="myModal2">
                                        <div class="modal-dialog modal-dialog-centered modal-sx">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">DOCUMENTOS:</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="/action_page.php">
                                                        <div class="form-group">
                                                            <label for>Tipo:</label>
                                                            <div class="form-group">
                                                                <select class="form-control"
                                                                        id="exampleFormControlSelect1">
                                                                    <option>Apelacion</option>
                                                                    <option>Demanda</option>
                                                                    <option>Resolucion</option>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for>Fecha:</label>
                                                            <div
                                                                    class="input-group date"
                                                                    id="datetimepicker2"
                                                                    data-target-input="nearest"
                                                            >
                                                                <input
                                                                        type="text"
                                                                        class="form-control datetimepicker-input"
                                                                        data-target="#datetimepicker2"
                                                                />
                                                                <div
                                                                        class="input-group-append"
                                                                        data-target="#datetimepicker2"
                                                                        data-toggle="datetimepicker"
                                                                >
                                                                    <div class="input-group-text">
                                                                        <i class="fa fa-calendar"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
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
                                    </div>
                                </div>

                                <table class="table table-dark table-responsive table-hover">
                                    <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Tipo</th>
                                        <th scope="col">Fecha</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Demanda</td>
                                        <td>
                                            <input type="date" class="form-control" id="fechaDoc"/>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-danger">Borrar</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Apelacion</td>
                                        <td>
                                            <input type="date" class="form-control" id="fechaDoc"/>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-danger">Borrar</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Resolucion Nº 2205</td>
                                        <td>
                                            <input type="date" class="form-control" id="fechaDoc"/>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-danger">Borrar</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- Observaciones -->
                    <div class="row observaciones">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        OBSERVACIONES:
                                        <i
                                                style="font-size: 2em"
                                                class="fas fa-plus-square float-right"
                                                data-toggle="modal"
                                                data-target="#myModal3"
                                        ></i>
                                    </h5>

                                    <div class="container">
                                        <div class="modal fade" id="myModal3">
                                            <div class="modal-dialog modal-dialog-centered modal-sx">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">OBSERVACIONES:</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="/action_page.php">
                                                            <div class="form-group">
                                                                <label for>Título:</label>
                                                                <input type="text" class="form-control"/>

                                                                <div class="form-group">
                                                                    <label for="¨¨">Descripción:</label>
                                                                    <textarea class="form-control" rows="5" id
                                                                              name="text"></textarea>
                                                                </div>
                                                                <button type="submit" class="btn btn-primary">Programar
                                                                    recordatorio
                                                                </button>
                                                            </div>

                                                            <div class="form-group">
                                                                <label for>Fecha:</label>
                                                                <div
                                                                        class="input-group date"
                                                                        id="datetimepicker3"
                                                                        data-target-input="nearest"
                                                                >
                                                                    <input
                                                                            type="text"
                                                                            class="form-control datetimepicker-input"
                                                                            data-target="#datetimepicker3"
                                                                    />
                                                                    <div
                                                                            class="input-group-append"
                                                                            data-target="#datetimepicker3"
                                                                            data-toggle="datetimepicker"
                                                                    >
                                                                        <div class="input-group-text">
                                                                            <i class="fa fa-calendar"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
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
                                        </div>
                                    </div>

                                    <table class="table table-dark table-responsive table-hover">
                                        <thead>
                                        <tr>
                                            <th scope="col">Título</th>
                                            <th scope="col">Fecha Vencimiento</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>Observaciones Nº 1: Lorem ipsum</td>
                                            <td>
                                                <input type="date" class="form-control" id="fechaDoc"/>
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Observaciones Nº 2: Lorem ipsum</td>
                                            <td>
                                                <input type="date" class="form-control" id="fechaDoc"/>
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Observaciones Nº 2: Lorem ipsum</td>
                                            <td>
                                                <input type="date" class="form-control" id="fechaDoc"/>
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Pagos-adelantos -->
                    <div class="row pagos_adelantos">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        PAGOS / ADELANTOS:
                                        <i
                                                style="font-size: 2em"
                                                class="fas fa-plus-square float-right"
                                                data-toggle="modal"
                                                data-target="#myModal4"
                                        ></i>
                                    </h5>
                                    <div class="container">
                                        <div class="modal fade" id="myModal4">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <!-- Modal Header -->
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">PAGOS/ADELANTOS:</h4>
                                                    </div>

                                                    <!-- Modal body -->
                                                    <div class="modal-body">
                                                        <form action="/action_page.php">
                                                            <div class="form-group">
                                                                <label for="total">Total:</label>
                                                                <input
                                                                        type="number"
                                                                        class="form-control"
                                                                        id="total"
                                                                        placeholder="S/."
                                                                        required
                                                                />
                                                            </div>

                                                            <div class="form-group">
                                                                <label for="concepto">Concepto:</label>
                                                                <input type="text" class="form-control" id="concepto"
                                                                       required/>
                                                            </div>

                                                            <div class="form-group">
                                                                <label for="fechapagos">Fecha:</label>
                                                                <input type="date" class="form-control" id="fechapagos"
                                                                       required/>
                                                            </div>
                                                        </form>
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
                                        </div>
                                    </div>

                                    <table class="table table-dark table-responsive table-hover">
                                        <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Concepto</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Monto</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <th>Primera cuota por servicio</th>
                                            <td>
                                                <input type="date" class="form-control" id="fechaDoc"/>
                                            </td>
                                            <td>S/. 600</td>
                                            <td>
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <th>Gastos representacion</th>
                                            <td>
                                                <input type="date" class="form-control" id="fechaDoc"/>
                                            </td>
                                            <td>S/. 200</td>
                                            <td>
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <th>Ultima cuota por servicio</th>
                                            <td>
                                                <input type="date" class="form-control" id="fechaDoc"/>
                                            </td>
                                            <td>S/. 2000</td>
                                            <td>
                                                <button type="button" class="btn btn-danger">Borrar</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"></th>
                                            <th></th>
                                            <td></td>
                                            <td>S/. 2800</td>
                                            <td></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
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
