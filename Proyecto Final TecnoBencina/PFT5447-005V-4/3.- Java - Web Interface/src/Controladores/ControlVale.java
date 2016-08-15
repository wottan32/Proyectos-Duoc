package Controladores;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.model.SelectItem;

import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.CantidadLitros;
import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Empresa;
import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Talonario;
import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Vale;
import org.tempuri.IServicioProxy;

import Beans.TalonarioEdit;


public class ControlVale {

	private CantidadLitros cant = null;
	private Empresa emp;
	private String rut;
	private String nombreEmpresa;
	private String nombreEncargado;
	private String fechaLimiteContrato;
	private String cantidadLitros;
	private String CantDeVales;
	private String NumTalonario;
	//private int UltimoTalonario = 0;
	private List<Vale> ValesXTalonario;
	private List<TalonarioEdit> Talonarios;
	private List<SelectItem> SelectTalonario;
	private List<SelectItem> ListaEmpresa;
	private String comprobanteTransaccion;
	
	
	
	
	public void CargarMantenedorTalonarios()
	{
		Talonarios = Talonarios_ListarTodos();
		ListaEmpresa = ListaEmpresa();
		SelectTalonario = SeleccionarTalonario(Talonarios);
	}
	
	
	public void GenerarTalonario()
	{
		if(!ValidarFormulario()){return;}
		CrearTalonario();
	}
	
	public void CargarValesATalonario()
	{	if(!validarVales()){return;}
		AgregarValesATalonario();
	}
	
	
	private boolean ValidarFormulario()
	{
		try {
			if (rut =="") { Util.mensaje("Error","Para crear talonario es necesario el rut de la empresa");return false;}
			
			
			Integer.parseInt(rut);
			return true;
		} catch (NumberFormatException e) {
			Util.mensaje("Error", "Formato inválido, favor verificar");
			return false;
		}		
	}
	
	private boolean validarVales()
	{
	try {
		if (CantDeVales =="") { Util.mensaje("Error","Para crear talonario es necesaria la cantidad de vales por talonario");return false;}
		if (NumTalonario =="") { Util.mensaje("Error","Para crear Vales es necesario el numero de talonario");return false;}
		if (cantidadLitros =="") { Util.mensaje("Error","Para crear Vales es necesario la cantidad de litros");return false;}
		Integer.parseInt(NumTalonario);	
		Integer.parseInt(CantDeVales);
		return true;
	} catch (NumberFormatException e) {
		Util.mensaje("Error", "Formato inválido, favor verificar");
		return false;
	}	
	}
	
	public void BuscarEmpresa()
	{
		try {
			if(!ValidarFormulario()) return;
			if(!BuscarEmpresa(Integer.parseInt(this.rut))) return;
			this.nombreEmpresa = emp.getNombre();
			this.nombreEncargado = emp.getUsuario().getNombres() +" "+emp.getUsuario().getApatrno() +" "+emp.getUsuario().getAmaterno();
			Talonarios = TalonariosXEmpresa(Integer.parseInt(this.rut));
			SelectTalonario = SeleccionarTalonario(Talonarios);
			if(Talonarios.size()<1)
			{
				Util.mensaje("Empresa no tiene talonario");
			}
		} catch (NumberFormatException  e) {
			Util.mensaje("Error", "Rut Invalido");
		}		
	}

	
	private void AgregarValesATalonario()
	{
		IServicioProxy sv = new IServicioProxy();
		try {
			cant = cant.diez;
			sv.massCreateVale(cant , Integer.parseInt(this.NumTalonario),Integer.parseInt(CantDeVales));
		} catch (RemoteException e) {
			Util.mensaje(e.getMessage());			
		}
		
	}

	public void ListarTalonarios()
	{
		Talonarios_ListarTodos();
	}
	
	public void ListarValesXTalonario(TalonarioEdit oTalonario)
	{
		ValesXTalonario = ValesXTalonario(oTalonario);
	}
	
	private boolean BuscarEmpresa(int rut)
	{
		IServicioProxy sv = new IServicioProxy();		
		try {
			emp = sv.buscarEmpresa(rut);
			return true;
		} catch (RemoteException e) {
			Util.mensaje("Error", e.getMessage());
			return false;
		}
	}
	
