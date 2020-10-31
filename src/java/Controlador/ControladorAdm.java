package Controlador;
import Modelo.Administrador;
import ModeloDAO.AdministradorDAO;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class ControladorAdm extends HttpServlet{
    String Principal = "vistas/Principal.jsp?opc=1";
    String Inicio = "vistas/Inicio.jsp";
    String listarAdm = "vistas/ListarAdm.jsp";
    String Actualizar = "vistas/Principal.jsp?opc=2";
    Administrador adm = new Administrador();
    AdministradorDAO dao = new AdministradorDAO();
    int id=0;
        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso="";
        String action=request.getParameter("accion");
        if(action.equalsIgnoreCase("Principal")){
            acceso=Principal;
        }else if(action.equalsIgnoreCase("Inicio")){
            acceso=Inicio;
        }else if(action.equalsIgnoreCase("listarAdm")){
            acceso=listarAdm;
        }
//        else if(action.equalsIgnoreCase("editar")){
//            request.setAttribute("idper",request.getParameter("id"));
//            acceso=edit;
//        }
        else if(action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            adm.setId_administrador(id);
            dao.eliminar(id);
            acceso=Actualizar;
        }
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso="";
        String action=request.getParameter("accion");
        if(action.equalsIgnoreCase("Agregar")){
            String nom=request.getParameter("txtNom");
            String ape=request.getParameter("txtApe");
            Part part=request.getPart("txtFoto");           
            InputStream inputStream=part.getInputStream();
            String tel=request.getParameter("txtTel");
            String ema=request.getParameter("txtEma");
            String dir=request.getParameter("txtDir");
            String sex=request.getParameter("txtSex");
            String car=request.getParameter("txtCar");
            adm.setNombres(nom);
            adm.setApellidos(ape);
            adm.setFoto(inputStream);
            adm.setTelefono(tel);
            adm.setEmail(ema);
            adm.setDireccion(dir);
            adm.setSexo(sex);
            adm.setCargo(car);
            dao.add(adm);
            acceso=Actualizar;
       }else if(action.equalsIgnoreCase("Actualizar")){
            id=Integer.parseInt(request.getParameter("txtid"));
            String ape=request.getParameter("txtApe");
            String nom=request.getParameter("txtNom");
            Part part=request.getPart("txtFoto");           
            InputStream inputStream=part.getInputStream();
            String tel=request.getParameter("txtTel");
            String ema=request.getParameter("txtEma");
            String dir=request.getParameter("txtDir");
            String sex=request.getParameter("txtSex");
            String car=request.getParameter("txtCar");
            adm.setId_administrador(id);
            adm.setNombres(nom);
            adm.setApellidos(ape);
            adm.setFoto(inputStream);
            adm.setTelefono(tel);
            adm.setEmail(ema);
            adm.setDireccion(dir);
            adm.setSexo(sex);
            adm.setCargo(car);
            dao.edit(adm);
            acceso=Actualizar;
        }
       RequestDispatcher vista=request.getRequestDispatcher(acceso);
       vista.forward(request, response);
    }
}
