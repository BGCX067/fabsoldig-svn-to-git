package pe.bbva.bancadigital.lifemiles.dao;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;


/**
 * @author  Indra
 */
public class SqlMapConfig {
    private static final String resource = "pe/bbva/bancadigital/lifemiles/sqlmap/sql-map-config.xml";
    private static SqlMapClient sqlMap;
   /**
    * Crea el mapeo del clase al SqlMapConfig.xml y lo guarda en un objeto SqlMapClient
    */
    private static void configSQLMAP() {
        if (sqlMap == null) {
            try {
                Reader reader = Resources.getResourceAsReader(resource);
                sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    /**
	 * ejecuta el método configSQLMAP
	 * @return  Devuelve un objeto SqlMapClient
	 * @uml.property  name="sql"
	 */
    public static SqlMapClient getSqlMap(){
        configSQLMAP();
        return sqlMap;
    }
}

