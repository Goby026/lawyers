<div class="container-fluid">
    <div class="row titulos">
        <h3>Mantenimiento</h3>
    </div>
</div>
<div class="container maintenance">
    <!--instancias-->
    <div class="row">
        <div class="col-md-12">
            <?php
            if (isset($_GET['delete'])) {
                if ($_GET['delete'] == 'NO') {
                    ?>
                    <div class="row">
                        <div class="alert alert-danger" role="alert">
                            ¡No se puede elminar el registro!
                        </div>
                    </div>
                    <?php
                }else{
                    ?>
                    <div class="row">
                        <div class="alert alert-success" role="alert">
                            ¡Se eliminó correctamente!
                        </div>
                    </div>
                    <?php
                }
            }
            ?>
            <div class="row">
                <div class="col-10">
                    <h3>Instancias</h3>
                </div>
                <div class="col text-right">
                    <button class="btn btn-success" type="button" data-toggle="modal" data-target="#instancia"><i class="fa fa-plus"></i></button>
                </div>
            </div>

            <div class="card-group">
                <?php
                foreach ($instancias as $ins){
                ?>

                    <div class="card">
                        <div class="card-body">
                            <div class="card-title">
                                &nbsp;
                            </div>
                            <div class="card-text">
                                <h5><?php echo $ins->t_InsNombre;?></h5>
                            </div>
                            <div class="card-footer">
                                <button class="btn btn-primary" data-toggle="modal" data-target="#mod_instancia<?php echo $ins->t_InsCod;?>"><i class="fa fa-edit"></i></button>
                            </div>
                        </div>
                    </div>

                    <!--Modificar instancia Modal -->
                    <div class="modal fade" id="mod_instancia<?php echo $ins->t_InsCod;?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <form action="?c=instancia&a=crud" method="post">
                            <input type="hidden" name="id" value="<?php echo $ins->t_InsCod;?>">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Modificar Instancia</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="t_InsNombre">Nombre de instancia</label>
                                            <input type="text" class="form-control" name="t_InsNombre" id="t_InsNombre" value="<?php echo $ins->t_InsNombre;?>">
                                        </div>
                                        <div class="form-group">
                                            <label for="t_InsDescripcion">Descripción</label>
                                            <input type="text" class="form-control" name="t_InsDescripcion" id="t_InsDescripcion" value="<?php echo $ins->t_InsDescripcion;?>">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        <button type="submit" class="btn btn-warning">Modificar</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                <?php }?>
            </div>
        </div>
    </div>

    <!--Nueva instancia Modal -->
    <div class="modal fade" id="instancia" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form action="?c=instancia&a=crud" method="post">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Registrar Instancia</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="t_InsNombre">Nombre de instancia</label>
                            <input type="text" class="form-control" name="t_InsNombre" id="t_InsNombre" placeholder="Nombre">
                        </div>
                        <div class="form-group">
                            <label for="t_InsDescripcion">Descripción</label>
                            <input type="text" class="form-control" name="t_InsDescripcion" id="t_InsDescripcion" placeholder="Descripción">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Guardar</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <!--materias-->
    <div class="row mt-4">
        <div class="col-md-12">

            <div class="row">
                <div class="col-10">
                    <h3>Materias</h3>
                </div>
                <div class="col text-right">
                    <button class="btn btn-success" type="button" data-toggle="modal" data-target="#materia"><i class="fa fa-plus"></i></button>
                </div>
            </div>

            <div class="card-group">

                <div class="card">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">DESCRIPCION</th>
                            <th scope="col">&nbsp;</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        foreach ($materias as $mate){
                        ?>
                        <tr>
                            <td><?php echo $mate->t_MateDescripcion;?></td>
                            <td>
                                <button class="btn btn-primary" data-toggle="modal" data-target="#mod_materia<?php echo $mate->t_MateCod;?>"><i class="fa fa-edit"></i></button>
                                <!--                                <a href="?c=materia&a=eliminar&id=--><?php //echo $mate->t_MateCod;?><!--" class="btn btn-danger"><i class="fa fa-trash"></i></a>-->
                            </td>
                        </tr>
                            <!--Modificar materia Modal -->
                            <div class="modal fade" id="mod_materia<?php echo $mate->t_MateCod;?>" tabindex="-1" role="dialog" aria-hidden="true">
                                <form action="?c=materia&a=crud" method="post">
                                    <input type="hidden" name="id" value="<?php echo $mate->t_MateCod;?>">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Modificar Materia</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label for="t_MateDescripcion">Nombre de materia</label>
                                                    <input type="text" class="form-control" name="t_MateDescripcion" id="t_MateDescripcion" value="<?php echo $mate->t_MateDescripcion;?>">
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                <button type="submit" class="btn btn-warning">Modificar</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <?php
                        }
                        ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!--Nueva materia Modal -->
    <div class="modal fade" id="materia" tabindex="-1" role="dialog" aria-hidden="true">
        <form action="?c=materia&a=crud" method="post">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Registrar Materia</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="t_MateDescripcion">Nombre materia</label>
                            <input type="text" name="t_MateDescripcion" class="form-control" id="t_MateDescripcion" placeholder="Nombre de materia">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Guardar</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <!--modelos-->
    <div class="row mt-4">
        <div class="col-md-12">
            <div class="row">
                <div class="col-10">
                    <h3>Modelos</h3>
                </div>
                <div class="col text-right">
                    <button class="btn btn-success" type="button" data-toggle="modal" data-target="#modelo"><i class="fa fa-plus"></i></button>
                </div>
            </div>

            <div class="card-group">
                <?php
                foreach ($modelos as $model){
                    ?>
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title">
                                &nbsp;
                            </div>
                            <div class="card-text">
                                <h5 class="card-title"><?php echo $model->t_title;?></h5>
                            </div>
                            <div class="card-footer">
                                <a href="?c=modelo&a=editar&idmodelo=<?php echo $model->idmodelo;?>" class="btn btn-primary"><i class="fa fa-edit"></i></a>
                                <!--                                    <a href="?c=modelo&a=eliminar&id=--><?php //echo $model->idmodelo;?><!--" class="btn btn-danger"><i class="fa fa-trash"></i></a>-->
                            </div>
                        </div>
                    </div>
                    <?php
                }
                ?>
            </div>
        </div>
    </div>

    <!--Nueva modelo Modal -->
    <div class="modal fade" id="modelo" tabindex="-1" role="dialog" aria-hidden="true">
        <form action="?c=modelo&a=crud" method="post">
            <input type="hidden" name="idt_usuario" value="<?php echo $_SESSION['user_id'];?>">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Registrar Modelo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="t_title">Nombre Modelo</label>
                            <input type="text" class="form-control" name="t_title" id="t_title" placeholder="Nombre del modelo">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Guardar</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

</div>
