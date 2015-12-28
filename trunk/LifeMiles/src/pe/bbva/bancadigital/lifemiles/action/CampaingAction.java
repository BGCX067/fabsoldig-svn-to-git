package pe.bbva.bancadigital.lifemiles.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import pe.bbva.bancadigital.lifemiles.form.CampaingForm;
import pe.bbva.bancadigital.lifemiles.service.ParametroService;
import pe.bbva.bancadigital.lifemiles.service.ParametroServiceImpl;
import pe.bbva.bancadigital.lifemiles.util.GenericObject;

import static pe.bbva.bancadigital.lifemiles.util.Constant.*;

public class CampaingAction extends DispatchAction{
	
	private static Logger logger = Logger.getLogger(CampaingAction.class);

	private ParametroService parametrosService = null;
	
	public CampaingAction() {
		parametrosService = new ParametroServiceImpl();
	}
	
	public ActionForward campaingForm(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("campaingForm");
		return mapping.findForward("campaingForm");
	}
	
	public ActionForward campaingBlackList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("campaingBlackList");
		return mapping.findForward("campaingBlackList");
	}
	
	public ActionForward campaingInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("campaingInfo");
		CampaingForm campaingForm = (CampaingForm) form;
		String redireccion = "campaingInfo";
		
    	Map<String, String> datosCliente = new HashMap<String, String>();
		datosCliente.put("tipoDocumento", campaingForm.getCmbTipoDocumento());
		datosCliente.put("numeroDocumento", campaingForm.getTxtNumeroDocumento());
		datosCliente.put("nombres", campaingForm.getTxtNombres());
		datosCliente.put("apellidoPaterno", campaingForm.getTxtApellidoPaterno());
		//datosCliente.put("apeMat", campaingForm.getTxtApellidoMaterno());
		datosCliente.put("operador",campaingForm.getCmbOperador());
		datosCliente.put("telefono", campaingForm.getTxtTelefono());
		//datosCliente.put("celular", campaingForm.getTxtCelular());
		datosCliente.put("correo", campaingForm.getTxtCorreo());
		datosCliente.put("departamento", campaingForm.getCmbDepartamento());
		datosCliente.put("provincia", campaingForm.getCmbProvincia());
		//datosCliente.put("rentaMensual", campaingForm.getTxtRentaMensual());
		datosCliente.put("flagDatosPersonales", campaingForm.getChkAutTDP());
		//datosCliente.put("terminos", campaingForm.getChkTyC());
		
		logger.info("datosCliente: " + datosCliente);
		
		saveCampaingAjax(datosCliente);
		
		Map<String, String> clienteBase = new HashMap<String, String>();
		try {
				//clienteBase = parametrosService.getOfferByCustomer(datosCliente);
				clienteBase = parametrosService.getInscritoByDocumento(datosCliente);
				/*
				if(clienteBase == null) {
					clienteBase = parametrosService.getPersonByDNI(campaingForm.getTxtNumeroDocumento());
				}
				*/
				if(("999".equalsIgnoreCase(clienteBase.get("TIP_CLIENTE"))) || ("208".equalsIgnoreCase(clienteBase.get("TIP_CLIENTE")))) {
					redireccion = "campaingBlackList";
				}else{
				}
				
			logger.info("clienteBase: " + clienteBase);
		} catch(Exception e) {
			logger.error(GenericObject.formatException(e));
		}
		
		request.setAttribute("clienteBase", clienteBase);
		logger.info("Antes de retornar valor");
		    	
		    	
		
		return mapping.findForward(redireccion);
	}
	
	public Map<String, String> existCustomerInCampaingAjax(Map<String, String> datosCliente) {
		logger.info("datosCliente: " + datosCliente);
		Map<String, String> clienteCampanha = new HashMap<String, String>();
		try {
			clienteCampanha = parametrosService.existCustomerInCampaing(datosCliente);
			logger.info("clienteCampanha: " + clienteCampanha);
		} catch(Exception e) {
			logger.error(GenericObject.formatException(e));
		}
		logger.info("Antes de retornar valor");
		return clienteCampanha;
	}
	
	public Map<String, String> getOfferByCustomerAjax(Map<String, String> datosCliente) {
		logger.info("datosCliente: " + datosCliente);
		Map<String, String> clienteBase = new HashMap<String, String>();
		try {
			clienteBase = parametrosService.getOfferByCustomer(datosCliente);
			logger.info("clienteBase: " + clienteBase);
		} catch(Exception e) {
			logger.error(GenericObject.formatException(e));
		}
		logger.info("Antes de retornar valor");
		return clienteBase;
	}
	
	public String saveCampaingAjax(Map<String, String> datosCliente) {
		logger.info("saveCampaingAjax");
		try {
			Map<String, String> clienteBase = parametrosService.getOfferByCustomer(datosCliente);
			Map<String, String> datosCompletar = parametrosService.getPersonByDNI(datosCliente.get("numeroDocumento"));
			if(clienteBase != null) {
				if(StringUtils.isNotBlank(clienteBase.get("NOMBRES"))) {
					datosCliente.put("nombres", clienteBase.get("NOMBRES"));
				} else if(datosCompletar!=null) {
					datosCliente.put("nombres", datosCompletar.get("NOMBRES"));
				}
				if(StringUtils.isNotBlank(clienteBase.get("APE_PATERNO"))) {
					datosCliente.put("apellidoPaterno", clienteBase.get("APE_PATERNO"));
				} else if(datosCompletar!=null) {
					datosCliente.put("apellidoPaterno", datosCompletar.get("APE_PATERNO"));
				}
				if(StringUtils.isNotBlank(clienteBase.get("APE_MATERNO"))) {
					datosCliente.put("apellidoMaterno", clienteBase.get("APE_MATERNO"));
				} else if(datosCompletar!=null) {
					datosCliente.put("apellidoMaterno", datosCompletar.get("APE_MATERNO"));
				}
				
				datosCliente.put("tipoCliente", clienteBase.get("TIP_CLIENTE"));
			} else {
				if(datosCompletar != null) {
					datosCliente.put("nombres", datosCompletar.get("NOMBRES"));
					datosCliente.put("apellidoPaterno", datosCompletar.get("APE_PATERNO"));
					datosCliente.put("apellidoMaterno", datosCompletar.get("APE_MATERNO"));
				}
				datosCliente.put("tipoCliente", TipoCliente.VENTA_REGULAR.getTipoCliente());
			}
			Map<String, String> clienteInscrito = parametrosService.addInterestedCustomer(datosCliente);
			logger.info("clienteInscrito: " + datosCliente);
		} catch(Exception e) {
			logger.error(GenericObject.formatException(e));
		}
		return "Una nueva experiencia viene en camino...";
	}
	
	
	public Map<String, String> getPersonByIdAjax(Map<String, String> datosCliente) {
		logger.info("getPersonByIdAjax: " + datosCliente);
		Map<String, String> datosCompletar = new HashMap<String, String>();
		try {
			datosCompletar = parametrosService.getPersonByDNI(datosCliente.get("numeroDocumento"));
			logger.info("datosCompletar: " + datosCompletar);
		} catch(Exception e) {
			logger.error(GenericObject.formatException(e));
		}
		logger.info("Antes de retornar valor");
		return datosCompletar;
	}
	
}
