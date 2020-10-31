<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Sistema de Registro de Materias</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">   
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="wrapper d-flex align-items-stretch">
            <nav id="sidebar">
                <div class="custom-menu">
                    <button type="button" id="sidebarCollapse" class="btn btn-info">=</button>
                </div>
                <div class="img bg-wrap text-center py-4" style="background-image: url(images/fondo.jpg);">
                    <div class="user-logo">
                        <div class="img" style="background-image: url(images/bg.jpg);"></div>
                        <h3>Administrador</h3>
                    </div>
                </div>
                <ul class="list-unstyled components mb-5">
                    <li class="active"><a href="/MVC_JAVA?accion=Inicio" onclick="abrirIni(event)"><span class="fa fa-home mr-3"></span>INICIO</a></li>
                    <li><a href="#accesoSubmenu" data-toggle="collapse" aria-expanded="false"><span class="fa fa-caret-down mr-3"></span>  ACCESO</a>
                        <ul style="background-color: teal" class="collapse list-unstyled" id="accesoSubmenu">
                            <li><a href="/MVC_JAVA?accion=listarAdm" onclick="abrirAdm(event)"><span class="fa fa-address-card mr-3"></span>ADMINISTRADORES</a>
                            <li><a href="#"><span class="fa fa-user-circle mr-3"></span> ESTUDIANTES</a></li>
                            <li><a href="#"><span class="fas fa-sitemap mr-3"></span> ROLES</a></li>
                        </ul>
                    </li>
                    <li><a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false"><span class="fa fa-caret-down mr-3"></span>  PROCESO MATERIAS</a>
                        <ul style="background-color: teal" class="collapse list-unstyled" id="homeSubmenu">
                            <li><a href="#"><span class="fa fa-address-book mr-3"></span> MATERIAS</a></li>
                            <li><a href="#"><span class="far fa-clock mr-3"></span> HORARIOS</a></li>
                            <li><a href="#"><span class="fas fa-school mr-3"></span>AULAS</a></li>
                            <li><a href="#"><span class="fa fa-users mr-3"></span>GRUPOS</a></li>
                            <li><a href="#"><span class="fas fa-hourglass-end mr-3"></span> SEMINARIOS</a></li>
                        </ul>
                    </li>
                    <li><a href="#"><span class="fa fa-list-alt mr-3"></span>CARRERAS</a></li>
                    <li><a href="#"><span class="fa fa-chalkboard-teacher mr-3"></span>MATRÍCULAS</a></li>
                    <li><a href="#"><span class="fas fa-tasks mr-3"></span> NOTAS</a></li>
                    <li><a href="#"><span class="fa fa-sign-out-alt mr-3"></span> CERRAR SESIÓN</a></li>
                </ul>
            </nav>

            <div id="content" class="p-4 p-md-5 pt-5">
                <%if(request.getParameter("opc").equals("1")){%>
                    <%@include file="Inicio.jsp"%>
                <%}else if(request.getParameter("opc").equals("2")){%>
                    <%@include file="ListarAdm.jsp"%>
                <%}%>
            </div>

        </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/enlaces.js"></script>
    </body>
</html>
