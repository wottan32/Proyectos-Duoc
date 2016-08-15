package Controladores;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;

import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Combustible;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.ChartSeries;
import org.tempuri.IServicioProxy;

import Beans.LitrosPorCombustible;

public class ControlInforme {

	private BarChartModel GrafBarra;
	private List<LitrosPorCombustible> listaLitrosxCombustible;
	private Date fechaIncio = new Date();
	private Date fechaFin = new Date();
	private String emision = Util.formatoStringFecha(new Date());
	
	@PostConstruct
	public void IniciarInforme()
	{
		CrearGRafico();
		listaLitrosxCombustible = cargarListaLitrosPorCombustible();
	}
	
	public String InisioStr()
	{
		return Util.formatoStringFecha(fechaIncio);
	}
	public String finStr()
	{
		return Util.formatoStringFecha(fechaFin);
	}
	public List<LitrosPorCombustible> cargarListaLitrosPorCombustible()
	{
		IServicioProxy sv = new IServicioProxy();
		List<LitrosPorCombustible> list = new ArrayList<LitrosPorCombustible>();
		try {
			for(Combustible cmb : sv.listarCombustibles())
			{
				LitrosPorCombustible l = new LitrosPorCombustible();
				l.setCmb(cmb);
				l.setLitros(sv.cantLtsVendidosPorComb(cmb.getId(),Util.DateToCalendar(fechaIncio), Util.DateToCalendar(fechaFin))+" LTS");
				list.add(l);
			}
			return list;
		} catch (RemoteException e) {
			Util.mensaje(e.getMessage());
			return null;
		}		
	}
	
	

	private void CrearGRafico() {
		GrafBarra = initBarModel();
		GrafBarra.setTitle("Gráfico Ventas de combustibles por surtidor");
		GrafBarra.setAnimate(true);
		GrafBarra.setLegendPosition("ne");
		Axis yAxis = GrafBarra.getAxis(AxisType.Y);
		Axis xAxis = GrafBarra.getAxis(AxisType.X);
		xAxis.setLabel("Surtidores");
		yAxis.setLabel("Litros");
        yAxis.setMin(1);
	}

	private BarChartModel initBarModel() {
		BarChartModel model = new BarChartModel();	
		
		IServicioProxy sv = new IServicioProxy();
		try {
			ChartSeries barra;
			
			for (Combustible c : sv.listarCombustibles()) {
				barra = new ChartSeries();
				barra.setLabel(c.getNombre());
				for (String s : sv.listarIdSurtidoresXCombustible(c.getId())) {					
					String Surtidor = "Surtidor "+ s;
					barra.set(Surtidor, sv.cantLtsVendidosPorCombuEnSurtidor(c.getId(),Integer.parseInt(s), Util.DateToCalendar(fechaIncio), Util.DateToCalendar(fechaFin)));					
				}	
				model.addSeries(barra);	
			}
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
        return model;
	}
	
	public void ImprimirInforme()
	{
		new ControlPDF(fechaIncio, fechaFin);
		ControlPDF.GenerarPDF();				
	}
	
	public String getEmision() {
		return emision;
	}

	public void setEmision(String emision) {
		this.emision = emision;
	}

	public BarChartModel getGrafBarra() {
		return GrafBarra;
	}

	public void setGrafBarra(BarChartModel grafBarra) {
		GrafBarra = grafBarra;
	}


	public Date getFechaIncio() {
		return fechaIncio;
	}

	public void setFechaIncio(Date fechaIncio) {
		this.fechaIncio = fechaIncio;
	}

	public Date getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}


	public List<LitrosPorCombustible> getListaLitrosxCombustible() {
		return listaLitrosxCombustible;
	}


	public void setListaLitrosxCombustible(List<LitrosPorCombustible> listaLitrosxCombustible) {
		this.listaLitrosxCombustible = listaLitrosxCombustible;
	}
	
	
}
