package pe.bbva.bancadigital.lifemiles.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import pe.bbva.bancadigital.lifemiles.dao.ConfigDAO;
import pe.bbva.bancadigital.lifemiles.dao.ParametroDAO;
import pe.bbva.bancadigital.lifemiles.util.GenericObject;
import pe.bbva.bancadigital.lifemiles.util.ReadProperties;

import com.grupobbva.pe.sms.EnviarSMS;
import com.grupobbva.pe.sms.EnviarSMSServiceLocator;
import com.ibatis.dao.client.DaoManager;

public class ParametroServiceImpl implements ParametroService {

	private DaoManager daoMgr;
	private ParametroDAO parametroDAO;
	
	private static Logger logger = Logger.getLogger(ParametroServiceImpl.class);
	
	public ParametroServiceImpl() {
		try {
			daoMgr       = ConfigDAO.getDaoManager();
			parametroDAO = (ParametroDAO) daoMgr.getDao(ParametroDAO.class);
		} catch (Exception e) {
			logger.error(GenericObject.formatException(e));
		}
	}	
	
	public Map<String, String> getOfferByCustomer(Map<String, String> datosCliente) {
		return parametroDAO.getOfferByCustomer(datosCliente);
	}

	
	public Map<String, String> addInterestedCustomer(Map<String, String> datosCliente) {
		return parametroDAO.addInterestedCustomer(datosCliente);
	}
	
	public Map<String, String> existCustomerInCampaing(Map<String, String> datosCliente) {
		return parametroDAO.existCustomerInCampaing(datosCliente);
	}
	
	public List<Map<String, String>> getAllDepartamentos() {
		return parametroDAO.getAllDepartamentos();
	}
	
	public List<Map<String, String>> getProvinciasByDpto(String departamento) {
		return parametroDAO.getProvinciasByDpto(departamento);
	}
	
	public Map<String, String> getPersonByDNI(String dni) {
		return parametroDAO.getPersonByDNI(dni);
	}
	
	public Map<String, String> getInscritoByDocumento(Map<String, String> datosCliente) {
		return parametroDAO.getInscritoByDocumento(datosCliente);
	}
	
	/***
	 * 
	 * INTEGRACION ENVIO SMS y EMAIL
	 * 
	 * **/
	
	public void enviarSMS(Map<String, String> datosCliente) {
		try{
			EnviarSMSServiceLocator serviceLocator = null;
			EnviarSMS sms = null;
			String nroOperacion ="";
			String msjTexto ="";
			String celular ="";
			String operador ="";
			String operadorURL ="";
			serviceLocator = new EnviarSMSServiceLocator();
		    
			//Datos de Prueba
			Integer aleatorio = new Double((Math.random()*1000000)).intValue();
			nroOperacion = StringUtils.leftPad(aleatorio.toString(), 7, "1");
			msjTexto ="Cada vez estás más cerca de ser parte de la experiencia BBVA Continental LifeMiles. En las próximas 48hrs un asesor especializado te contactará para sorprenderte con los beneficios que tenemos pensados para ti";
			celular = datosCliente.get("celular");
			operador = datosCliente.get("operador");
			if("M".equalsIgnoreCase(operador)) {
				operadorURL ="595.movistar.pe";
			} else if("C".equalsIgnoreCase(operador)) {
				operadorURL ="595.claro.pe";
			} else {
				operadorURL ="";
			}
			
			if(StringUtils.isNotBlank(operadorURL) && StringUtils.isNotBlank(celular)) {
			    sms = serviceLocator.getEnviarSMS();
			    sms.enviar(nroOperacion, msjTexto, celular, operadorURL);
			}
		}catch(Exception e){
			logger.error(GenericObject.formatException(e));
		}
	}	
	
