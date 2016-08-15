package Beans;

import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.BeneficiarioCredito;

public class BeneficiarioEditable {
	private BeneficiarioCredito oBeneficiario;
	private String fecha;
	private boolean editable;
	private boolean editado;
	
	
	
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public BeneficiarioCredito getoBeneficiario() {
		return oBeneficiario;
	}
	public void setoBeneficiario(BeneficiarioCredito oBeneficiario) {
		this.oBeneficiario = oBeneficiario;
	}
	public boolean isEditable() {
		return editable;
	}
	public void setEditable(boolean editable) {
		this.editable = editable;
	}
	public boolean isEditado() {
		return editado;
	}
	public void setEditado(boolean editado) {
		this.editado = editado;
	}
	
	
}
