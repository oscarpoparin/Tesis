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
        <link rel="stylesheet" href="assets/css/style.css" />
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
    <body>
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
                            <a class="dropdown-item" href="./indexCuenta.html" onclick="myAccount('./indexCuenta.html')">mi cuenta</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="./indexConfig.html"
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
        <!--Cuerpo de la pagina-->
        <div class="main">
            <div class="container-movil container-desktop">
                <div class="cards c1">
                    <div class="card-header">
                        <h5 class="card-title">alumnos</h5>
                        <div class="icons-main">
                            <i class="bi bi-people-fill icon"></i>
                        </div>
                    </div>
                    <div class="cards-body">
                        <p class="card-text-main">1,500</p>
                        <div class="container-card-icon">
                            <i class="bi bi-arrow-up-circle-fill icon-main"></i>
                            <p class="card-text-body">10%</p>
                            <span class="span-card">Ingresos</span>
                        </div>
                    </div>
                </div>
                <div class="cards c2">
                    <div class="card-header">
                        <h5 class="card-title">alumnos</h5>
                        <div class="icons-main">
                            <i class="bi bi-people-fill icon"></i>
                        </div>
                    </div>
                    <div class="cards-body">
                        <p class="card-text-main">1,500</p>
                        <div class="container-card-icon">
                            <i class="bi bi-arrow-down-circle-fill icon-main2"></i>
                            <p class="card-text-body">5%</p>
                            <span class="span-card">Egreso</span>
                        </div>
                    </div>
                </div>
                <div class="c3">
                    <h2>Grafica Alumnos</h2>
                    <canvas id="alumnos" class="text-dark"></canvas>
                </div>
                <!--Profesores-->
                <div class="cards c4">
                    <div class="card-header">
                        <h5 class="card-title">profesores</h5>
                        <div class="icons-main">
                            <i class="bi bi-people-fill icon"></i>
                        </div>
                    </div>
                    <div class="cards-body">
                        <p class="card-text-main">1,500</p>
                        <div class="container-card-icon">
                            <i class="bi bi-arrow-up-circle-fill icon-main"></i>
                            <p class="card-text-body">10%</p>
                            <span class="span-card">Ingresos</span>
                        </div>
                    </div>
                </div>
                <!--Asistencia del dia-->
                <div class="cards c5">
                    <div class="card-header">
                        <h5 class="card-title">Asistencia del dia</h5>
                        <div class="icons-main">
                            <i class="bi bi-people-fill icon"></i>
                        </div>
                    </div>
                    <div class="cards-body">
                        <p class="card-text-main">1,500</p>
                        <div class="container-card-icon">
                            <i class="bi bi-arrow-down-circle-fill icon-main2"></i>
                            <p class="card-text-body">5%</p>
                            <span class="span-card">Asistencia</span>
                        </div>
                    </div>
                </div>
                <div class="c6">
                    <h2>Grafica Asistencia</h2>
                    <canvas id="docentes"></canvas>
                </div>
                <!--pagos-->
                <div class="cards c7">
                    <div class="card-header">
                        <h5 class="card-title">pagos</h5>
                        <div class="icons-main">
                            <i class="bi bi-people-fill icon"></i>
                        </div>
                    </div>
                    <div class="cards-body">
                        <p class="card-text-main">1,500</p>
                        <div class="container-card-icon">
                            <i class="bi bi-arrow-up-circle-fill icon-main"></i>
                            <p class="card-text-body">10%</p>
                            <span class="span-card">Ingresos</span>
                        </div>
                    </div>
                </div>
                <div class="cards c8">
                    <div class="card-header">
                        <h5 class="card-title">pagos</h5>
                        <div class="icons-main">
                            <i class="bi bi-people-fill icon"></i>
                        </div>
                    </div>
                    <div class="cards-body">
                        <p class="card-text-main">1,500</p>
                        <div class="container-card-icon">
                            <i class="bi bi-arrow-down-circle-fill icon-main2"></i>
                            <p class="card-text-body">5%</p>
                            <span class="span-card">Adeudos</span>
                        </div>
                    </div>
                </div>
                <div class="c9">
                    <h2>Grafica Pagos</h2>
                    <canvas id="pagos"></canvas>
                </div>
            </div>
            <!--FOOTER-->
            <footer>
                <p>2023 © Oscar Reyes Ponciano</p>
                <p>version 1</p>
            </footer>
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
        <script src="assets/js/script.js"></script>
    </body>
</html>
<% } else { response.sendRedirect("login.jsp"); } %>
