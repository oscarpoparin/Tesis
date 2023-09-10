function cerrarSesion() {
    history.pushState(null, null, location.href);
    window.onpopstate = function () {
        history.go(1);
    };
    window.location.href = "login.jsp";
}