
<div class="container mt-4">
    <div class="row">
        <div class="col-md-12">
            <div id='calendar'></div>
        </div>
    </div>
</div>


<script>

    $(document).ready(function(){

        var misEventos = [];

        var data = $.parseJSON($.ajax({
            type: 'GET',
            url:  '?c=caso&a=getCasos',
            dataType: "json",
            async: false
        }).responseText); // This will wait until you get a response from the ajax request.

        // Now you can use data.posX, data.posY later in your code and it will work.
        // var x = data.posX;
        // var y = data.posY;
        // alert(x+" "+y);
        // alert(data.posX+" "+data.posY);

        data.forEach( data =>{
            misEventos.push({
                id: data.t_CasoCod,
                title: data.caso_titulo,
                start: data.t_CasoFech
            })
        });

        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            plugins: [ 'dayGrid', 'timeGrid', 'list' ],
            timeZone: 'UTC',
            events: misEventos
        });

        calendar.render();
    });

    // document.addEventListener('DOMContentLoaded', function() {
    //
    //     var misEventos = [];
    //
    //
    //
    //     $.ajax({
    //         type: 'GET',
    //         dataType: "json",
    //         url: "?c=caso&a=getCasos",
    //         success: function (response) {
    //             response.forEach( data =>{
    //                 misEventos.push({
    //                     id: data.t_CasoCod,
    //                     title: data.caso_titulo,
    //                     start: data.t_CasoFech
    //                 })
    //             });
    //
    //
    //         }
    //     });
    //
    // });


</script>
