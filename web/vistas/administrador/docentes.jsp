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
        <link rel="stylesheet" href="assets/css/docentes.css" />
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
                        <a href="srvRedireccionar?accion=asignatura" onclick="subjectPage('srvRedireccionar?accion=asignatura')">asignaturas</a>
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
            <div class="row">
                <div class="col-6">
                    <div class="p-2">
                        <div class="d-flex flex-column">
                            <div class="accordion" id="accordionPanelsStayOpenExample">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                                        <button class="accordion-button text-light text-uppercase" type="button" style="background: #343a40;" data-bs-toggle="collapse"
                                                data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true"
                                                aria-controls="panelsStayOpen-collapseOne">
                                            Registrar Docente
                                        </button>
                                    </h2>
                                    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show"
                                         aria-labelledby="panelsStayOpen-headingOne">
                                        <div class="accordion-body text-light" style="background: #343a40;">
                                            <form class="row g-3">
                                                <div class="container p-2">
                                                    <div class="row p-1">
                                                        <div class="col-md-4">
                                                            <label for="validationCustom01" class="form-label text-light text-capitalize fs-6">nombre</label>
                                                            <input type="text" class="form-control" id="addNombreDocente" value="" required>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label for="validationCustom02" class="form-label text-light text-capitalize fs-6">apellido paterno</label>
                                                            <input type="text" class="form-control" id="addApPaternoDocente" value="" required>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label for="validationCustom02" class="form-label text-light text-capitalize fs-6">apellido materno</label>
                                                            <input type="text" class="form-control" id="addApMaternoDocente" value="" required>
                                                        </div>
                                                    </div>
                                                    <div class="row p-1">
                                                        <div class="col-md-6">
                                                            <label for="validationCustom03" class="form-label text-light text-capitalize fs-6">fecha de nacimiento</label>
                                                            <input type="date" class="form-control" id="addNacimientoDocente" required>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="validationCustom04" class="form-label text-light text-uppercase fs-6">curp</label>
                                                            <input type="text" class="form-control" id="addCurpDocente" required>
                                                        </div>
                                                    </div>
                                                    <div class="row p-1">
                                                        <div class="col-md-4">
                                                            <label for="validationCustom04" class="form-label text-light text-uppercase fs-6">rfc</label>
                                                            <input type="text" class="form-control" id="addRfcDocente" required>
                                                        </div>
                                                        <div class="col-md-5">
                                                            <label for="validationCustom04" class="form-label text-light text-capitalize fs-6">correo</label>
                                                            <input type="email" class="form-control" id="addEmailDocente" required>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <label for="validationCustom04" class="form-label text-light text-capitalize fs-6">telefono</label>
                                                            <input type="tel" class="form-control" id="addPhoneDocente" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <h5 class="text-light text-capitalize fs-6">datos del domicilio</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="container">
                                                    <div class="row p-1">
                                                        <div class="col-md-4">
                                                            <label for="validationCustom01" class="form-label text-light text-capitalize fs-6">municipio</label>
                                                            <input type="text" class="form-control" id="addMunicipio" value="" required>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label for="validationCustom01" class="form-label text-light text-capitalize fs-6">c.p</label>
                                                            <input type="text" class="form-control" id="addCp" value="" required>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label for="validationCustom01" class="form-label text-light text-capitalize fs-6">colonia</label>
                                                            <input type="text" class="form-control" id="addColonia" value="" required>
                                                        </div>
                                                    </div>
                                                    <div class="row p-1">
                                                        <div class="col-md-4">
                                                            <label for="validationCustom01" class="form-label text-light text-capitalize fs-6">calle</label>
                                                            <input type="text" class="form-control" id="addCalle" value="" required>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label for="validationCustom01" class="form-label text-light text-capitalize fs-6">num exterior</label>
                                                            <input type="text" class="form-control" id="addNumExterior" value="" required>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label for="validationCustom01" class="form-label text-light text-capitalize fs-6">num interior</label>
                                                            <input type="text" class="form-control" id="addNumInterior" value="" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                                    <button class="btn btn-danger" type="submit" id="addDocente">registrar</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                                        <button class="accordion-button collapsed text-light text-uppercase" type="button" style="background: #343a40;"
                                                data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false"
                                                aria-controls="panelsStayOpen-collapseTwo">
                                            Asignar Materia
                                        </button>
                                    </h2>
                                    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse"
                                         aria-labelledby="panelsStayOpen-headingTwo">
                                        <div class="accordion-body text-light" style="background: #343a40;">
                                            <form class="row g-3 p-2" novalidate>
                                                <div class="container p-2">
                                                    <div class="row p-1">
                                                        <div class="row p-1">
                                                            <div class="col-md-4">
                                                                <select class="form-select text-capitalize fs-6" aria-label="Default select example">
                                                                    <option selected>docente</option>
                                                                    <option value="1">One</option>
                                                                    <option value="2">Two</option>
                                                                    <option value="3">Three</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <select class="form-select text-capitalize fs-6" aria-label="Default select example">
                                                                    <option selected>grado</option>
                                                                    <option value="1">One</option>
                                                                    <option value="2">Two</option>
                                                                    <option value="3">Three</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <select class="form-select text-capitalize fs-6" aria-label="Default select example">
                                                                    <option selected>turno</option>
                                                                    <option value="1">One</option>
                                                                    <option value="2">Two</option>
                                                                    <option value="3">Three</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row p-2 mt-2">
                                                            <div class="col-md-6">
                                                                <select class="form-select text-capitalize fs-6" aria-label="Default select example">
                                                                    <option selected>asignatura</option>
                                                                    <option value="1">One</option>
                                                                    <option value="2">Two</option>
                                                                    <option value="3">Three</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-4 mt-2">
                                                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                                                    <button class="btn btn-danger" type="submit" id="asignar">asignar</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="p-1">
                        <div class="container p-2">
                            <div class="row">
                                <div class="col">
                                    <div class="d-flex justify-content-end p-2">
                                        <button type="button" class="btn btn-danger">
                                            <i class="bi bi-search icon me-1"></i> Buscar
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <input type="text" class="form-control" id="searchNombre" value="" placeholder="NombreAlumno">
                                </div>
                                <div class="col-6">
                                    <select class="form-select text-capitalize fs-6" aria-label="Default select example">
                                        <option selected>grado</option>
                                        <option value="1">One</option>
                                        <option value="2">Two</option>
                                        <option value="3">Three</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-6">
                                    <select class="form-select text-capitalize fs-6" aria-label="Default select example">
                                        <option selected>turno</option>
                                        <option value="1">One</option>
                                        <option value="2">Two</option>
                                        <option value="3">Three</option>
                                    </select>
                                </div>
                                <div class="col-6">
                                    <select class="form-select text-capitalize fs-6" aria-label="Default select example">
                                        <option selected>asignatura</option>
                                        <option value="1">One</option>
                                        <option value="2">Two</option>
                                        <option value="3">Three</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="container mt-4">
                            <div class="table-responsive t-h-max">
                                <table class="table table-dark table-hover mb-0 border-secondary">
                                    <thead>
                                        <tr class="text-uppercase">
                                            <th>nombre</th>
                                            <th>grado</th>
                                            <th>turno</th>
                                            <th>asignaturas</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody class="bg text-capitalize">
                                        <tr>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">nombre completo</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">grado</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">turno</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">matematicas</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-items-center">
                                                        <button type="submit" class="btn btn-dark btn-sm">
                                                            <i class="bi bi-trash3-fill fs-6"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">nombre completo</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">grado</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">turno</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">matematicas</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-items-center">
                                                        <button type="submit" class="btn btn-dark btn-sm">
                                                            <i class="bi bi-trash3-fill fs-6"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">nombre completo</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">grado</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">turno</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">matematicas</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-items-center">
                                                        <button type="submit" class="btn btn-dark btn-sm">
                                                            <i class="bi bi-trash3-fill fs-6"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">nombre completo</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">grado</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">turno</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">matematicas</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-items-center">
                                                        <button type="submit" class="btn btn-dark btn-sm">
                                                            <i class="bi bi-trash3-fill fs-6"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">nombre completo</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">grado</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">turno</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">matematicas</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-items-center">
                                                        <button type="submit" class="btn btn-dark btn-sm">
                                                            <i class="bi bi-trash3-fill fs-6"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">nombre completo</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">grado</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">turno</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">matematicas</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-items-center">
                                                        <button type="submit" class="btn btn-dark btn-sm">
                                                            <i class="bi bi-trash3-fill fs-6"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">nombre completo</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">grado</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">turno</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">matematicas</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-items-center">
                                                        <button type="submit" class="btn btn-dark btn-sm">
                                                            <i class="bi bi-trash3-fill fs-6"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">nombre completo</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">grado</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">turno</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">matematicas</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-items-center">
                                                        <button type="submit" class="btn btn-dark btn-sm">
                                                            <i class="bi bi-trash3-fill fs-6"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">nombre completo</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">grado</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">turno</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-content-center justify-content-center">
                                                        <h5 class="text-uppercase fs-6">matematicas</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <div class="d-flex align-items-center">
                                                        <button type="submit" class="btn btn-dark btn-sm">
                                                            <i class="bi bi-trash3-fill fs-6"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
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
        <script src="assets/js/tooltippy.js"></script>
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

                                  elementoEspecifico1.style.background = '#3a444e';
                                  elementoEspecifico2.style.background = '#3a444e';
                                  elementoEspecifico3.style.background = '#343a40';
                                  elementoEspecifico4.style.background = '#3a444e';
                                  elementoEspecifico5.style.background = '#3a444e';
                                  elementoEspecifico6.style.background = '#3a444e';
                                  elementoEspecifico7.style.background = '#3a444e';

                              } else if (servletPath === al) {
                                  console.log("alumnos");
                              } else if (servletPath === p) {
                                  console.log("pagos");
                              } else if (servletPath === ap) {
                                  console.log("aprovechamiento");
                              } else if (servletPath === c) {
                                  console.log("calendario");
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