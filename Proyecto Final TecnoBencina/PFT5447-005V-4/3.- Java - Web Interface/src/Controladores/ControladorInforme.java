package Controladores;


import java.util.Date;

import javax.annotation.PostConstruct;

import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.ChartSeries;

public class ControladorInforme {
	private BarChartModel GrafBarra;
	private Date fechaIncio;
	private Date fechaFin;
	
	@PostConstruct
	public void IniciarInforme()
	{
		CrearGRafico();
	}

	private void CrearGRafico() {
		GrafBarra = initBarModel();
		GrafBarra.setTitle("Bar Charts");
		GrafBarra.setAnimate(true);
		GrafBarra.setLegendPosition("ne");
		Axis yAxis = GrafBarra.getAxis(AxisType.Y);
        yAxis.setMin(0);
        yAxis.setMax(200);
	}

	private BarChartModel initBarModel() {
		BarChartModel model = new BarChartModel();
		 
        ChartSeries boys = new ChartSeries();
        boys.setLabel("Boys");
        boys.set("2004", 120);
        boys.set("2005", 100);
        boys.set("2006", 44);
        boys.set("2007", 150);
        boys.set("2008", 25);
 
        ChartSeries girls = new ChartSeries();
        girls.setLabel("Girls");
        girls.set("2004", 52);
        girls.set("2005", 60);
        girls.set("2006", 110);
        girls.set("2007", 135);
        girls.set("2008", 120);
 
        model.addSeries(boys);
        model.addSeries(girls);
         
        return model;
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

	
}
