package com.sise.parcial.model;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "USUARIO")
public class Usuario {
    
@Id
@Column(name = "id")
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;
private String nombres;
private String genero;
private String correo;
private Date fecha;
private String estado;
private String pass;

    public Usuario() {
    }

    public Usuario(String nombres, String genero, String correo, Date fecha, String estado, String pass) {
        this.nombres = nombres;
        this.genero = genero;
        this.correo = correo;
        this.fecha = fecha;
        this.estado = estado;
        this.pass = pass;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }



    
    
}