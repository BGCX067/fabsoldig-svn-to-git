package pe.bbva.bancadigital.lifemiles.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import pe.bbva.bancadigital.lifemiles.service.BaseSqlMapDao;

import com.ibatis.dao.client.DaoManager;

public class ParametroDAOImpl extends BaseSqlMapDao implements ParametroDAO {
	
	private static Logger logger = Logger.getLogger(ParametroDAOImpl.class);
	
	public ParametroDAOImpl(DaoManager daoManager){
		super(daoManager);
	}
	
	public Map<String, String> getOfferByCustomer(Map<String, String> datosCliente) {
		return (Map<String, String>) queryForObject("LifeMiles.getOfferByCustomer", datosCliente);
	}
	
	public Map<String, String> addInterestedCustomer(Map<String, String> datosCliente) {
		Map<String, String> mapResult = new HashMap<String, String>();
		insert("LifeMiles.addInterestedCustomer", datosCliente);
		return mapResult;
	}
	
	public Map<String, String> existCustomerInCampaing(Map<String, String> datosCliente) {
		return (Map<String, String>) queryForObject("LifeMiles.existCustomerInCampaing", datosCliente);
	}
	
	public List<Map<String, String>> getAllDepartamentos() {
		return (List<Map<String, String>>) queryForList("LifeMiles.getAllDepartamentos");
	}
	
	public List<Map<String, String>> getProvinciasByDpto(String departamento) {
		return (List<Map<String, String>>) queryForList("LifeMiles.getProvinciasByDpto", departamento);
	}
	
	public Map<String, String> getPersonByDNI(String dni) {
		return (Map<String, String>) queryForObject("LifeMiles.getPersonByDNI", dni);
	}
	
	public Map<String, String> getInscritoByDocumento(Map<String, String> datosCliente) {
		List<Map<String, String>> listInscrito = (List<Map<String, String>>) queryForList("LifeMiles.getInscritoByDocumento", datosCliente);
		Map<String, String> inscrito = new HashMap<String, String>();
		if(listInscrito!=null && listInscrito.size()>0) {
			inscrito = listInscrito.get(0);
		}
		return inscrito;
	}
	
}
