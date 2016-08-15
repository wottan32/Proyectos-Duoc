package Beans;

import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Combustible;

public class LitrosPorCombustible {
	private Combustible cmb;
	private String Litros;
	public Combustible getCmb() {
		return cmb;
	}
	public void setCmb(Combustible cmb) {
		this.cmb = cmb;
	}
	public String getLitros() {
		return Litros;
	}
	public void setLitros(String litros) {
		Litros = litros;
	}
}
