const ctx = document.getElementById("semestre");
const ctx1 = document.getElementById("totalAsistencia");

const myChart = new Chart(ctx, {
    data: {
        labels: ['Parcial 1', 'Parcial 2', 'Parcial 3'],
        datasets: [
            {
                type: 'bar',
                label: 'Calificaciones',
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

const myChart1 = new Chart(ctx1, {
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
                type: 'bar',
                label: 'Asistencia Mensual',
                data: [10, 9, 7, 5, 10, 9, 8, 8, 7, 10, 10, 10],
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
