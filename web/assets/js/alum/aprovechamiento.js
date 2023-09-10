const ctx3 = document.getElementById("asistencia_al");
const ctx4 = document.getElementById("semestre_al");
const ctx5 = document.getElementById("calificaciones_al");

const myChart = new Chart(ctx3, {
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
                label: 'Alumno',
                data: [25, 10, 17, 18, 22, 25, 25, 24, 20, 25, 25, 25],
                fill: false,
                borderColor: 'rgb(54, 162, 235)'
            }
        ],
    },
});

const myChart1 = new Chart(ctx4, {
    data: {
        labels: ['Parcial 1', 'Parcial 2', 'Parcial 3'],
        datasets: [
            {
                type: 'bar',
                label: 'Semestre',
                data: [10, 9, 7],
                backgroundColor: [
                    'rgb(37, 180, 97, 0.5)',
                    'rgba(255, 159, 64, 0.5)',
                    'rgba(54, 162, 235, 0.5)'
                ],
                borderColor: [
                    'rgb(37, 180, 97, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(54, 162, 235, 0.2)'
                ],
                borderWidth: 1
            }
        ],
    },
});

const myChart2 = new Chart(ctx5, {
    data: {
        labels: [
            'Asignatura',
            'Asignatura',
            'Asignatura',
            'Asignatura',
            'Asignatura'
        ],
        datasets: [
            {
                type: 'radar',
                label: 'Calificaciones',
                data: [10, 7, 8, 6, 10],
                fill: true,
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                borderColor: 'rgb(255, 99, 132)',
                pointBackgroundColor: 'rgb(255, 99, 132)',
                pointBorderColor: '#fff',
                pointHoverBackgroundColor: '#fff',
                pointHoverBorderColor: 'rgb(255, 99, 132)'
            }
        ],
    },
});