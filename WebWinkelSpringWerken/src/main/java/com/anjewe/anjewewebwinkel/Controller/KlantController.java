


package com.anjewe.anjewewebwinkel.Controller;
import com.anjewe.anjewewebwinkel.Service.KlantService;
import com.anjewe.anjewewebwinkel.POJO.Artikel;
import com.anjewe.anjewewebwinkel.POJO.Klant;
import com.anjewe.anjewewebwinkel.Service.ArtikelService;
import com.anjewe.anjewewebwinkel.Service.GenericServiceInterface;
import java.util.ArrayList;
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
        @RequestMapping(value = { "/klant/createklant" }, method = RequestMethod.POST)
        public String saveKlant(@Valid Klant klant, BindingResult result,
            ModelMap model){
            
                if (result.hasErrors()) {
                    return "klant/addklant"; // aanpassen> aangeven waar error zit
                }
                
                klantService.voegNieuweBeanToe(klant); 
                
                Long id = klant.getId();
                model.addAttribute("success", "Klant: Klant nummer " + klant.getKlantNummer()
                        + " Klant voornaam " + klant.getVoornaam() + " Klant achternaam " 
                        + klant.getAchternaam() + " Tussenvoegsel " + klant.getTussenvoegsel() 
                        + " Klant email " + klant.getEmail() + " is toegevoegd aan het bestand");
            //return "success"; 
               model.addAttribute("klantId", id);
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

        /* // readOne - is die wel nodig?
        @RequestMapping (value = {"/artikel/readartikel"}, method = RequestMethod.GET)
        public String readArtikel(ModelMap model){
            // id ophalen in view
            Artikel artikel = (Artikel) artikelService.zoekNaarBean(Long.MIN_VALUE);
            model.addAttribute ();
            return "artikel/readartikel";
        } */
        // delete hieronder nog
        @RequestMapping (value = { "/klant/deleteklant-{Id}" }, method = RequestMethod.POST)
        public String deleteKlant(@PathVariable Long Id) {
            klantService.verwijderBeanGegevens(Id);
            return "redirect:/klant/readallklant";
        }
        

}
