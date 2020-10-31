package Interfaces;
import Modelo.Administrador;
import java.util.List;

public interface CRUDAdm {
    public List listar();
    public Administrador list(int id);
    public boolean add(Administrador adm);
    public boolean edit(Administrador adm);
    public boolean eliminar(int id);
}
