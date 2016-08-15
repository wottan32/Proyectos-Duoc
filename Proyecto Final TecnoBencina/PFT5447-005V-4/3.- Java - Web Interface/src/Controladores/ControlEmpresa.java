package Controladores;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

import javax.faces.model.SelectItem;

import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Empresa;
import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Usuario;
import org.tempuri.IServicioProxy;

import Beans.EmpEditable;

public class ControlEmpresa {
	private String rut;
	private String dv;
	private String nombre;
	private String rutUsuario;
	private List<EmpEditable> Empresas;
	private List<SelectItem> Usuarios;
	
	

	
	
	public void CargarMantenedorEmpresas()
	{
		 BuscarEmpresas();
		 CargarSelectOneMenu();
	}
	
	private boolean ValidarFormulario()
	{
		try {
			if(nombre == "" ){
				Util.mensaje("Error", "Nombre es obligatorio");
				return false;
				}
			Integer.parseInt(rut);
			Integer.parseInt(rutUsuario);
			return true;
		} catch (NumberFormatException e) {
			Util.mensaje("Rut invalido","Error de formato, favor verificar");
			return false;
		}
		
	}
	
	public void BuscarEmpresas()
	{
		Empresas = traeListaEmpresa();
	}
	
	public void IngresarEmpresa()
	{
		if (ValidarFormulario()) 
		{
			CrearEmpresa();
		}
	}
	
	private void CargarSelectOneMenu()
	{
		IServicioProxy sv = new IServicioProxy();
		Usuarios = new ArrayList<SelectItem>();
		try {
			for(Usuario u : sv.listarUsuarios())
			{
				SelectItem s = new SelectItem();
				s.setLabel(u.getNombres()+"-"+u.getRut());
				s.setValue(u.getRut());
				Usuarios.add(s);
			}
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	
	private void CrearEmpresa()
	{
		IServicioProxy sv = new IServicioProxy();
		try {
			sv.createEmpresa(Integer.parseInt(rut), dv, nombre, Integer.parseInt(rutUsuario));
			Util.mensaje("Empresa "+nombre+" Rut "+rut+"-"+dv+" Ingresada Correctamente");
			Limpiar();
			BuscarEmpresas();
		} catch (RemoteException e) {
			Util.mensaje(e.getMessage());
		}
	}	
	
	private void Limpiar()
	{
		rut = "";
		dv = "";
		nombre = "";
		rutUsuario = "";
	}
	
	private List<EmpEditable> traeListaEmpresa() {
		IServicioProxy sv = new IServicioProxy();
		try {
			List<EmpEditable> emp = new ArrayList<EmpEditable>();
			for (Empresa empresa : sv.listarEmpresas()) {
				EmpEditable emp1 = new EmpEditable();
				emp1.setEmp(empresa);
				emp1.setEditable(false);
				emp1.setEditado(false);				
				emp.add(emp1);				
			}
			return emp;
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public void ActualizarEmpresa()
	{
		int RegistroEditados = 0;
		IServicioProxy sv = new IServicioProxy();
		try {
			for (EmpEditable x : Empresas) {
				if (x.isEditado()) {
					sv.updateEmpresa(x.getEmp().getRut().intValue(), x.getEmp().getNombre(), x.getEmp().getUsuario().getRut().intValue());	
					sv.switchStatusEmpresa(x.getEmp().getRut().intValue(), x.getEmp().getEstado().booleanValue());
					RegistroEditados++;
				}
			}
			Util.mensaje(RegistroEditados+ "Registros editados");
			BuscarEmpresas();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String AccionEditar(EmpEditable empresa)
	{
		empresa.setEditable(!empresa.isEditable());	
		empresa.setEditado(true);		
		return null;
	}

	public String getDv() {
		return dv;
	}

	public void setDv(String dv) {
		this.dv = dv;
	}

	public String getRut() {
		return rut;
	}

	public void setRut(String rut) {
		this.rut = rut;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getRutUsuario() {
		return rutUsuario;
	}

	public void setRutUsuario(String rutUsuario) {
		this.rutUsuario = rutUsuario;
	}

	public List<EmpEditable> getEmpresas() {
		return Empresas;
	}

	public void setEmpresas(List<EmpEditable> empresas) {
		Empresas = empresas;
	}


	public List<SelectItem> getUsuarios() {
		return Usuarios;
	}


	public void setUsuarios(List<SelectItem> usuarios) {
		Usuarios = usuarios;
	}

	
	
}
