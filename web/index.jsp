<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/MVC_JAVA/css/index.css">
        <title>Inicia Sesión</title>
    </head>
    <body>
        <div class="wrapper">
            <div class="title">
                Inicia Sesión</div>
            <form action="#">
                <div class="field">
                    <input type="text" required>
                    <label>Codigo</label>
                </div>
                <div class="field">
                    <input type="password" required>
                    <label>Contraseña</label>
                </div>
                <div class="field">
                    <input type="submit" value="Iniciar Sesión">
                </div>
                <div class="signup-link">
                    ¿No tienes tu código? <a href="Controlador?accion=Principal">Registrarse</a></div>
            </form>
        </div>
    </body>
</html>