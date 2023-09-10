/* global Utils */

const ctx = document.getElementById("calificaciones");

const myChart = new Chart(ctx, {
    //type: "bar",
    data: {
        labels: [
            'Alumnos'
        ],
        datasets: [
            {
                type: 'bar',
                label: 'Alumno 1',
                data: [10],
                backgroundColor: [
                    'rgb(37, 180, 97, 0.5)'
                    
                ],
                borderColor: [
                    'rgb(37, 180, 97, 0.2)'
                ],
                borderWidth: 1
            },{
                type: 'bar',
                label: 'Alumno 2',
                data: [8.4],
                backgroundColor: [
                    
                    'rgba(255, 99, 132, 0.5)'
                ],
                borderColor: [
                    
                    'rgba(255, 99, 132, 0.2)'
                ],
                borderWidth: 1
            }
        ],
    },
});

const ctx1 = document.getElementById("asistencia");

const mixedChart = new Chart(ctx1, {
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
        datasets: [{
                type: 'line',
                label: 'Alumno 1',
                data: [25, 10, 17, 18, 22, 25, 25, 24, 20, 25, 25, 25],
                fill: false,
                borderColor: 'rgb(54, 162, 235)'
            }, {
                type: 'line',
                label: 'Alumno 2',
                data: [25, 25, 25, 24, 24, 23, 25, 24, 25, 25, 25, 25],
                fill: false,
                borderColor: 'rgb(54, 162, 235)'
            }],
    },
});