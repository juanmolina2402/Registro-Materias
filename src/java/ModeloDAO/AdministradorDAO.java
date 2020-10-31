package ModeloDAO;

import Config.Conexion;
import Modelo.Administrador;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import Interfaces.CRUDAdm;

public class AdministradorDAO implements CRUDAdm{
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Administrador adm = new Administrador();
    
    @Override
    public List listar() {
        ArrayList<Administrador>list = new ArrayList<>();
        String sql="select * from administrador";
        try {
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Administrador adm = new Administrador();
                adm.setId_administrador(rs.getInt("id_administrador"));
                adm.setNombres(rs.getString("nombres"));
                adm.setApellidos(rs.getString("apellidos"));
                adm.setFoto(rs.getBinaryStream("foto"));
                adm.setTelefono(rs.getString("telefono"));
                adm.setEmail(rs.getString("email"));
                adm.setSexo(rs.getString("sexo"));
                adm.setDireccion(rs.getString("direccion"));
                adm.setCargo(rs.getString("cargo"));
                list.add(adm);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void listarImg(int id, HttpServletResponse response){
        String sql="select * from administrador where id_administrador="+id;
        InputStream inputStream=null;
        OutputStream outputStream=null;
        BufferedInputStream bufferedInputStream=null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        try{
            outputStream=response.getOutputStream();
            con=cn.getConexion();
            ps = con.prepareStatement(sql);
            rs=ps.executeQuery();
            if(rs.next()){
                inputStream=rs.getBinaryStream("foto");
            }
            bufferedInputStream=new BufferedInputStream(inputStream);
            bufferedOutputStream=new BufferedOutputStream(outputStream);
            int i=0;
            while((i=bufferedInputStream.read())!=-1){
                bufferedOutputStream.write(i);
            }
        }catch (Exception e){ 
        }
    }
    
    @Override
    public Administrador list(int id) {
        String sql = "select * from administrador where id_administrador="+id;
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                adm.setId_administrador(rs.getInt("id_administrador"));
                adm.setNombres(rs.getString("nombres"));
                adm.setApellidos(rs.getString("apellidos"));
                adm.setFoto(rs.getBinaryStream("foto"));
                adm.setTelefono(rs.getString("telefono"));
                adm.setEmail(rs.getString("email"));
                adm.setDireccion(rs.getString("direccion"));
                adm.setSexo(rs.getString("sexo"));
                adm.setCargo(rs.getString("cargo"));
            }
        } catch (SQLException ex) {
        }
        return adm;
    }

    @Override
    public boolean add(Administrador adm) {
        String sql="insert into administrador(nombres, apellidos, foto, telefono, email, direccion, sexo, cargo)values(?,?,?,?,?,?,?,?)";
        try{
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, adm.getNombres());
            ps.setString(2, adm.getApellidos());
            ps.setBinaryStream(3, adm.getFoto());
            ps.setString(4, adm.getTelefono());
            ps.setString(5, adm.getEmail());
            ps.setString(6, adm.getDireccion());
            ps.setString(7, adm.getSexo());
            ps.setString(8, adm.getCargo());
            ps.executeUpdate();
        }catch(Exception e){
        }
        return false;
    }

    @Override
    public boolean edit(Administrador adm) {
        String sql = "update administrador set nombres=?, apellidos=?, foto=?, telefono=?, email=?, direccion=?, sexo=?, cargo=? where id_administrador=?";
        try{
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, adm.getNombres());
            ps.setString(2, adm.getApellidos());
            ps.setBinaryStream(3, adm.getFoto());
            ps.setString(4, adm.getTelefono());
            ps.setString(5, adm.getEmail());
            ps.setString(6, adm.getDireccion());
            ps.setString(7, adm.getSexo());
            ps.setString(8, adm.getCargo());
            ps.setInt(9, adm.getId_administrador());
            ps.executeUpdate();
        }catch(Exception e){}
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "delete from administrador where id_administrador="+id;
        try{
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){}
        return false;
    }  
}
