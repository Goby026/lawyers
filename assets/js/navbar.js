$(document).ready(function () {
    //console.log('HOLA JQUERY');
    $.ajax({
        type: 'POST',
        dataType: "json",
        url: "?c=index&a=cargarMenu",
        //data: datos,
        success: function (response) {
            // console.log(response.length);
            $("#contador").text(response.length);
            for (var k in response) {
                // console.log(k, response[k]);
                // $("#notificaciones").text(response[k].descripcion);
                $("#notificaciones").append("<a class='dropdown-item' href='?c=notificacion&a=index' id='notificaciones'>" + response[k].icono + " " + response[k].descripcion + "</a>");
            }
        }
    });
});
