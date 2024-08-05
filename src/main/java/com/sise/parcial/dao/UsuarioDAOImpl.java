
package com.sise.parcial.dao;

import com.sise.parcial.model.Usuario;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

public class UsuarioDAOImpl implements UsuarioDAO{

    private SessionFactory sessionFactory;
    public void setSessionFactory(SessionFactory sf) {
    this.sessionFactory = sf;
    }

    @Override
    public Usuario listarUsuario(int id) {
        Usuario nuser = new Usuario();
        try {
            Session session = this.sessionFactory.getCurrentSession();
            Criteria query = session.createCriteria(Usuario.class);
            query.add(Restrictions.eq("id", id));
            List<Usuario> lista = query.list();
            nuser=lista.get(0);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return nuser;
        }
    }
    
    @Override
    public List<Usuario> listarUsuarios() {
        List<Usuario> listaUsuarios = new ArrayList<Usuario>();
        Session session = this.sessionFactory.getCurrentSession();
        try {
        listaUsuarios = session.createQuery("from Usuario").list();
        } catch (Exception e) {
        e.printStackTrace();
        } finally {
        return listaUsuarios;
        }
    }

    @Override
    public void addUsuario(Usuario u) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(u);
    }
    
    @Override
    public void updateUsuario(Usuario u) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(u);
    }
    
    @Override
    public void updateUsuarioestado(int id, String estado) {
        System.out.print("Comienzo");
        Session session = this.sessionFactory.getCurrentSession();
        try{
        Usuario user = (Usuario) session.get(Usuario.class, id);
        if("Habilitado".equals(estado)){
            user.setEstado("Deshabilitado"); 
        }  else if ("Deshabilitado".equals(estado)){
           user.setEstado("Habilitado"); 
            }else {
        System.out.print("No coincidencia");
        
        session.update(user);
        }
        }catch (Exception e) {
                e.printStackTrace();
            } 
    }
    
    @Override
    public String validarUsuario(String correo,String pass) {
        String mensaje = null;
        try {
            Session session = this.sessionFactory.getCurrentSession();
            Criteria query = session.createCriteria(Usuario.class);
            query.add(Restrictions.like("correo", correo, MatchMode.ANYWHERE));
            List<Usuario> lista = query.list();
            
            Usuario user = new Usuario() ;
            user=lista.get(0);
            
            if ((user.getCorreo()).equals(correo) && (user.getPass()).equals(pass)) {
                mensaje= "ok";
                }else{ mensaje= "Error";}
            
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
            return mensaje;
        }
        
    }
}
