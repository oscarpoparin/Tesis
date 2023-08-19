<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tesis</title>
        <link rel="stylesheet" href="assets/css/login.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    </head>
    <body>
        <div id="container1" class="container-form">
            <form action="srvUsuario?accion=verificar" method="post">
                <h2>Iniciar sesión</h2>
                <div class="inputBox">
                    <input type="email" name="username" id="userinput" required />
                    <span id="user">Usuario</span>
                    <i class="bi bi-people-fill key"></i>
                </div>
                <div class="inputBox">
                    <input type="password" name="password" id="input" required />
                    <span id="pass">Contraseña</span>
                    <i class="bi bi-key-fill key"></i>
                </div>
                <input type="submit" value="Ingresar" />
            </form>
            <div class="link">
                <a onclick="toggleContainers();" class="enlace">
                    ¿Olvidaste tu contraseña?
                </a>
            </div>
        </div>
        <div id="container2" class="forgout hidden">
            <h3>Recuperación de Contraseña</h3>
            <form>
                <div class="inputBox">
                    <input type="email" name="email" id="email" required />
                    <span id="email_forgot">correo</span>
                    <i class="bi bi-envelope key"></i>
                </div>
                <input type="submit" value="Enviar Correo" />
            </form>
            <div class="p">
                <a onclick="toggleContainers();">Volver al Inicio de Sesión</a>
            </div>
        </div>
        <script type="text/javascript" src="assets/js/login.js"></script>
    </body>
</html>
