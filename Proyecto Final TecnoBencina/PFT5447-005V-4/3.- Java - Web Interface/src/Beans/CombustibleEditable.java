package Beans;

import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Combustible;

public class CombustibleEditable {
	private Combustible cmb;
	private boolean editable;
	private boolean editad;
	
	public Combustible getCmb() {
		return cmb;
	}
	public void setCmb(Combustible cmb) {
		this.cmb = cmb;
	}
	public boolean isEditad() {
		return editad;
	}
	public void setEditad(boolean editad) {
		this.editad = editad;
	}
	public boolean isEditable() {
		return editable;
	}
	public void setEditable(boolean editable) {
		this.editable = editable;
	}
}
