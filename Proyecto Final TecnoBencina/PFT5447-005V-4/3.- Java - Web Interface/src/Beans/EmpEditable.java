package Beans;

import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Empresa;

public class EmpEditable {
	private Empresa emp;
	private boolean editable;
	private boolean editado;
	public Empresa getEmp() {
		return emp;
	}
	public void setEmp(Empresa emp) {
		this.emp = emp;
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
