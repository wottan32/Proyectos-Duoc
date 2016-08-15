package Beans;

import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Talonario;

public class TalonarioEdit {
	private Talonario talonarioE;
	private String fechaEntrega;
	
	
	public Talonario getTalonarioE() {
		return talonarioE;
	}
	public void setTalonarioE(Talonario talonarioE) {
		this.talonarioE = talonarioE;
	}
	public String getFechaEntrega() {
		return fechaEntrega;
	}
	public void setFechaEntrega(String fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}
	
}
