package Controladores;

import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Combustible;
import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.HistorialPrecio;
import org.tempuri.IServicioProxy;

import Beans.CombustibleEditable;
import Beans.HistorialCombustible;
import Beans.HistorialEdit;

public class ControlCombustible {

	private List<CombustibleEditable> Combustible;
	private List<HistorialCombustible> ListCombustible;
	
	
	public void CargarMantenedorCombustible()
	{
		this.Combustible = ListarTipoCombustible();
		this.ListCombustible = HistorialCombustibles();
	}

	public void ActualizarCombustible()
	{
		UpdateCombustible();
		CargarMantenedorCombustible();
	}
	
	private void UpdateCombustible()
	{
		int RegistroEditados = 0;
		IServicioProxy sv = new IServicioProxy();
		try {			
			for (CombustibleEditable x : Combustible) {
				if (x.isEditad()) {
					int DiasVigente = 3;//indica los dias vigentes del precio del combustible
					BigDecimal precioActual = x.getCmb().getPrecioActual();
					int id =x.getCmb().getId();
					Calendar c1 = Calendar.getInstance();
					sv.createHistorialPrecioCombustible(0,c1, precioActual,  id );
					for (int i = 0; i < DiasVigente-1; i++) {
						c1.add(Calendar.DAY_OF_YEAR,1);
						sv.createHistorialPrecioCombustible(0,c1, precioActual,  id );
					}					
					RegistroEditados++;
					Util.mensaje("Combustible "+x.getCmb().getNombre()+" Actualizado, Precio: "+ x.getCmb().getPrecioActual());				
				}				
			}		
			Util.mensaje(RegistroEditados+" Registros editados");
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}
	
	private List<HistorialCombustible> HistorialCombustibles()
	{
		IServicioProxy sv = new IServicioProxy();
		List<HistorialCombustible> lst = new ArrayList<HistorialCombustible>();		
		try {
			for (CombustibleEditable cmb  : ListarTipoCombustible()) {
				HistorialCombustible hst = new HistorialCombustible();
				List<HistorialEdit> lst1 = new ArrayList<HistorialEdit>();
				for (HistorialPrecio HistorialPrecio : sv.listarHistorialPrecioPorCombustible(cmb.getCmb().getId())) 
				{ 			
					HistorialEdit h = new HistorialEdit();
					h.setHistorial(HistorialPrecio);
					h.setFeha(Util.formatoStringFecha(Util.CalendarToDate(HistorialPrecio.getFecha())));					
					lst1.add(h);
					hst.setNombre(HistorialPrecio.getCombustible().getNombre());
				}
				hst.setHistorial(lst1);				
				lst.add(hst);
			}
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		return lst;
	}
	
	
	private List<CombustibleEditable> ListarTipoCombustible()
	{
		IServicioProxy sv = new IServicioProxy();
		 List<CombustibleEditable> lst = new ArrayList<CombustibleEditable>();
		try {
			for (Combustible cmb : sv.listarCombustibles()) {
				CombustibleEditable cmbu = new CombustibleEditable();
				cmbu.setCmb(cmb);
				cmbu.setEditable(false);
				cmbu.setEditad(false);				
				lst.add(cmbu);
			}
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		return lst;
	}
	
	
	public String AccionEditar(CombustibleEditable combustible)
	{
		combustible.setEditable(!combustible.isEditable());	
		combustible.setEditad(true);		
		return null;
	}

	public List<CombustibleEditable> getCombustible() {
		return Combustible;
	}

	public void setCombustible(List<CombustibleEditable> combustible) {
		Combustible = combustible;
	}

	public List<HistorialCombustible> getListCombustible() {
		return ListCombustible;
	}

	public void setListCombustible(List<HistorialCombustible> listCombustible) {
		ListCombustible = listCombustible;
	}
	
	
	
	
	
}
