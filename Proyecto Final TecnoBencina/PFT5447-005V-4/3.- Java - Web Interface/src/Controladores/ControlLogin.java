package Controladores;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Usuario;
import org.primefaces.context.RequestContext;
import org.tempuri.IServicioProxy;

public class ControlLogin {

	private List<Integer> codValidador;
	private boolean usuario;
	private boolean empresa;
	private boolean combustible;
	private boolean vales;
	private boolean informe;
	private boolean beneficios;
	private String rut;
	private String pass;
	private Usuario user;
	private boolean logeado;
	
	
	public ControlLogin() {
		codValidador = new ArrayList<Integer>();
		codValidador.add(1);
		codValidador.add(4);
		codValidador.add(5);
		codValidador.add(6);
	}
	
	private void validarMenu()
	{
		switch (user.getRol().getId()) {
		case 1:
			usuario = !true;
			empresa= !true;
			combustible= !true;
			vales= !true;
			informe= !true;
			beneficios= !true;
			break;
		case 4:
			usuario = !false;
			empresa= !false;
			combustible= !false;
			vales= !true;
			informe= !false;
			beneficios= !false;
			break;
		case 5:
			usuario = !false;
			empresa= !false;
			combustible= !false;
			vales= !true;
			informe= !true;
			beneficios= !true;
			break;
		default:
			break;
		}
	}
	
	public boolean validarCuenta()
	{
		if(user.getRol().getId()==2 || user.getRol().getId()==3)
		{
			Util.mensaje("Credenciales insuficientes", "Usted no tiene permiso para acceder");			
			return false;
		}else
		{
			Util.mensaje("Bienvenido", user.getNombres());
			 validarMenu();
			return true;
		}
	}
	
	
	public void ValidarIngreso()
	{
		RequestContext context = RequestContext.getCurrentInstance();
		FacesMessage msg = null;
		if(ValidarUsuario())
		{			
			BuscaUsuario();
			this.logeado = validarCuenta();
		}else
		{
			Util.mensaje("Login Error","Credenciales no válidas");
			this.logeado = false;
		}
		context.addCallbackParam("estaLogeado", logeado);
		if (logeado)
			context.addCallbackParam("view", "Index.xhtml");
		
	}
	
	public void logout() 
	{
		HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
		session.invalidate();
		logeado = false;
	} 
	
	public boolean ValidarUsuario()
	{
		IServicioProxy ws = new IServicioProxy();
		try {
			return ws.verificarUsuario(Integer.parseInt(this.getRut()), this.pass);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	
	
	public List<Integer> getCodValidador() {
		return codValidador;
	}


	public void setCodValidador(List<Integer> codValidador) {
		this.codValidador = codValidador;
	}


	public boolean isUsuario() {
		return usuario;
	}


	public void setUsuario(boolean usuario) {
		this.usuario = usuario;
	}


	public boolean isEmpresa() {
		return empresa;
	}


	public void setEmpresa(boolean empresa) {
		this.empresa = empresa;
	}


	public boolean isCombustible() {
		return combustible;
	}


	public void setCombustible(boolean combustible) {
		this.combustible = combustible;
	}


	public boolean isVales() {
		return vales;
	}


	public void setVales(boolean vales) {
		this.vales = vales;
	}


	public boolean isInforme() {
		return informe;
	}


	public void setInforme(boolean informe) {
		this.informe = informe;
	}


	public boolean isBeneficios() {
		return beneficios;
	}


	public void setBeneficios(boolean beneficios) {
		this.beneficios = beneficios;
	}


	public String getRut() {
		return rut;
	}


	public void setRut(String rut) {
		this.rut = rut;
	}


	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}


	public Usuario getUser() {
		return user;
	}


	public void setUser(Usuario user) {
		this.user = user;
	}


	public boolean isLogeado() {
		return logeado;
	}


	public void setLogeado(boolean logeado) {
		this.logeado = logeado;
	}


	private void BuscaUsuario()
	{
		IServicioProxy as = new IServicioProxy();
		try {
			this.user = as.buscarUsuario(Integer.parseInt(rut));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
