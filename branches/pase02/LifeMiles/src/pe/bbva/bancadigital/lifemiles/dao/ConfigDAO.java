package pe.bbva.bancadigital.lifemiles.dao;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.DaoManagerBuilder;

public class ConfigDAO {
	private static final String resource = "pe/bbva/bancadigital/lifemiles/dao/dao.xml";
	  private static final DaoManager daoManager;

	    static {
	      try {
	        daoManager = newDaoManager();
	      } catch (Exception e) {
	        throw new RuntimeException("Descripcion.  Cause: " + e, e);
	      }

	    }

	  public static DaoManager getDaoManager() {
	    return daoManager;
	  }

	  public static DaoManager newDaoManager() {
	    try {
	    	Reader reader = Resources.getResourceAsReader(resource);
	    	return DaoManagerBuilder.buildDaoManager(reader, null);
	    } catch (Exception e) {
	      throw new RuntimeException("Imposible iniciar ConfigDAO.  Causa: " + e, e);
	    }
	  }
}


