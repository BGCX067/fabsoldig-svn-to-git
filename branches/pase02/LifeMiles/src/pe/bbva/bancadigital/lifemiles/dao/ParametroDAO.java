package pe.bbva.bancadigital.lifemiles.dao;

import java.util.List;
import java.util.Map;


public interface ParametroDAO {

	public Map<String, String> getOfferByCustomer(Map<String, String> datosCliente);
	
	public Map<String, String> addInterestedCustomer(Map<String, String> datosCliente);
	
	public Map<String, String> existCustomerInCampaing(Map<String, String> datosCliente);
	
	public List<Map<String, String>> getAllDepartamentos();
	
	public List<Map<String, String>> getProvinciasByDpto(String departamento);
	
	public Map<String, String> getPersonByDNI(String dni);
	
	public Map<String, String> getInscritoByDocumento(Map<String, String> datosCliente);
	
}