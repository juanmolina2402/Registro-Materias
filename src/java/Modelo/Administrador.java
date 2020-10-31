package Modelo;
import java.io.InputStream;

public class Administrador {
    int id_administrador;
    String nombres;
    String apellidos;
    InputStream foto;
    String telefono;
    String email;
    String direccion;
    String sexo;
    String cargo;

    public Administrador() {
    }
    
    public Administrador(String nombres, String apellidos, InputStream foto, String telefono, String email, String direccion, String sexo, String cargo) {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.foto = foto;
        this.telefono = telefono;
        this.email = email;
        this.direccion = direccion;
        this.sexo = sexo;
        this.cargo = cargo;
    }
    
    public int getId_administrador() {
        return id_administrador;
    }

    public void setId_administrador(int id_administrador) {
        this.id_administrador = id_administrador;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public InputStream getFoto() {
        return foto;
    }

    public void setFoto(InputStream foto) {
        this.foto = foto;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }   
}
