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
        <div class="navbar-top" id="navbar-top">
            <div class="logo-mobile">
                <img class="logo-mobile-img" src="assets/img/logo-transparent.png" alt="logotipo" />
                <button class="btn-toggle" data-bs-toggle="offcanvas" data-bs-target="#staticBackdrop"
                        aria-controls="staticBackdrop">
                    <i class="bi bi-list icon btn-icon"></i>
                </button>
                <div class="offcanvas offcanvas-start bg-dark" data-bs-backdrop="static" tabindex="-1" id="staticBackdrop"
                     aria-labelledby="staticBackdropLabel">
                    <div class="offcanvas-header nav-top">
                        <h5 class="offcanvas-title" id="staticBackdropLabel">Menu</h5>
                        <button type="button" class="btn-close bg-light" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body">
                        <div class="nav-top-list">
                            <ul class="list">
                                <li class="li">
                                    <span class="icons">
                                        <i class="bi bi-house-door-fill icon a-icon" onclick="dashboardPage('srvRedireccionar?accion=login')"></i>
                                        <a href="srvRedireccionar?accion=login">Dashboards</a>
                                    </span>
                                </li>
                                <li class="li">
                                    <span class="icons" onclick="subjectPage('srvRedireccionar?accion=asignatura')">
                                        <i class="bi bi-book-half icon a-icon"></i>
                                        <a href="srvRedireccionar?accion=asignatura">asignaturas</a>
                                    </span>
                                </li>
                                <li class="li">
                                    <span class="icons" onclick="teacherPage('srvRedireccionar?accion=docentes')">
                                        <i class="bi bi-mortarboard-fill icon a-icon"></i>
                                        <a href="srvRedireccionar?accion=docentes">docentes</a>
                                    </span>
                                </li>
                                <li class="li">
                                    <span class="icons" onclick="studentsPage('srvRedireccionar?accion=alumnos')">
                                        <i class="bi bi-people-fill icon a-icon"></i>
                                        <a href="srvRedireccionar?accion=alumnos">alumnos</a>
                                    </span>
                                </li>
                                <li class="li">
                                    <span class="icons" onclick="paymentPage('srvRedireccionar?accion=pagos')">
                                        <i class="bi bi-cash-coin icon a-icon"></i>
                                        <a href="srvRedireccionar?accion=pagos">pagos</a>
                                    </span>
                                </li>
                                <li class="li">
                                    <span class="icons" onclick="rendimientoPage('srvRedireccionar?accion=aprovechamiento')">
                                        <i class="bi bi-file-earmark-person-fill icon a-icon"></i>
                                        <a href="srvRedireccionar?accion=aprovechamiento">rendimiento academico</a>
                                    </span>
                                </li>
                                <li class="li">
                                    <span class="icons" onclick="calendarPage('srvRedireccionar?accion=calendario')">
                                        <i class="bi bi-calendar-date icon a-icon"></i>
                                        <a href="srvRedireccionar?accion=calendario">calendario</a>
                                    </span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="search">
                <form action="#" method="get">
                    <input type="search" name="search" id="search" class="input-search" placeholder="Buscador" />
                    <button class="btn-search">
                        <i class="bi bi-search icon icon-search"></i>
                    </button>
                </form>
            </div>
            <div class="profile">
                <div class="img dropdown">
                    <a href="#" class="avatar dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="assets/img/usuario.png" class="img-profile" />
                    </a>
                    <span class="name" id="spanName">
                        <h2 id="name">${usuario.nombreCompleto}</h2>
                        <h3 id="cargo">${usuario.rol.descripcion}</h3>
                    </span>
                    <ul class="dropdown-menu listConfig">
                        <li>
                            <a class="dropdown-item disabled" href="./indexCuenta.html" onclick="myAccount('./indexCuenta.html')">mi cuenta</a>
                        </li>
                        <li>
                            <a class="dropdown-item disabled" href="./indexConfig.html"
                               onclick="settings('./indexConfig.html')">configuración</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="srvUsuario?accion=cerrar" onclick="cerrarSesion()">salir</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="navbar-left">
            <ul id="mi-lista" class="list">
                <li class="li">
                    <span class="icons" id="dashboard" data-tippy-content="DASHBOARD" tabindex="0" data-tippy-placement="right"
                          onclick="dashboardPage('srvRedireccionar?accion=login')">
                        <i class="bi bi-house-door-fill icon a-icon"></i>
                        <a href="srvRedireccionar?accion=login">Dashboards</a>
                    </span>
                </li>
                <li class="li">
                    <span class="icons" id="subjects" data-tippy-content="ASIGNATURAS" tabindex="0" data-tippy-placement="right"
                          onclick="subjectPage('srvRedireccionar?accion=asignatura')">
                        <i class="bi bi-book-half icon a-icon"></i>
                        <a id="cambiarEstilos" href="#" onclick="subjectPage('srvRedireccionar?accion=asignatura')">asignaturas</a>
                    </span>
                </li>
                <li class="li">
                    <span class="icons" id="teachers" data-tippy-content="DOCENTES" tabindex="0" data-tippy-placement="right"
                          onclick="teacherPage('srvRedireccionar?accion=docentes')">
                        <i class="bi bi-mortarboard-fill icon a-icon"></i>
                        <a href="srvRedireccionar?accion=docentes">docentes</a>
                    </span>
                </li>
                <li class="li">
                    <span class="icons" id="students" data-tippy-content="ALUMNOS" tabindex="0" data-tippy-placement="right"
                          onclick="studentsPage('srvRedireccionar?accion=alumnos')">
                        <i class="bi bi-people-fill icon a-icon"></i>
                        <a href="srvRedireccionar?accion=alumnos">alumnos</a>
                    </span>
                </li>
                <li class="li">
                    <span class="icons" id="payment" data-tippy-content="PAGOS" tabindex="0" data-tippy-placement="right"
                          onclick="paymentPage('srvRedireccionar?accion=pagos')">
                        <i class="bi bi-cash-coin icon a-icon"></i>
                        <a href="srvRedireccionar?accion=pagos">pagos</a>
                    </span>
                </li>
                <li class="li">
                    <span class="icons" id="rendimiento" data-tippy-content="APROVECHAMIENTO ACADEMICO" tabindex="0"
                          data-tippy-placement="right" onclick="rendimientoPage('srvRedireccionar?accion=aprovechamiento')">
                        <i class="bi bi-file-earmark-person-fill icon a-icon"></i>
                        <a href="srvRedireccionar?accion=aprovechamiento">rendimiento academico</a>
                    </span>
                </li>
                <li class="li">
                    <span class="icons" id="calendar" data-tippy-content="CALENDARIO" tabindex="0" data-tippy-placement="right"
                          onclick="calendarPage('srvRedireccionar?accion=calendario')">
                        <i class="bi bi-calendar-date icon a-icon"></i>
                        <a href="srvRedireccionar?accion=calendario">calendario</a>
                    </span>
                </li>
            </ul>
        </div>
        <br>
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
<% } else { response.sendRedirect("login.jsp"); }%>
