function recargar() {
    location.reload();
}

function addTags() {

    const screenSize = window.matchMedia("(max-width: 992px)");
    const div = document.getElementById("spanName");

     if (screenSize.matches) {
        div.style.display = "none";
    }else{
        div.style.display = "flex";
    }

}

function ajustarEstilos() {
    
    var alturaPantalla = window.innerHeight;
    var contenidoElement = document.querySelector(".main");

    /*console.log(contenidoElement);*/
    /*console.log("La altura de la pantalla es: " + alturaPantalla + "px");*/
        
    if (alturaPantalla >= 700) {
        contenidoElement.style.height = "auto";
    } else {
        contenidoElement.style.height = "100%";
    }
    
}

const ctx = document.getElementById("alumnos");
const names = ["oscar", "oswaldo", "juan"];
const ages = [23, 23, 21];

const myChart = new Chart(ctx, {
    type: "bar",
    data: {
        labels: names,
        datasets: [
            {
                label: "Edad",
                data: ages,
                backgroundColor: [
                    "rgba(255,99,132,0.5)",
                    "rgba(54,162,235,0.5)",
                    "rgba(255,206,86,0.5)",
                ],
                borderColor: [
                    "rgba(255,99,132,1)",
                    "rgba(54,162,235,1)",
                    "rgba(75,192,192,1)",
                ],
                borderWidth: 1.5,
                color: "#fff",
            },
        ],
    },
});

const ctx1 = document.getElementById("docentes");
const names1 = ["oscar", "oswaldo", "juan"];
const ages1 = [23, 23, 21];

const myChart1 = new Chart(ctx1, {
    type: "line",
    data: {
        labels: names1,
        datasets: [
            {
                label: "Edad",
                data: ages1,
                backgroundColor: [
                    "rgba(255,99,132,0.5)",
                    "rgba(54,162,235,0.5)",
                    "rgba(255,206,86,0.5)",
                ],
                borderColor: [
                    "rgba(255,99,132,1)",
                    "rgba(54,162,235,1)",
                    "rgba(75,192,192,1)",
                ],
                borderWidth: 1.5,
                color: "#fff",
            },
        ],
    },
});

const ctx2 = document.getElementById("pagos");
const names2 = ["oscar", "oswaldo", "juan"];
const ages2 = [23, 23, 21];

const myChart2 = new Chart(ctx2, {
    type: "bar",
    data: {
        labels: names2,
        datasets: [
            {
                label: "Edad",
                data: ages2,
                backgroundColor: [
                    "rgba(255,99,132,0.5)",
                    "rgba(54,162,235,0.5)",
                    "rgba(255,206,86,0.5)",
                ],
                borderColor: [
                    "rgba(255,99,132,1)",
                    "rgba(54,162,235,1)",
                    "rgba(75,192,192,1)",
                ],
                borderWidth: 1.5,
                color: "#fff",
            },
        ],
    },
});



function cerrarSesion() {
    history.pushState(null, null, location.href);
    window.onpopstate = function () {
        history.go(1);
    };
    window.location.href = "login.jsp";
}



window.addEventListener("resize", recargar);
window.onload = addTags;
window.addEventListener("resize", recargar);
window.addEventListener('load', ajustarEstilos);
window.addEventListener('resize', ajustarEstilos);