	public void enviarEmail(int tipoEmail, Map<String, String> datosCliente){
		try{
			
			String mensajeCompleto ="";
			
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtpscl.masterrelay.com");
			props.put("mail.smtp.socketFactory.port", "25");
			props.put("mail.smtp.socketFactory.class",
					"javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "25");
	 
			Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						//aqui falta usuario y clave para crear la sesion
						return new PasswordAuthentication("arturo.marca@bbva.com","Az9MarcA2");
					}
				});
			
			
			Message message = new MimeMessage(session);
			// correos FROM y TO
			message.setFrom(new InternetAddress("IyC@grupobbva.com.pe"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse("alexander.chiroque@bbva.com"));
			message.setSubject("Testing Correo LifeMiles...");
			
			
			//Carga la plantilla
			String cuerpoMensaje = cargarCuerpoMensaje();
			
			//Carga el mensaje personalizado de acuerdo a la validación devuelta de BD
			String msjPersonalizado = generarMsjPersonalizado(tipoEmail, datosCliente);
			
			//Completa la plantilla con el mensaje personalizado
			mensajeCompleto = generarMsjCompleto(cuerpoMensaje, msjPersonalizado);
			
			
			System.out.println(mensajeCompleto);
			
			
			message.setContent(mensajeCompleto, "text/html");
			Transport.send(message);
			
		}catch(Exception e){
			logger.error(GenericObject.formatException(e));
		}
	}
	
	private String generarMsjCompleto(String cuerpoMensaje,String msjPersonalizado) {
		String mensajeCompleto="";
		try{
			mensajeCompleto = cuerpoMensaje.replace("<table id='tblMensaje'></table>", msjPersonalizado);
		}catch(Exception e){
			logger.error(GenericObject.formatException(e));
			mensajeCompleto ="";
		}
		return mensajeCompleto;
	}

	private String cargarCuerpoMensaje(){
		String cuerpoMensaje ="";
		String rutaPlantilla = "";
		ReadProperties rp = new ReadProperties();
		FileReader fr = null;
		BufferedReader br = null;
		try{
			
			File archivo = new File (rp.getProperty("rutaPlantilla"));
			if(archivo.exists()){
				fr = new FileReader (archivo);
				br = new BufferedReader(fr);
		 
		        // Lectura del fichero
		        String linea;
		        while((linea=br.readLine())!=null)
		        	cuerpoMensaje = cuerpoMensaje+linea;
		      }
		}catch(Exception e){
			logger.error(GenericObject.formatException(e));
			cuerpoMensaje="";
		}finally{
	         // En el finally cerramos el fichero, para asegurarnos
	         // que se cierra tanto si todo va bien como si salta 
	         // una excepcion.
	         try{                    
	            if( null != fr ){   
	               fr.close();     
	            }                  
	         }catch (Exception e2){ 
	            e2.printStackTrace();
	         }
	      }
		return cuerpoMensaje;
	}
	
	private String generarMsjPersonalizado(int tipoEmail, Map<String, String> datosCliente){
		ReadProperties rp = new ReadProperties();
		String msjPersonalizado = "";
		
		try{
			switch (tipoEmail){
			
				case 1: msjPersonalizado = rp.getProperty("email.venta.baseaprobada");
				break;
				
				case 2: msjPersonalizado = rp.getProperty("email.venta.regular");
				break;
				
				case 3: msjPersonalizado = rp.getProperty("email.migracion.201");
				break;
				
				case 4: msjPersonalizado = rp.getProperty("email.migracion.202");
				break;
				
				case 5: msjPersonalizado = rp.getProperty("email.migracion.203");
				break;
				
				case 6: msjPersonalizado = rp.getProperty("email.migracion.204");
				break;
				
				case 7: msjPersonalizado = rp.getProperty("email.migracion.205");
				break;
				
				case 8: msjPersonalizado = rp.getProperty("email.migracion.206");
				break;
				
				case 9: msjPersonalizado = rp.getProperty("email.migracion.207");
				break;
				
				case 10: msjPersonalizado = rp.getProperty("email.migracion.208");
				break;
				
				default: msjPersonalizado = "";
				break;
			}
			
			String nombre = datosCliente.get("nombre")==null?"":datosCliente.get("nombre").toString().toUpperCase();
			
			msjPersonalizado = msjPersonalizado.replace("@name", nombre);
			
		
		}catch(Exception e){
			logger.error(GenericObject.formatException(e));
			msjPersonalizado = "";
		}
		return msjPersonalizado;
	}
	
	public static void main(String[] args) {
		Integer aleatorio = new Double((Math.random()*1000000)).intValue();
		String semilla = StringUtils.leftPad(aleatorio.toString(), 7, "1");
		System.out.println(semilla);
	}
	
	
	
}