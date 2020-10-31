<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Administrador"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.AdministradorDAO"%>

<h1 style="color: darkcyan; text-align: center">ADMINISTRADORES</h1>
<button type="button" class="btn btn-success" data-toggle="modal" data-target="#mAgregar" onclick="Limpiar(event)">Agregar Nuevo</button><br><br>
<table class="table table-hover" >
    <thead style="background: darkcyan; color: white">
        <tr>
            <th class="text-center">ID</th>
            <th class="text-center">FOTOS</th>
            <th class="text-center">NOMBRES</th>
            <th class="text-center">APELLIDOS</th>
            <th class="text-center">TELÉFONO</th>
            <th class="text-center">ACCIONES</th>
        </tr>
    </thead>
    <%  AdministradorDAO dao = new AdministradorDAO();
        List<Administrador> list = dao.listar();
        Iterator<Administrador> iter = list.iterator();
        Administrador adm = null;
        while (iter.hasNext()) {
            adm = iter.next();  
    %>
    <tbody>
        <tr>
            <td class="text-center"><%= adm.getId_administrador()%></td>
            <td><img src="ControladorImg?id=<%= adm.getId_administrador()%>" width="50" height="50" style="margin: auto; display: block"></td>
            <td class="text-center"><%= adm.getNombres()%></td>
            <td class="text-center"><%= adm.getApellidos()%></td>
            <td class="text-center"><%= adm.getTelefono()%></td>
            <td class="text-center">
                <a class="btn btn-warning" href="Controlador?accion=editar&id=<%= adm.getId_administrador()%>">Editar</a>
                <a class="btn btn-danger" href="Controlador?accion=eliminar&id=<%= adm.getId_administrador()%>">Eliminar</a>
<!--                data-toggle="modal" data-target="#mEditar" -->
<!--                data-toggle="modal" data-target="#mEliminar" -->
            </td>
        </tr>
        <%}%>
    </tbody>                
</table>

<div class="modal fade" id="mAgregar" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title active" style='color: darkcyan'>Agregar Nuevo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <form action="Controlador" method="post" enctype="multipart/form-data">
            Nombres:<br>
            <input class="form-control" type="text" name="txtNom" maxlength="20" required><br>
            Apellidos:<br>
            <input class="form-control" type="text" name="txtApe" maxlength="20" required><br>
            Telefono:<br/>
            <input class="form-control" type="text" name="txtTel" maxlength="15" required><br/>
            Email:<br/>
            <input class="form-control" type="text" name="txtEma" maxlength="30" required><br/>
            Direccion:<br/>
            <input class="form-control" type="text" name="txtDir" maxlength="100" required><br/>
            Sexo:<br/>
            <select class="form-control" name="txtSex" required>
                <option>Masculino</option>
                <option>Femenino</option>
            </select><br/>
            Cargo:<br/>
            <select class="form-control" name="txtCar" required>
                <option>Contador</option>
                <option>Secretario/a</option>
                <option>Administrador</option>
            </select><br/>
            Foto:
            <input class="form-control-file" type="file" name="txtFoto" required><br/>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
            <input class="btn btn-success" type="submit" name="accion" value="Agregar" style='float: right'>
        </form>      
      </div>
    </div>
  </div>
</div>
    
<div class="modal fade" id="mEditar" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title active" style='color: darkcyan'>Editar Registro</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <form action="Controlador" method="post" enctype="multipart/form-data">
            Nombres:<br>
            <input class="form-control"  type="text" name="txtNom" maxlength="20" required><br>
            Apellidos:<br>
            <input class="form-control" type="text" name="txtApe" maxlength="20" required><br>
            Telefono:<br/>
            <input class="form-control" type="text" name="txtTel" maxlength="15" required><br/>
            Email:<br/>
            <input class="form-control" type="text" name="txtEma" maxlength="30" required><br/>
            Direccion:<br/>
            <input class="form-control" type="text" name="txtDir" maxlength="100" required><br/>
            Sexo:<br/>
            <select class="form-control" name="txtSex" required>
                <option>Masculino</option>
                <option>Femenino</option>
            </select><br/>
            Cargo:<br/>
            <select class="form-control" name="txtCar" required>
                <option>Contador</option>
                <option>Secretario/a</option>
                <option>Administrador</option>
            </select><br/>
            Foto:
            <input class="form-control-file" type="file" name="txtFoto" required><br/>
            <input type="text" name="txtid" value="" hidden><br>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
            <input class="btn btn-success" type="submit" name="accion" value="Agregar" style='float: right'>
        </form>      
      </div>
    </div>
  </div>
</div>
    
<div class="modal fade" id="mEliminar" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title active" style='color: darkcyan'>Eliminar Registro</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <div class="modal-body" style="color:black; font-size: 17px">
        ¿Realmente desea eliminar el registro?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-danger">Eliminar</button>
      </div>
    </div>
  </div>
</div>