	private  List<SelectItem> ListaEmpresa()
	{
		 List<SelectItem> l = new  ArrayList<SelectItem>();
		IServicioProxy sv = new IServicioProxy();
		try {
			for (Empresa empresa : sv.listarEmpresas()) {
				SelectItem lista = new SelectItem();
				lista.setLabel(empresa.getNombre());
				lista.setValue(empresa.getRut());
				l.add(lista);
			}
			return l;
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}	
	
	
	private List<Vale> ValesXTalonario(TalonarioEdit oTalonario)
	{
		List<Vale> lista = new ArrayList<Vale>();
		IServicioProxy sv = new IServicioProxy();
		try {
			for (Vale vale : sv.buscarValesPorTalonario(oTalonario.getTalonarioE().getId())) {
				lista.add(vale);
			}
			if(lista.size()<1)
				Util.mensaje("Talonario sin Vales");
			else 
				Util.mensaje("Talonario Nº" + oTalonario.getTalonarioE().getId()+"- Nº vales: "+lista.size());
			return lista;
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	private List<SelectItem> SeleccionarTalonario(List<TalonarioEdit> lista)
	{
		List<SelectItem> tal = new ArrayList<SelectItem>();
		for (TalonarioEdit x : lista) {
			SelectItem s = new SelectItem();
			s.setLabel("Numero: "+ x.getTalonarioE().getId());
			s.setValue(x.getTalonarioE().getId());
			tal.add(s);
		}
		return tal;
	}
	
	private List<TalonarioEdit> TalonariosXEmpresa(int rut)
	{
		IServicioProxy sv = new IServicioProxy();
		List<TalonarioEdit> lista = new ArrayList<TalonarioEdit>();
		try {
			sv.listarTalonarios();
			for (Talonario talonario : sv.listarTalonariosPorEmpresa(rut)) {
				TalonarioEdit t = new TalonarioEdit();			
				t.setTalonarioE(talonario);
				t.setFechaEntrega(Util.formatoStringFecha(Util.CalendarToDate(talonario.getFechaEntrega())));				
				lista.add(t);				
				}		
			return lista;
		} catch (RemoteException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	private List<TalonarioEdit> Talonarios_ListarTodos()
	{
		///UltimoTalonario = 0;
		IServicioProxy sv = new IServicioProxy();
		List<TalonarioEdit> lista = new ArrayList<TalonarioEdit>();
		try {
			sv.listarTalonarios();
			for (Talonario talonario : sv.listarTalonarios()) {
				TalonarioEdit t = new TalonarioEdit();			
				t.setTalonarioE(talonario);
				t.setFechaEntrega(Util.formatoStringFecha(Util.CalendarToDate(talonario.getFechaEntrega())));				
				//UltimoTalonario += t.getTalonarioE().getId();
				lista.add(t);
				}		
			limpiar();
			return lista;
		} catch (RemoteException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	private void CrearTalonario()
	{
		if (comprobanteTransaccion =="") 
		{ 
			Util.mensaje("Error","Para crear talonario es necesario el comprobante de transacción");
			return;
		}
		IServicioProxy sv = new IServicioProxy();
		try {
			sv.createTalonario(0, Util.DateToCalendar(new Date()), Integer.parseInt(comprobanteTransaccion), Integer.parseInt(rut));
			ListarTalonarios();
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			Util.mensaje("Error Formato", "Comprobante de transaccion inválido");
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			ListarTalonarios();
			e.printStackTrace();
		}
		
		//sv.createTalonario(this.UltimoTalonario+1, new Date().getTimezoneOffset(), _numComprobanteTransaccion, _rutEmpresa);
	}
	
	
	private void limpiar()
	{
		rut ="";
		nombreEmpresa="";
		nombreEncargado="";
		fechaLimiteContrato="";		
		CantDeVales="";
		NumTalonario="";
		
	}
	

	public String getFechaLimiteContrato() {
		return fechaLimiteContrato;
	}

	public void setFechaLimiteContrato(String fechaLimiteContrato) {
		this.fechaLimiteContrato = fechaLimiteContrato;
	}

	public String getCantidadLitros() {
		return cantidadLitros;
	}

	public void setCantidadLitros(String cantidadLitros) {
		this.cantidadLitros = cantidadLitros;
	}

	public Empresa getEmp() {
		return emp;
	}

	public void setEmp(Empresa emp) {
		this.emp = emp;
	}

	/*public int getUltimoTalonario() {
		return UltimoTalonario;
	}

	public void setUltimoTalonario(int ultimoTalonario) {
		UltimoTalonario = ultimoTalonario;
	}*/

	public List<Vale> getValesXTalonario() {
		return ValesXTalonario;
	}

	public void setValesXTalonario(List<Vale> valesXTalonario) {
		ValesXTalonario = valesXTalonario;
	}

	public List<TalonarioEdit> getTalonarios() {
		return Talonarios;
	}

	public void setTalonarios(List<TalonarioEdit> talonarios) {
		Talonarios = talonarios;
	}

	public String getComprobanteTransaccion() {
		return comprobanteTransaccion;
	}

	public void setComprobanteTransaccion(String comprobanteTransaccion) {
		this.comprobanteTransaccion = comprobanteTransaccion;
	}

	public String getRut() {
		return rut;
	}

	public void setRut(String rut) {
		this.rut = rut;
	}

	public String getNombreEmpresa() {
		return nombreEmpresa;
	}

	public void setNombreEmpresa(String nombreEmpresa) {
		this.nombreEmpresa = nombreEmpresa;
	}

	public String getNombreEncargado() {
		return nombreEncargado;
	}

	public String getCantDeVales() {
		return CantDeVales;
	}

	public void setCantDeVales(String cantDeVales) {
		CantDeVales = cantDeVales;
	}

	public void setNombreEncargado(String nombreEncargado) {
		this.nombreEncargado = nombreEncargado;
	}

	public List<SelectItem> getSelectTalonario() {
		return SelectTalonario;
	}

	public void setSelectTalonario(List<SelectItem> selectTalonario) {
		SelectTalonario = selectTalonario;
	}

	public String getNumTalonario() {
		return NumTalonario;
	}

	public void setNumTalonario(String numTalonario) {
		NumTalonario = numTalonario;
	}


	public List<SelectItem> getListaEmpresa() {
		return ListaEmpresa;
	}


	public void setListaEmpresa(List<SelectItem> listaEmpresa) {
		ListaEmpresa = listaEmpresa;
	}
	
	
	
}
