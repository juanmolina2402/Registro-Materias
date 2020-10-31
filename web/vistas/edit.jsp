
<%@page import="Modelo.administrador"%>
<%@page import="ModeloDAO.administradorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>EDITAR</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
            <%
              administradorDAO dao= new administradorDAO();
              int id=Integer.parseInt((String)request.getAttribute("idper"));
              administrador adm=(administrador)dao.list(id);
            %>
            <h1>Modificar Persona</h1>
            <form action="Controlador" method="post" enctype="multipart/form-data">
                Id:<br>
                <input class="form-control" type="text" name="txtid" readonly value="<%= adm.getId_administrador()%>"><br>
                Nombres:<br>
                <input class="form-control" type="text" name="txtNom" value="<%= adm.getNombres()%>"><br>
                Apellidos: <br>
                <input class="form-control" type="text" name="txtApe" value="<%= adm.getApellidos()%>"><br>
                Telefono: <br/>
                <input class="form-control" type="text" name="txtTel" value="<%= adm.getTelefono()%>"/><br/>
                Email: <br/>
                <input class="form-control" type="text" name="txtEma" value="<%= adm.getEmail()%>"/><br/>
                Direccion: <br/>
                <input class="form-control" type="text" name="txtDir" value="<%= adm.getDireccion()%>" /><br/>
                Sexo: <br/>
                <input class="form-control" type="text" name="txtSex" value="<%= adm.getSexo()%>"/><br/>
                Cargo: <br/>
                <input class="form-control" type="text" name="txtCar" value="<%= adm.getCargo()%>"/><br/>
                Foto:
                <input type="file" name="txtFoto">
                <img  src="ControladorIMG?id=<%= adm.getId_administrador()%>" width="100" height="100">
                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                <a href="Controlador?accion=listar">Regresar</a>
            </form>
          </div>
          
        </div>
    </body>
</html>
