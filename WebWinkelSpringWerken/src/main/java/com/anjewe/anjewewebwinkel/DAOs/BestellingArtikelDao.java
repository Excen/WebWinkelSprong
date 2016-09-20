


package com.anjewe.anjewewebwinkel.DAOs;

import com.anjewe.anjewewebwinkel.DAOGenerics.GenericDaoImpl;
import com.anjewe.anjewewebwinkel.POJO.BestellingArtikel;
import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

/**
 * @author Excen
*/

@Repository
public class BestellingArtikelDao extends GenericDaoImpl <BestellingArtikel, Long>{

private static final Logger log = LoggerFactory.getLogger(BestellingArtikelDao.class);

    public BestellingArtikelDao(){
        super();
    }
    
    public ArrayList<BestellingArtikel> readByBestellingId (Long Id){
         
        String sqlQuery = "select * from koppelbestellingartikel where bestelling_id = " + Id;
        Session session = getSession();
        Query query = session.createQuery(sqlQuery);
        return (ArrayList<BestellingArtikel>) query.list();
    }

}
