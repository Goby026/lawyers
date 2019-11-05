<?php
if (isset($modelo)) {
    ?>
    <div class="container mt-4">
        <form action="?c=modelo&a=crud" method="post">
            <input type="hidden" name="idt_usuario" value="<?php echo $_SESSION['user_id'];?>">
            <input type="hidden" name="idmodelo" value="<?php echo $modelo->idmodelo;?>">
            <div class="row">
                <div class="col-md-8 offset-2">
                    <label for="t_title">Título</label>
                    <input type="text" name="t_title" class="form-control" value="<?php echo $modelo->t_title; ?>">
                    <br>
                    <textarea name="body" rows="30">
                        <?php echo $modelo->body; ?>
                    </textarea>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-4 offset-4">
                    <button type="submit" class="btn btn-primary btn-block">Guardar</button>
                </div>
            </div>
        </form>
    </div>

    <?php
}
?>
