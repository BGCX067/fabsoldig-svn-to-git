package pe.bbva.bancadigital.lifemiles.util;

import java.math.BigDecimal;

public interface Constant {

	public static final String MESSAGES_INF_KEY = "messageInfo";
	public static final String MESSAGES_ERR_KEY = "messageError";
	
	public static final BigDecimal CERO = BigDecimal.ZERO;
	public static final BigDecimal UNO = BigDecimal.ONE;
	public static final BigDecimal DIEZ = new BigDecimal(10);
	public static final BigDecimal CIEN = new BigDecimal(100);
	public static final BigDecimal MIL = new BigDecimal(1000);
	public static final BigDecimal DIEZ_MIL = new BigDecimal(10000);
	public static final BigDecimal CIEN_MIL = new BigDecimal(100000);
	public static final BigDecimal MILLON = new BigDecimal(1000000);
	public static final BigDecimal DIEZ_MILLON = new BigDecimal(10000000);
	
	public static final String PATRON_REFERIDOS = "^[0-9][0-9]$";
	public static final String PATRON_PROACTIVO = "^[A-Z][0-9]$";
	public static final String PATRON_CLASICO = "^[0-9][A-Z]$";
	
	public static final String SI = "S";
	public static final String NO = "N";
	
	public static final String RESPUESTA_EXITOSA = "0000";
	public static final String RESPUESTA_FALLIDA = "9999";
	
	public static final String PATRON_MONEDA = "###,###.00";
	public static final String LOCALIZACION = "es_PE";
	
	public enum TipoCliente {

	    VENTA_APROBADA ("101"),
		VENTA_REGULAR ("102"),
		LISTA_NEGRA ("999");	    

	    private String tipoCliente;

	    TipoCliente(String tipoCliente) {
	        this.tipoCliente = tipoCliente;
	    }

	    public String getTipoCliente() {
	        return this.tipoCliente;
	    }

	  };
}
