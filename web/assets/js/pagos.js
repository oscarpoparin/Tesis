/* global Utils */

const ctx = document.getElementById("estatus");

const myChart3 = new Chart(ctx, {
    type: "line",
    data: {
        labels: [
            'Enero',
            'Febrero',
            'Marzo',
            'Abril',
            'Mayo',
            'Junio',
            'Julio',
            'Agosto',
            'Septiembre',
            'Octubre',
            'Noviembre',
            'Diciembre'
        ],
        datasets: [
            {
                type: 'line',
                label: 'Pagado',
                data: [50, 50, 50, 50],
                fill: false,
                borderColor: 'rgb(37, 180, 97)',
                backgroundColor:'rgb(37, 180, 97)'
            }, {
                type: 'line',
                label: 'Pagado a destiempo',
                data: [52, 40, 50, 50],
                fill: false,
                borderColor: 'rgb(255, 205, 86)',
                backgroundColor: 'rgb(255, 205, 86)'
            }, {
                type: 'line',
                label: 'Adeudo',
                data: [5, 20, 50, 50],
                fill: false,
                borderColor: 'rgb(255, 99, 132)',
                backgroundColor: 'rgb(255, 99, 132)'
            }
        ],
    },
});

