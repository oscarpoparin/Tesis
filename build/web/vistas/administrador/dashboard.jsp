<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("usuario") != null) { %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Tesis</title>
        <!------------------------- ESTILOS ---------------------------------------------->
        <link rel="stylesheet" href="assets/css/navbar.css" />
        <link rel="stylesheet" href="assets/css/dashboard.css" />
        <link rel="stylesheet" href="https://unpkg.com/tippy.js@5/dist/backdrop.css" />
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous" />
    </head>
    <body style="background: #343a40;">
        <div class="container border border-dark p-2 border-opacity-10 mt-5">
            <div class="container mt-5">
                <div class="row">
                    <div class="col">
                        <div class="card-body border border-light rounded p-2">
                            <h5 class="card-title text-light text-uppercase p-3 fs-6">alumnos inscritos</h5>
                            <div class="body-card">
                                <div class="icon-card">
                                    <i class="bi bi-people-fill icon fs-5"></i>
                                </div>
                                <div class="text-card">
                                    <h3 class="text-light fs-5">${alumnosInscritos}</h3>
                                </div>
                                <div class="line-card">
                                    <hr class="line">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card-body border border-light rounded p-2">
                            <h5 class="card-title text-light text-uppercase p-3 fs-6">alumnos egresados</h5>
                            <div class="body-card">
                                <div class="icon-card">
                                    <i class="bi bi-people-fill icon fs-5"></i>
                                </div>
                                <div class="text-card">
                                    <h3 class="text-light fs-5">${alumnosEgresados}</h3>
                                </div>
                                <div class="line-card">
                                    <hr class="line">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card-body border border-light rounded p-2">
                            <h5 class="card-title text-light text-uppercase p-3 fs-6">total de docentes</h5>
                            <div class="body-card">
                                <div class="icon-card">
                                    <i class="bi bi-mortarboard-fill icon fs-5"></i>
                                </div>
                                <div class="text-card">
                                    <h3 class="text-light fs-5">${totalDocentes}</h3>
                                </div>
                                <div class="line-card">
                                    <hr class="line">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card-body border border-light rounded p-2">
                            <h5 class="card-title text-light text-uppercase p-3 fs-6">asistencia del dia</h5>
                            <div class="body-card">
                                <div class="icon-card">
                                    <i class="bi bi-person-check-fill icon fs-5"></i>
                                </div>
                                <div class="text-card">
                                    <h3 class="text-light fs-5">${asistencia}</h3>
                                </div>
                                <div class="line-card">
                                    <hr class="line">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container mt-4">
                <div class="row">
                    <div class="col border border-light rounded m-4 p-4">
                        <h2 class="text-light text-uppercase">Grafica Alumnos</h2>
                        <canvas id="alumnos" class="text-dark"></canvas>
                    </div>
                    <div class="col border border-light rounded m-4 p-4">
                        <h2 class="text-light text-uppercase">Grafica Asistencia</h2>
                        <canvas id="docentes"></canvas>
                    </div>
                </div>
                <div class="row">
                    <div class="col border border-light rounded m-4 p-4">
                        <h2 class="text-light text-uppercase">Grafica Pagos</h2>
                        <canvas id="pagos"></canvas>
                    </div>
                    <div class="col"></div>
                </div>
            </div>
        </div>
        <!----------------------------scripts----------------------------------------------->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://unpkg.com/popper.js@1"></script>
        <script src="https://unpkg.com/tippy.js@5/dist/tippy-bundle.iife.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.3.0/chart.min.js"
                integrity="sha512-mlz/Fs1VtBou2TrUkGzX4VoGvybkD9nkeXWJm3rle0DPHssYYx4j+8kIS15T78ttGfmOjH0lLaBXGcShaVkdkg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="assets/js/tooltippy.js"></script>
        <script src="assets/js/index.js"></script>
        <script src="assets/js/sesion.js"></script>
    </body>
</html>
<% } else {
            response.sendRedirect("login.jsp");
        }%>