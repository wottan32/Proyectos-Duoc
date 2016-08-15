package Beans;


import java.util.List;

import Beans.HistorialEdit;

public class HistorialCombustible {
	private List<HistorialEdit> historial;
	private String Nombre;

	public List<HistorialEdit> getHistorial() {
		return historial;
	}

	public void setHistorial(List<HistorialEdit> historial) {
		this.historial = historial;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String nombre) {
		Nombre = nombre;
	}
	
}
