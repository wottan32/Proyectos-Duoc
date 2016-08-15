package Beans;

import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.BeneficiarioCredito;

public class BeneficiarioEdit {
	private BeneficiarioCredito ben;
	private String fecha;
	private boolean creado;
	public BeneficiarioCredito getBen() {
		return ben;
	}
	public void setBen(BeneficiarioCredito ben) {
		this.ben = ben;
	}
	public boolean isCreado() {
		return creado;
	}
	public void setCreado(boolean creado) {
		this.creado = creado;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	
	
}
