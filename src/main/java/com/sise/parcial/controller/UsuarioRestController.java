package com.sise.parcial.controller;

import com.sise.parcial.model.Usuario;
import com.sise.parcial.servicio.UsuarioService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
public class UsuarioRestController {
    
    private UsuarioService usuarioService;
    @Autowired(required = true)
    @Qualifier(value = "usuarioService")

    public void setUsuarioService(UsuarioService ps) {
        this.usuarioService = ps;
    }
    @RequestMapping("/verificar")
    public String verificarEstado() {
        return "Ok";
    }

    @RequestMapping(value="/rest/use/editUserDB", method = RequestMethod.POST)
    public Usuario editUsuariosDB(@RequestParam("id") int id) {
    Usuario nuser = this.usuarioService.listarUsuario(id);
    return nuser;
    }
    
    @RequestMapping(value="/rest/use/getUserDB", method = RequestMethod.GET)
    public List<Usuario> getUsuariosDB() {
    List<Usuario> listaRet = new ArrayList<Usuario>();
    listaRet = this.usuarioService.listarUsuarios();
    return listaRet;
    }

    @RequestMapping(value="/rest/use/addUserDB", method = RequestMethod.POST)
    public String addUsuariosDB(@RequestParam("nombres") String name, @RequestParam("genero") String genero, @RequestParam("correo") String correo,@RequestParam("fecha")String fecha,@RequestParam("pass") String pass ) throws ParseException {
    
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date date = dateFormat.parse(fecha);
       
    Usuario empBean = new Usuario();
    empBean.setNombres(name);
    empBean.setGenero(genero);
    empBean.setFecha(date);
    empBean.setCorreo(correo);
    empBean.setEstado("Habilitado");
    empBean.setPass(pass);
    this.usuarioService.addUsuario(empBean);
    return "El usuario fue creado exitosamente";
    }
    
    @RequestMapping(value="/rest/use/updateUserDB", method = RequestMethod.POST)
    public String updateUsuariosDB(@RequestParam("id") int id,@RequestParam("nombres") String name, @RequestParam("genero") String genero, @RequestParam("correo") String correo,@RequestParam("fecha")String fecha,@RequestParam("estado")String estado,@RequestParam("pass") String pass ) throws ParseException {
    
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date date = dateFormat.parse(fecha);
       
    Usuario empBean = new Usuario();
    empBean.setId(id);
    empBean.setNombres(name);
    empBean.setGenero(genero);
    empBean.setFecha(date);
    empBean.setCorreo(correo);
    empBean.setEstado(estado);
    empBean.setPass(pass);
    this.usuarioService.updateUsuario(empBean);
    return "Usuario Actualizado";
    }
    
    @RequestMapping(value="/rest/use/updateUserDBestado", method = RequestMethod.POST)
    public String updateUsuariosDBestado(@RequestParam("id") int id, @RequestParam("estado") String estado ){
    this.usuarioService.updateUsuarioestado(id,estado);
    return "Estado ac";
    }
    
    
    @RequestMapping(value="/rest/use/validarUserDB", method = RequestMethod.POST)
    public String validarUsuariosDB( @RequestParam("correo")String correo,@RequestParam("pass") String pass ) {
    return  this.usuarioService.validarUsuario(correo,pass);
    }

    //    @RequestMapping(value="/rest/use/porNombre", method = RequestMethod.GET)
//    public List<Usuario> specialgetUsuariosDB(@RequestParam("porNombre") String porNombre, @RequestParam("porGenero") String porGenero, @RequestParam("porFecha") String porFecha) {
////        
//    List<Usuario> newList = new ArrayList<Usuario>();
//    List<Usuario> newList1 = new ArrayList<Usuario>();
//    List<Usuario> newList2 = new ArrayList<Usuario>();
//    newList = this.usuarioService.listarUsuarios();
//    newList1 = this.usuarioService.porNombre(porNombre,newList);
//    return newList;
//    }
    
}