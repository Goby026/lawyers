<main>
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-4">LISTA DE PAISES PARTICIPANTES</h1>
            <p class="lead">Juegos panamericanos Lima 2019</p>
        </div>
    </div>

    <div class="container">
        <ul class="list-group">
            <?php
            foreach($paises as $row):
            ?>
                <li class="list-group-item"><?php echo $row->NombrePais; ?></li>
            <?php endforeach; ?>
        </ul>
    </div>
</main>
