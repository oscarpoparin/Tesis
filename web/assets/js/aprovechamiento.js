/* global Utils */

const ctx = document.getElementById("asignatura");

const myChart = new Chart(ctx, {
    type: "radar",
    data: {
        labels: [
            'asignatura1',
            'asignatura2',
            'asignatura3',
            'asignatura4',
            'asignatura5'
        ],
        datasets: [
            {
                label: 'asignatura1',
                data: [65, 89, 90, 81, 56],
                fill: true,
                backgroundColor: 'rgb(37, 180, 97, 0.2)',
                borderColor: 'rgb(37, 180, 97)',
                pointBackgroundColor: 'rgb(255, 99, 132)',
                pointBorderColor: '#fff',
                pointHoverBackgroundColor: '#fff',
                pointHoverBorderColor: 'rgb(255, 99, 132)'
            }
        ]
    }
});

const ctx1 = document.getElementById("parcial");

const myChart1 = new Chart(ctx1, {
    type: "bar",
    data: {
        labels: [
            'Parcial1',
            'Parcial2',
            'Parcial3'
        ],
        datasets: [
            {
                label: 'Semestre',
                data: [65, 89, 90],
                fill: true,
                backgroundColor: 'rgb(37, 180, 97, 0.2)',
                borderColor: 'rgb(37, 180, 97)',
                borderWidth: 1
            }
        ]
    }
});

