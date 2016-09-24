


package com.anjewe.anjewewebwinkel.Controller;
import com.anjewe.anjewewebwinkel.POJO.Adres;
import com.anjewe.anjewewebwinkel.POJO.AdresType;
import com.anjewe.anjewewebwinkel.Service.KlantService;
import com.anjewe.anjewewebwinkel.POJO.Artikel;
import com.anjewe.anjewewebwinkel.POJO.Klant;
import com.anjewe.anjewewebwinkel.POJO.KlantAdres;
import com.anjewe.anjewewebwinkel.Service.AdresService;
import com.anjewe.anjewewebwinkel.Service.ArtikelService;
import com.anjewe.anjewewebwinkel.Service.GenericServiceInterface;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Wendy
 */
@Controller
public class KlantController {

private static final Logger log = LoggerFactory.getLogger(KlantController.class);

    @Autowired
    GenericServiceInterface <Klant, Long> klantService = new KlantService();
    
    @Autowired
    GenericServiceInterface <Adres, Long> adresService = new AdresService();
    
    @Autowired
    KlantService ks = new KlantService();
    
    @Autowired
    MessageSource messageSource; 
    
         /**
         * Lijst bestaande artikelen
         * @param model
         * @return 
         */
    
        // startpagina artikelen
        @RequestMapping (value = "/klant/homeklant", method = RequestMethod.GET)
        public String artikel(){
            return "klant/homeklant";
        }

        
        // create
        @RequestMapping (value = {"klant", "/klant/createklant"}, method = RequestMethod.GET)
        public String nieuwKlant(ModelMap model){
            Klant klant = new Klant();            
            model.addAttribute("klant", klant);
            model.addAttribute("edit", false);  
            
            return "klant/addklant";
        }

        // save        
        @RequestMapping(value =  "/klant/createklant", method = RequestMethod.POST)
        public String saveKlant(@Valid Klant klant, ModelMap model, BindingResult result){
            
                if (result.hasErrors()) {
                    return "klant/addklant"; // aanpassen> aangeven waar error zit
                }
                
                klantService.voegNieuweBeanToe(klant); 
                
                
                model.addAttribute("success", "Klant: Klant nummer " + klant.getKlantNummer()
                        + ", klant voornaam: " + klant.getVoornaam() + ", klant achternaam: " 
                        + klant.getAchternaam() + ", tussenvoegsel: " + klant.getTussenvoegsel() 
                        + ", klant email: " + klant.getEmail() + " is toegevoegd aan het bestand");
            //return "success"; 
              
            return "klant/toevoegengelukt"; 
        }
        
         /*** 
         * @param model
         * @return 
         */
        
        // readAll
        @RequestMapping (value = {"klanten", "/klant/readallklant" }, method = RequestMethod.GET)
        public String listKlanten(ModelMap model){            
            ArrayList <Klant> klantenLijst = (ArrayList <Klant>) klantService.zoekAlleBeans();
            model.addAttribute("klantenlijst", klantenLijst);
            return "klant/readallklant";
        }

      
    //update
       @RequestMapping (value = "/klant/updateklant", method = RequestMethod.GET)
       public String update() {
           return "klant/updateklant";
       }
       
       @RequestMapping (value ={"/klant/updateklant-{Id}"}, method = RequestMethod.GET)
       public String editKlant(@PathVariable Long Id, ModelMap model) {
           Klant klant = (Klant)klantService.zoekNaarBean(Id);
           model.addAttribute("klant", klant);
           model.addAttribute("edit", true);
           
           return "/klant/addklant";
       }

       @RequestMapping (value = "/klant/updateklant-{Id}", method = RequestMethod.POST)
       public String updateKlant(@Valid Klant klant, BindingResult result, ModelMap model, @PathVariable Long Id) {
           
           if (result.hasErrors()) {
               return "klant/updateklant-{Id}";
           }
           
           klantService.wijzigBeanGegevens(klant);
           model.addAttribute("succes", "klant met id: " + klant.getId() + "is toegevoegd." +
                "voornaam: " + klant.getVoornaam() + " ,tussenvoegsel: " + klant.getTussenvoegsel() +
                " ,achternaam: " + klant.getAchternaam() + " ,email: " + klant.getEmail());
           
           return "klant/toevoegengelukt";
       }
        
       
        // delete hieronder nog
        @RequestMapping (value = { "/klant/deleteklant-{Id}" }, method = RequestMethod.POST)
        public String deleteKlant(@PathVariable Long Id) {
            klantService.verwijderBeanGegevens(Id);
            return "redirect:/klant/readallklant";
        }
        
        // voeg adres toe aan klant
        // nieuw adres aanmaken
    @RequestMapping (value = "/klant/addadrestoklant-{Id}", method = RequestMethod.GET)
    public String createAdresVoorKlant(@PathVariable Long Id, ModelMap model) {
        Long klantId = Id;
        Adres adres = new Adres();
        
        AdresType[] at = AdresType.values();
        List<AdresType> enumValues =  Arrays.asList(at);
        model.addAttribute("adres", adres);
        model.addAttribute("enumValues", enumValues);
        model.addAttribute("klantId", Id);
        model.addAttribute("edit", false);
        
        return "/adres/addadres";
    }
        
    @RequestMapping (value = "/klant/addadrestoklant-{Id}", method = RequestMethod.POST)
    public String voegAdresAanKlantToe(@Valid Adres adres, ModelMap model, BindingResult result, @PathVariable Long Id) {
        
        if (result.hasErrors()) {
            return "klant/addklant";
        }
        Klant klant = klantService.zoekNaarBean(Id);
        adresService.voegNieuweBeanToe(adres);
        KlantAdres ka = new KlantAdres();
        ka.setAdres(adres);
        ka.setKlant(klant);
        ka.setCreatedDate(new Date());
        adres.getKlantAdressen().add(ka);
        adresService.wijzigBeanGegevens(adres);
        
        model.addAttribute("succes",  "adres met Id: " + adres.getId() + 
                " is toegevoegd aan klant met id: " + klant.getId());
        
        // deze kan niet worden aan geroepen ivm lazy / bij eager stackoverflow
       // model.addAttribute("klantadresset", adres.getKlantAdressen());
        
        
        return "adres/toevoegengelukt";
    }
        
    @RequestMapping (value= "/klant/adressenbijklant-{Id}", method = RequestMethod.GET)
    public String readAdressen(ModelMap model, @PathVariable Long Id, @Valid Klant klant) {
        KlantAdres ka = new KlantAdres();
        List<Adres> adressen = (List<Adres>)ks.zoekAdressenBijKlant(klant);
        model.addAttribute("adressen", adressen);
    
        return "klant/adressenbijklant";
    }     
    
}


