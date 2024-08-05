package com.sise.parcial.servicio;
import com.sise.parcial.dao.UsuarioDAO;
import com.sise.parcial.model.Usuario;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsuarioServiceImpl implements UsuarioService {
    private UsuarioDAO ususarioDAO;
    
    public void setUsuarioDAO(UsuarioDAO usuarioDAO) {
    this.ususarioDAO = usuarioDAO;
    }
    
    @Override
    @Transactional
    public Usuario listarUsuario(int id) {
        return this.ususarioDAO.listarUsuario(id);
    }
    
    @Override
    @Transactional
    public List<Usuario> listarUsuarios() {
        return this.ususarioDAO.listarUsuarios();
    }
    
    @Override
    @Transactional
    public void addUsuario(Usuario u){
        this.ususarioDAO.addUsuario(u);
    }
    
    @Override
    @Transactional
    public void updateUsuario(Usuario u){
        this.ususarioDAO.updateUsuario(u);
    }
    
    @Override
    @Transactional
    public void updateUsuarioestado(int id, String estado){
        this.ususarioDAO.updateUsuarioestado(id,estado);
    }
    
    @Override
    @Transactional
    public String validarUsuario(String nusuario, String pass){
        return this.ususarioDAO.validarUsuario(nusuario,pass);
    }
    
}