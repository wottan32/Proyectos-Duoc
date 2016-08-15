package Controladores;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.BeneficiarioCredito;
import org.primefaces.model.UploadedFile;
import org.primefaces.context.RequestContext;
import org.primefaces.event.FileUploadEvent;
import org.tempuri.IServicioProxy;

import Beans.BeneficiarioEdit;
import Beans.BeneficiarioEditable;
import Beans.EmpEditable;

public class ControlBeneficiarios {
	private UploadedFile file;
	private List<BeneficiarioEditable> listaBeneficiarios;
	private List<BeneficiarioEdit> ListaNuevaBeneficiarios;


	public void ListarBeneficiarios()
	{
		listaBeneficiarios = TraeBeneficiarios();
	}
	
	public void CargarNuevosBeneficiarios(FileUploadEvent event)
	{
		Util.mensaje(" Archivo "+event.getFile().getFileName()+" Cargado");
		CargarContenido(event.getFile().getFileName());
	}
	
	private void CargarContenido(String archivo)
	{	  ListaNuevaBeneficiarios = new ArrayList<BeneficiarioEdit>();
	      String ruta = "C:/Users/TecnoBencina/Desktop/Beneficiarios/"+archivo;
	      FileReader f;
	      String cadena;
		try {
		  f = new FileReader(ruta);
	      BufferedReader b = new BufferedReader(f);
	      while((cadena = b.readLine())!=null) {
	    	  ObtenerDatos(cadena);
	      }
	      b.close();
	      AbrirDialogo();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (IOException e) {
			// TODO: handle exception
		}
	}
	
	private void AbrirDialogo()
	{
		RequestContext context = RequestContext.getCurrentInstance();
		context.execute("PF('dlgBen').show();");
	}
	
	public void ObtenerDatos(String linea)
	{
		try {
		BeneficiarioEditable b = new BeneficiarioEditable();
		String[] datosArray = linea.split(";");
		BeneficiarioCredito lista = new BeneficiarioCredito();
		BeneficiarioEdit edit = new BeneficiarioEdit();
		lista.setRut(Integer.parseInt(datosArray[0]));
		lista.setDv( datosArray[1]);
		lista.setTopeLitros(Integer.parseInt(datosArray[2]));
		lista.setLimiteVigencia(Util.StringToCalendar(datosArray[3]));
		lista.setNombreEmpresa(datosArray[4]);
		lista.setEstado(Boolean.parseBoolean(datosArray[5]));	
		edit.setBen(lista);
		edit.setFecha(Util.formatoStringFecha(Util.CalendarToDate(lista.getLimiteVigencia())));
		b.setoBeneficiario(lista);
		b.setFecha(Util.formatoStringFecha(Util.CalendarToDate(lista.getLimiteVigencia())));
		b.setEditable(false);
		b.setEditado(false);		
		IServicioProxy sv = new IServicioProxy();
		ListaNuevaBeneficiarios.add(edit);
		//sv.createBeneficiario(0, Integer.parseInt(datosArray[0]) , datosArray[1], Integer.parseInt(datosArray[2]), Util.StringToCalendar(datosArray[3]), datosArray[4], Boolean.parseBoolean(datosArray[5]), Integer.parseInt(datosArray[6]));
		} catch (NumberFormatException e) {
			Util.mensaje("Error", "Formato fecha Numerico Incorrecto");
		} /*catch (RemoteException e) {
			Util.mensaje(e.getMessage());
		}*/
	}
	
	private List<BeneficiarioEditable> TraeBeneficiarios() {
		IServicioProxy sv = new IServicioProxy();
		try {
			List<BeneficiarioEditable> ben = new ArrayList<BeneficiarioEditable>();
			for (BeneficiarioCredito oBeneficiario : sv.listarBeneficiarios()) {
				BeneficiarioEditable b = new BeneficiarioEditable();
				b.setoBeneficiario(oBeneficiario);		
				b.setFecha(Util.formatoStringFecha2(Util.CalendarToDate(oBeneficiario.getLimiteVigencia())));
				b.setEditable(false);
				b.setEditado(false);				
				ben.add(b);				
			}
			return ben;
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public  void EditarBeneficiario()
	{
		int RegistroEditados = 0;
		IServicioProxy sv = new IServicioProxy();
		try {
			for (BeneficiarioEditable x : listaBeneficiarios) {
				if (x.isEditado()) {
					sv.updateBeneficiario(x.getoBeneficiario().getId(), x.getoBeneficiario().getTopeLitros(), x.getoBeneficiario().getLimiteVigencia(), x.getoBeneficiario().getNombreEmpresa());
					sv.switchStatusBeneficiario(x.getoBeneficiario().getId(), x.getoBeneficiario().getEstado().booleanValue());	
					RegistroEditados++;
				}
			}
			Util.mensaje(RegistroEditados+ "Registros editados");
			ListarBeneficiarios();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String AccionEditar(BeneficiarioEditable beneficiario)
	{
		beneficiario.setEditable(!beneficiario.isEditable());	
		beneficiario.setEditado(true);		
		return null;
	}
	
	public UploadedFile getFile() {
		return file;
	}

	public void setFile(UploadedFile file) {
		this.file = file;
	}

	public List<BeneficiarioEditable> getListaBeneficiarios() {
		return listaBeneficiarios;
	}

	public void setListaBeneficiarios(List<BeneficiarioEditable> listaBeneficiarios) {
		this.listaBeneficiarios = listaBeneficiarios;
	}
	
	
	public List<BeneficiarioEdit> getListaNuevaBeneficiarios() {
		return ListaNuevaBeneficiarios;
	}

	public void setListaNuevaBeneficiarios(List<BeneficiarioEdit> listaNuevaBeneficiarios) {
		ListaNuevaBeneficiarios = listaNuevaBeneficiarios;
	}
	
}
