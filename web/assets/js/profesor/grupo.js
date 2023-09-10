const ctx = document.getElementById("califGrupal");

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