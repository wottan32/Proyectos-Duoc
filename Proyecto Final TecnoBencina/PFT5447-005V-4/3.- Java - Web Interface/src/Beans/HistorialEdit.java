package Beans;

import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.HistorialPrecio;

public class HistorialEdit {
	private HistorialPrecio historial;
	private String feha;
	
	public HistorialPrecio getHistorial() {
		return historial;
	}
	public void setHistorial(HistorialPrecio historial) {
		this.historial = historial;
	}
	public String getFeha() {
		return feha;
	}
	public void setFeha(String feha) {
		this.feha = feha;
	}
	
}
