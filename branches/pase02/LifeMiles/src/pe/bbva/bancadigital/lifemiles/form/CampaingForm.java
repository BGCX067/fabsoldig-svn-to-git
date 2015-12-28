package pe.bbva.bancadigital.lifemiles.form;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class CampaingForm extends ActionForm {

	private String cmbTipoDocumento;
	private String txtNumeroDocumento;
	private String txtNombres;
	private String txtApellidoPaterno;
	private String txtApellidoMaterno;
	private String txtTelefono;
	private String cmbOperador;
	private String txtCelular;
	private String txtCorreo;
	private String cmbDepartamento;
	private String cmbProvincia;
	private String txtRentaMensual;
	private String chkAutTDP;
	private String chkTyC;
	private String txtCaptcha;
	
	private String flgSms;
	private String flgMail;

	public CampaingForm() {
		super();
		this.cmbTipoDocumento = "";
		this.txtNumeroDocumento = "";
		this.txtNombres = "";
		this.txtApellidoPaterno = "";
		this.txtApellidoMaterno = "";
		this.txtTelefono = "";
		this.cmbOperador = "";
		this.txtCelular = "";
		this.txtCorreo = "";
		this.cmbDepartamento = "";
		this.cmbProvincia = "";
		this.txtRentaMensual = "";
		this.chkAutTDP = "";
		this.chkTyC = "";
		this.txtCaptcha = "";
		this.flgSms = "";
		this.flgMail = "";
	}

	public String getCmbTipoDocumento() {
		return cmbTipoDocumento;
	}

	public void setCmbTipoDocumento(String cmbTipoDocumento) {
		this.cmbTipoDocumento = cmbTipoDocumento;
	}

	public String getTxtNumeroDocumento() {
		return txtNumeroDocumento;
	}

	public void setTxtNumeroDocumento(String txtNumeroDocumento) {
		this.txtNumeroDocumento = txtNumeroDocumento;
	}

	public String getTxtNombres() {
		return txtNombres;
	}

	public void setTxtNombres(String txtNombres) {
		this.txtNombres = txtNombres;
	}

	public String getTxtApellidoPaterno() {
		return txtApellidoPaterno;
	}

	public void setTxtApellidoPaterno(String txtApellidoPaterno) {
		this.txtApellidoPaterno = txtApellidoPaterno;
	}

	public String getTxtApellidoMaterno() {
		return txtApellidoMaterno;
	}

	public void setTxtApellidoMaterno(String txtApellidoMaterno) {
		this.txtApellidoMaterno = txtApellidoMaterno;
	}

	public String getTxtTelefono() {
		return txtTelefono;
	}

	public void setTxtTelefono(String txtTelefono) {
		this.txtTelefono = txtTelefono;
	}

	public String getCmbOperador() {
		return cmbOperador;
	}

	public void setCmbOperador(String cmbOperador) {
		this.cmbOperador = cmbOperador;
	}

	public String getTxtCelular() {
		return txtCelular;
	}

	public void setTxtCelular(String txtCelular) {
		this.txtCelular = txtCelular;
	}

	public String getTxtCorreo() {
		return txtCorreo;
	}

	public void setTxtCorreo(String txtCorreo) {
		this.txtCorreo = txtCorreo;
	}

	public String getCmbDepartamento() {
		return cmbDepartamento;
	}

	public void setCmbDepartamento(String cmbDepartamento) {
		this.cmbDepartamento = cmbDepartamento;
	}

	public String getCmbProvincia() {
		return cmbProvincia;
	}

	public void setCmbProvincia(String cmbProvincia) {
		this.cmbProvincia = cmbProvincia;
	}

	public String getTxtRentaMensual() {
		return txtRentaMensual;
	}

	public void setTxtRentaMensual(String txtRentaMensual) {
		this.txtRentaMensual = txtRentaMensual;
	}

	public String getChkAutTDP() {
		return chkAutTDP;
	}

	public void setChkAutTDP(String chkAutTDP) {
		this.chkAutTDP = chkAutTDP;
	}

	public String getChkTyC() {
		return chkTyC;
	}

	public void setChkTyC(String chkTyC) {
		this.chkTyC = chkTyC;
	}

	public String getTxtCaptcha() {
		return txtCaptcha;
	}

	public void setTxtCaptcha(String txtCaptcha) {
		this.txtCaptcha = txtCaptcha;
	}
	
	public String getFlgSms() {
		return flgSms;
	}

	public void setFlgSms(String flgSms) {
		this.flgSms = flgSms;
	}

	public String getFlgMail() {
		return flgMail;
	}

	public void setFlgMail(String flgMail) {
		this.flgMail = flgMail;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException ex) {
			ex.printStackTrace();
		}
		super.reset(mapping, request);
	}

}