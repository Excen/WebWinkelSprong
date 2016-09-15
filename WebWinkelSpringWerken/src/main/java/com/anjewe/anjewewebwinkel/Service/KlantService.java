


package com.anjewe.anjewewebwinkel.Service;

import com.anjewe.anjewewebwinkel.DAOGenerics.GenericDaoImpl;
import com.anjewe.anjewewebwinkel.POJO.Klant;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Wendy
 */
@Transactional
@Service
public class KlantService implements GenericServiceInterface <Klant, Long> {

private static final Logger log = LoggerFactory.getLogger(KlantService.class);


    @Autowired
    protected GenericDaoImpl <Klant, Long> klantDao; 
    @Autowired
    Klant klant; 
    
    @Override
    public Klant voegNieuweBeanToe(Long Id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Long voegNieuweBeanToe(Klant klant) {
       Long klantId = klantDao.insert(klant);
       return klantId;
    }

    @Override
    public Klant zoekNaarBean(Long Id) {
        klant = klantDao.readById(Id);
        return klant;     
    }

    @Override
    public Long zoekNaarBean(Klant klant) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Klant> zoekAlleBeans() {
        ArrayList<Klant>klantenLijst = (ArrayList<Klant>)klantDao.readAll(Klant.class);
        return klantenLijst;
    }

    @Override
    public Klant wijzigBeanGegevens(Long id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override // allemaal nodig?
    public Klant wijzigBeanGegevens(Klant klant) {
       
        Klant gewijzigdeKlant = new Klant();
        gewijzigdeKlant = (Klant)klantDao.readById(klant.getId());
        if (gewijzigdeKlant!= null){
            gewijzigdeKlant.setAchternaam(klant.getAchternaam());
            gewijzigdeKlant.setTussenvoegsel(klant.getTussenvoegsel());
            gewijzigdeKlant.setVoornaam(klant.getVoornaam());
            gewijzigdeKlant.setEmail(klant.getEmail());
            gewijzigdeKlant.setKlantNummer(klant.getKlantNummer());
            gewijzigdeKlant.setBestellingen(klant.getBestellingen());
            gewijzigdeKlant.setBetalingen(klant.getBetalingen());
            gewijzigdeKlant.setFacturen(klant.getFacturen());
            gewijzigdeKlant.setKlantAdressen(klant.getKlantAdressen());
            gewijzigdeKlant.setAccount(klant.getAccount());
        }
        klantDao.update(gewijzigdeKlant);
        return gewijzigdeKlant;
    }

    @Override
    public boolean verwijderBeanGegevens(Long Id) {        
        boolean deleted = klantDao.deleteById(Id);
        return deleted; 
    }

    @Override
    public int verwijderAlleBeans() {
        int verwijderdAantal = klantDao.deleteAll(Klant.class);
        return verwijderdAantal; 
    }


}


