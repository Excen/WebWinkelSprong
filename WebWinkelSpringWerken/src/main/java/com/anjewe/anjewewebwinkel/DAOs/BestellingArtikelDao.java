


package com.anjewe.anjewewebwinkel.DAOs;

import com.anjewe.anjewewebwinkel.DAOGenerics.GenericDaoImpl;
import com.anjewe.anjewewebwinkel.POJO.BestellingArtikel;
import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Excen
*/

@Transactional
@Repository
public class BestellingArtikelDao extends GenericDaoImpl <BestellingArtikel, Long>{

private static final Logger log = LoggerFactory.getLogger(BestellingArtikelDao.class);

    public BestellingArtikelDao(){
        super();
    }
    
    public ArrayList<BestellingArtikel> readByBestellingId (Long Id){
         
        String hqlQuery = "FROM BestellingArtikel ba WHERE ba.bestelling = " + Id;
        Session session = getSession();
        Query query = session.createQuery(hqlQuery);
        return (ArrayList<BestellingArtikel>) query.list();
    }
    
}
