package Controladores;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

import javax.faces.model.SelectItem;

import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Rol;
import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Usuario;
import org.tempuri.IServicioProxy;


import Beans.UserEditable;

public class ControlUsuarios {
	private String Nombre;
	private String aPaterno;
	private String aMaterno;
	private String rut;
	private String dv;
	private String Rol;
	private String password;
	private List<UserEditable> Usuarios;
	private List<SelectItem> Roles;
	
	public void CargarMantenedorUsuario()
	{
		UsuariosListarTodos();
		CargarSelectOneMenu();
	}
	
	private void Limpiar()
	{
		Nombre = "";
		aPaterno = "";
		aMaterno = "";
		rut = "";
		dv = "";
		Rol = "";
		password = "";
	}
	
	public boolean ValidarDatos()
	{
		try {
			if(Nombre == "" || Nombre == null){ return false; }
			if(aPaterno== "" || aPaterno == null){ return false; }
			if(aMaterno== "" || aMaterno == null){ return false; }
			if(password == "" || password == null){ return false; }
			Integer.parseInt(rut);
			Integer.parseInt(dv);
			return true;
		} catch (NumberFormatException e) {
			// TODO: handle exception
			Util.mensaje("Rut Inválido", "Por Favor ingrese un rut válido");
			return false;
		}
	}
	
	private void UsuariosListarTodos()
	{		
		Usuarios = traeListaUsuario();	
	}
	
	private void IngresarUsuario()
	{
		IServicioProxy sv = new IServicioProxy();
		try {			
			sv.createUsuario(Integer.parseInt(rut), dv, Nombre, aPaterno, aMaterno,password, Integer.parseInt(Rol));
			CargarMantenedorUsuario();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			Util.mensaje("Error Ingreso", e.getMessage());
		}
	}
	
	public void CrearUsuario()
	{
		if(ValidarDatos())
		{
			IngresarUsuario();
			Util.mensaje( "Mensaje","Usuario "+ rut + " Ingresado");
			Limpiar();
		}
		else
			Util.mensaje("Error", "Formulario con errores, favor verificar");		
	}
	
	
	

	private void CargarSelectOneMenu()
	{
		IServicioProxy sv = new IServicioProxy();
		Roles = new ArrayList<SelectItem>();
		try {
			for(Rol r : sv.listarRoles())
			{
				SelectItem s = new SelectItem();
				s.setLabel(r.getNombre());
				s.setValue(r.getId());
				Roles.add(s);
			}
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	private List<UserEditable> traeListaUsuario()
	{
		IServicioProxy sv = new IServicioProxy();
		try {
			List<UserEditable> user = new ArrayList<UserEditable>();
			for (Usuario usuario : sv.listarUsuarios()) {
				UserEditable ue = new UserEditable();
				ue.setUsuario(usuario);
				ue.setEditable(false);
				ue.setEditado(false);
				user.add(ue);
			}
			return user;
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public void ActualizarUsuario()
	{
		int RegistroEditados = 0;
		IServicioProxy sv = new IServicioProxy();
		try {
		for (UserEditable x : Usuarios) {
			if (x.isEditado()) {				
					sv.updateUsuario(x.getUsuario().getRut().intValue(), x.getUsuario().getNombres(), x.getUsuario().getApatrno(), x.getUsuario().getAmaterno(), x.getUsuario().getRol().getId());
					sv.switchStatusUsuario(x.getUsuario().getRut().intValue(), x.getUsuario().getEstado().booleanValue());
					RegistroEditados++;
			}
		}
		Util.mensaje("Actualizados", "Registros actualizados: "+ RegistroEditados);
		UsuariosListarTodos();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public String AccionEditar(UserEditable usuario)
	{
		usuario.setEditable(!usuario.isEditable());	
		usuario.setEditado(true);		
		return null;
	}
	
	
	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String nombre) {
		Nombre = nombre;
	}

	public String getaPaterno() {
		return aPaterno;
	}

	public void setaPaterno(String aPaterno) {
		this.aPaterno = aPaterno;
	}

	public String getaMaterno() {
		return aMaterno;
	}

	public void setaMaterno(String aMaterno) {
		this.aMaterno = aMaterno;
	}

	public String getRut() {
		return rut;
	}

	public void setRut(String rut) {
		this.rut = rut;
	}

	public String getDv() {
		return dv;
	}

	public void setDv(String dv) {
		this.dv = dv;
	}

	public String getRol() {
		return Rol;
	}

	public void setRol(String rol) {
		Rol = rol;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	

	public List<UserEditable> getUsuarios() {
		return Usuarios;
	}

	public void setUsuarios(List<UserEditable> usuarios) {
		Usuarios = usuarios;
	}

	public List<SelectItem> getRoles() {
		return Roles;
	}

	public void setRoles(List<SelectItem> roles) {
		Roles = roles;
	}

	

	
	
	
}
