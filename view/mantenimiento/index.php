<div class="container-fluid">
    <div class="row titulos">
        <h3>Mantenimiento</h3>
    </div>
</div>
<div class="container maintenance">
    <div class="list_instancia">
        <h3>Instancias {{num}}</h3>
        <button type="button"><i class="fa fa-plus"></i></button>
        <div class="row">
            <div class="card" style="width: 15rem;">
                <div class="card-body">
                    <h5 class="card-title">{{ instancia.t_InsNombre }}</h5>
                    <button class="btn btn-primary"><i class="fa fa-edit"></i></button>
                    <button class="btn btn-danger"><i class="fa fa-trash"></i></button>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <div class="list_materia">
        <h3>Materias {{num}}</h3>
        <button class="btn btn-success" @click="create()"><i class="fa fa-plus"></i></button>
        <div class="row">
            <div class="card" style="width: 15rem;">
                <div class="card-body">
                    <h5 class="card-title">{{materia.t_MateDescripcion}}</h5>
                    <button class="btn btn-primary"><i class="fa fa-edit"></i></button>
                    <button class="btn btn-danger"><i class="fa fa-trash"></i></button>
                </div>
            </div>
        </div>

    </div>
    <hr>
    <div class="list_modelos">
        <h3>Modelos</h3>
        <div class="row">
            <div class="card" style="width: 15rem;">
                <div class="card-body">
                    <h5 class="card-title">Carta poder</h5>
                    <button class="btn btn-primary"><i class="fa fa-edit"></i></button>
                    <button class="btn btn-danger"><i class="fa fa-trash"></i></button>
                </div>
            </div>
            <div class="card" style="width: 15rem;">
                <div class="card-body">
                    <h5 class="card-title">Apelación</h5>
                    <button class="btn btn-primary"><i class="fa fa-edit"></i></button>
                    <button class="btn btn-danger"><i class="fa fa-trash"></i></button>
                </div>
            </div>
            <div class="card" style="width: 15rem;">
                <div class="card-body">
                    <h5 class="card-title">Constitución de empresa</h5>
                    <button class="btn btn-primary"><i class="fa fa-edit"></i></button>
                    <button class="btn btn-danger"><i class="fa fa-trash"></i></button>
                </div>
            </div>
        </div>

    </div>
    <hr>
</div>
