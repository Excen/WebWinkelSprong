


package com.anjewe.anjewewebwinkel.Service;

import com.anjewe.anjewewebwinkel.DAOGenerics.GenericDaoImpl;
import com.anjewe.anjewewebwinkel.POJO.Adres;
import com.anjewe.anjewewebwinkel.POJO.Klant;
import com.anjewe.anjewewebwinkel.POJO.KlantAdres;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Wendy
 */
@Service
public class KlantService implements GenericServiceInterface <Klant, Long> {

private static final Logger log = LoggerFactory.getLogger(KlantService.class);



    @Autowired
    protected GenericDaoImpl <Klant, Long> klantDao; 
    @Autowired
    protected GenericDaoImpl <KlantAdres, Long> klantadresDao;
    @Autowired
    Klant klant; 
    @Autowired
    Adres adres;
    
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

    @Override
    public boolean isBeanUniek(long id, String username) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public List<Adres> zoekAdressenBijKlant(Klant k){
        List <Adres> lijst = new ArrayList<>();
        ArrayList<KlantAdres> KA = (ArrayList<KlantAdres>) klantadresDao.readAll(KlantAdres.class);
        for(KlantAdres ka : KA){
            klant = ka.getKlant();
            if (Objects.equals(k.getId(), klant.getId())){
                adres = ka.getAdres();
                lijst.add(adres);
            } 
        }
        return lijst;
    }

}


