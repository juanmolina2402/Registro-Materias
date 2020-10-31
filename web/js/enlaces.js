function abrirIni(event) {
    event.preventDefault();
    $.get("/MVC_JAVA/Controlador?accion=Inicio", function (data) {
        $("#content").html(data);
    });
}
function abrirAdm(event) {
    event.preventDefault();
    $.get("/MVC_JAVA/Controlador?accion=listarAdm", function (data) {
        $("#content").html(data);
    });
}

