package Beans;

import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Usuario;

public class UserEditable {
	private Usuario usuario;
	private boolean editable;
	private boolean editado;
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
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
