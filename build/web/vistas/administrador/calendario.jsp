<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("usuario") != null) {%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Tesis</title>
        <!------------------------- ESTILOS ---------------------------------------------->
        <link rel="stylesheet" href="assets/css/navbar.css" />
        <link rel="stylesheet" href="assets/css/calendario.css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
                        <a id="enlaceRedireccionar" href="#" onclick="subjectPage('srvRedireccionar?accion=asignatura')">asignaturas</a>
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
        <br>
        <div class="container container-xl p-2 border-opacity-10 mt-5">
            <section class="ftco-section">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-6 text-center">
                            <h2 class="heading-section text-center text-light">Calendario</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="content w-100">
                                <div class="calendar-container">
                                    <div class="calendar"> 
                                        <div class="year-header"> 
                                            <span class="left-button fa fa-chevron-left" id="prev"> </span> 
                                            <span class="year" id="label"></span> 
                                            <span class="right-button fa fa-chevron-right" id="next"> </span>
                                        </div> 
                                        <table class="months-table w-100"> 
                                            <tbody>
                                                <tr class="months-row">
                                                    <td class="month">Jan</td> 
                                                    <td class="month">Feb</td> 
                                                    <td class="month">Mar</td> 
                                                    <td class="month">Apr</td> 
                                                    <td class="month">May</td> 
                                                    <td class="month">Jun</td> 
                                                    <td class="month">Jul</td>
                                                    <td class="month">Aug</td> 
                                                    <td class="month">Sep</td> 
                                                    <td class="month">Oct</td>          
                                                    <td class="month">Nov</td>
                                                    <td class="month">Dec</td>
                                                </tr>
                                            </tbody>
                                        </table> 

                                        <table class="days-table w-100"> 
                                            <td class="day">Sun</td> 
                                            <td class="day">Mon</td> 
                                            <td class="day">Tue</td> 
                                            <td class="day">Wed</td> 
                                            <td class="day">Thu</td> 
                                            <td class="day">Fri</td> 
                                            <td class="day">Sat</td>
                                        </table> 
                                        <div class="frame"> 
                                            <table class="dates-table w-100"> 
                                                <tbody class="tbody">             
                                                </tbody> 
                                            </table>
                                        </div> 
                                        <button class="button" id="add-button">Agregar Evento</button>
                                    </div>
                                </div>
                                <div class="events-container">
                                </div>
                                <div class="dialog" id="dialog">
                                    <h2 class="dialog-header"> Agregar Nuevo Evento</h2>
                                    <form class="form" id="form">
                                        <div class="form-container" align="center">
                                            <label class="form-label text-center text-light" id="valueFromMyButton" for="name">Nombre Evento</label>
                                            <input class="input" type="text" id="name" maxlength="36">                                   
                                            <input type="button" value="Cancel" class="button" id="cancel-button">
                                            <input type="button" value="OK" class="button button-white" id="ok-button">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
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
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/popper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="assets/js/sesion.js"></script>
        <script>
                              var servletPath = '<%= request.getServletPath()%>';
                              var contexto = '<%= request.getContextPath()%>';
                              var i = '/vistas/administrador/index.jsp';
                              var a = '/vistas/administrador/asignatura.jsp';
                              var d = '/vistas/administrador/docentes.jsp';
                              var al = '/vistas/administrador/alumnos.jsp';
                              var p = '/vistas/administrador/pagos.jsp';
                              var ap = '/vistas/administrador/aprovechamiento.jsp';
                              var c = '/vistas/administrador/calendario.jsp';

                              const elementoEspecifico1 = document.querySelector('#mi-lista .li:nth-child(1)');
                              const elementoEspecifico2 = document.querySelector('#mi-lista .li:nth-child(2)');
                              const elementoEspecifico3 = document.querySelector('#mi-lista .li:nth-child(3)');
                              const elementoEspecifico4 = document.querySelector('#mi-lista .li:nth-child(4)');
                              const elementoEspecifico5 = document.querySelector('#mi-lista .li:nth-child(5)');
                              const elementoEspecifico6 = document.querySelector('#mi-lista .li:nth-child(6)');
                              const elementoEspecifico7 = document.querySelector('#mi-lista .li:nth-child(7)');

                              if (servletPath === i) {
                                  console.log("index");
                              } else if (servletPath === a) {
                                  console.log("asignatura");
                              } else if (servletPath === d) {
                                  console.log("docentes");
                              } else if (servletPath === al) {
                                  console.log("alumnos");
                              } else if (servletPath === p) {
                                  console.log("pagos");
                              } else if (servletPath === ap) {
                                  console.log("aprovechamiento");
                              } else if (servletPath === c) {

                                  elementoEspecifico1.style.background = '#3a444e';
                                  elementoEspecifico2.style.background = '#3a444e';
                                  elementoEspecifico3.style.background = '#3a444e';
                                  elementoEspecifico4.style.background = '#3a444e';
                                  elementoEspecifico5.style.background = '#3a444e';
                                  elementoEspecifico6.style.background = '#3a444e';
                                  elementoEspecifico7.style.background = '#343a40';

                              } else {
                                  alert("Error");
                              }

                              const screenSize = window.matchMedia("(max-width: 992px)");
                              const div = document.getElementById("spanName");

                              if (screenSize.matches) {
                                  div.style.display = "none";
                              } else {
                                  div.style.display = "flex";
                              }
        </script>
    </body>
</html>
<% } else {
        response.sendRedirect("login.jsp");
    }%>