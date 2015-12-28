package pe.bbva.bancadigital.lifemiles.util;

import java.util.Properties;
import java.util.ResourceBundle;

public class ReadProperties {
	public static Properties prop;
	public static ResourceBundle bundle = ResourceBundle.getBundle("lifeMiles");
	
	public ReadProperties(){		
	}

	public String getProperty(String key){
		String valor="";
		valor=bundle.getString(key);
		if(valor==null){
			valor="";
		}
		return valor;
	}
	

}
