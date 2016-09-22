/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anjewe.anjewewebwinkel.Service;


import com.anjewe.anjewewebwinkel.DAOGenerics.GenericDaoImpl;
import com.anjewe.anjewewebwinkel.DAOs.AdresDao;
import com.anjewe.anjewewebwinkel.DAOs.KlantAdresDao;
import com.anjewe.anjewewebwinkel.DAOs.KlantDao;
import com.anjewe.anjewewebwinkel.POJO.Adres;
import com.anjewe.anjewewebwinkel.POJO.Klant;
import com.anjewe.anjewewebwinkel.POJO.KlantAdres;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author Anne
 */

@Component
public class AdresService implements GenericServiceInterface <Adres, Long>{
     
    
    
    private static final Logger logger = (Logger) LoggerFactory.getLogger("com.anjewe.anjewewebwinkel");
    private static final Logger errorLogger = (Logger) LoggerFactory.getLogger("com.anjewe.anjewewebwinkel.err");
    private static final Logger testLogger = (Logger) LoggerFactory.getLogger("com.anjewe.anjewewebwinkel.test");
   
    @Autowired 
    Klant klant; 
    @Autowired 
    Adres adres;    
    ArrayList<Adres> adressenLijst = new ArrayList();
    @Autowired
    protected GenericDaoImpl<Adres, Long> adresDao = new AdresDao();
    @Autowired
    protected GenericDaoImpl<Klant, Long> klantDao = new KlantDao();
    @Autowired
    protected GenericDaoImpl<KlantAdres, Long> klantadresDao = new KlantAdresDao();

    
    @Override
    public Adres voegNieuweBeanToe(Long Id) {         
         throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Long voegNieuweBeanToe(Adres adres) {
        Long adresId = adresDao.insert(adres);
        return adresId;
    }

    @Override
    public Adres zoekNaarBean(Long Id) {
        adres = (Adres)adresDao.readById(Id);
        return adres; 
    }

    @Override
    public Long zoekNaarBean(Adres t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Adres> zoekAlleBeans() {  
        adressenLijst = (ArrayList<Adres>)adresDao.readAll(Adres.class);
        return adressenLijst; 
    }

    @Override
    public Adres wijzigBeanGegevens(Long id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Adres wijzigBeanGegevens(Adres adres) {
        Adres gewijzigdAdres = (Adres)adresDao.readById(adres.getId());
        if (gewijzigdAdres!= null){
            gewijzigdAdres.setStraatnaam(adres.getStraatnaam());
            gewijzigdAdres.setPostcode(adres.getPostcode());
            gewijzigdAdres.setHuisnummer(adres.getHuisnummer());
            gewijzigdAdres.setToevoeging(adres.getToevoeging());
            gewijzigdAdres.setWoonplaats(adres.getWoonplaats()); 
            gewijzigdAdres.setKlantAdressen(adres.getKlantAdressen());
            
        }
        adresDao.update(gewijzigdAdres);
        return gewijzigdAdres;
    }
    
        

    @Override // is de volgorde wel okay?
    public boolean verwijderBeanGegevens(Long Id) {
        Adres a = adresDao.readById(Id);
        boolean isDeletedInAdres = adresDao.deleteById(Id);
        ArrayList<KlantAdres> KA = (ArrayList<KlantAdres>) klantadresDao.readAll(KlantAdres.class);
        if (isDeletedInAdres){
            for (KlantAdres ka: KA){
                adres = ka.getAdres();
                if (Objects.equals(a.getId(), adres.getId())){  
                    klantadresDao.delete(ka);
                } 
            }
        }
        return isDeletedInAdres;
    }

    @Override
    public int verwijderAlleBeans() {
        int rowsAffected = adresDao.deleteAll(Adres.class);
        return rowsAffected; 
    }

    @Override
    public boolean isBeanUniek(long id, String username) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
   
    
    public List<Klant> zoekKlantenBijAdres(Adres a){
        List <Klant> lijst = new ArrayList<>();
        ArrayList<KlantAdres> KA = (ArrayList<KlantAdres>) klantadresDao.readAll(KlantAdres.class);
        for(KlantAdres ka : KA){
            adres = ka.getAdres();
            if (Objects.equals(a.getId(), adres.getId())){
                klant = ka.getKlant();
                lijst.add(klant);
            } 
        }
        return lijst;
    }
    
    public boolean verwijderVanKlantAdres(Long adresId, Long klantId){
        boolean verwijderd = false; 
        adres = adresDao.readById(adresId);
        klant = klantDao.readById(klantId);
        ArrayList<KlantAdres> KA = (ArrayList<KlantAdres>) klantadresDao.readAll(KlantAdres.class);
        for (KlantAdres ka:  KA){
            Adres a = ka.getAdres();
            Klant k = ka.getKlant();
            if (Objects.equals(a.getId(), adres.getId()) && Objects.equals(k.getId(), klant.getId())){
                verwijderd = klantadresDao.delete(ka);
            }
            
        }
        
        
        return verwijderd; 
    }
    
    
}

