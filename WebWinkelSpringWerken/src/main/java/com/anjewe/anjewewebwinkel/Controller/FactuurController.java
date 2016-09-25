package com.anjewe.anjewewebwinkel.Controller;

import com.anjewe.anjewewebwinkel.POJO.Bestelling;
import com.anjewe.anjewewebwinkel.POJO.BestellingArtikel;
import com.anjewe.anjewewebwinkel.POJO.Betaling;
import com.anjewe.anjewewebwinkel.POJO.Factuur;
import com.anjewe.anjewewebwinkel.POJO.Klant;
import com.anjewe.anjewewebwinkel.Service.BestellingService;
import com.anjewe.anjewewebwinkel.Service.FactuurService;
import com.anjewe.anjewewebwinkel.Service.GenericServiceInterface;
import java.util.ArrayList;
import java.util.Date;
import java.util.Set;
import javax.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
public class FactuurController {

        private static final Logger log = LoggerFactory.getLogger(FactuurController.class);

        @Autowired
        GenericServiceInterface<Factuur, Long> factuurService;
        @Autowired
        FactuurService fs;
        @Autowired
        GenericServiceInterface<Bestelling, Long> bestellingService;
        @Autowired
        BestellingService bs;
        @Autowired
        GenericServiceInterface<Klant, Long> klantService;

        // startpagina factuur
        @RequestMapping(value = "/factuur/homefactuur", method = RequestMethod.GET)
        public String factuur() {
            return "factuur/homefactuur";
        }

        // nieuwe factuur aanmaken
        @RequestMapping(value = "/factuur/createfactuur-{bestellingId}", method = RequestMethod.GET)
        public String nieuwFactuur(ModelMap model, @PathVariable Long bestellingId) {
            
            Bestelling bestelling = (Bestelling) bestellingService.zoekNaarBean(bestellingId);
            Long klantId = bestelling.getKlant().getId();
            Klant klant = klantService.zoekNaarBean(klantId);
            Factuur factuur = new Factuur();
            
            model.addAttribute("bestelling", bestelling);
            model.addAttribute("klant", klant);
            model.addAttribute("edit", false);
            return "factuur/addfactuur";
        }
        
        // nieuwe factuuropslaan
        @RequestMapping (value = "/factuur/createfactuur-{bestellingId}", method = RequestMethod.POST)
        public String saveFactuur(ModelMap model, @Valid Factuur f, @Valid Bestelling bestelling, 
                @Valid Klant klant, BindingResult result, @PathVariable Long bestellingId){

            if (result.hasErrors()) {
                model.addAttribute("error", result.toString());
                        return "factuur/addfactuur"; 
                }
            
            bestelling = (Bestelling) bestellingService.zoekNaarBean(bestellingId);
            Long klantId = bestelling.getKlant().getId();
            fs.voegFactuurToe(f, klantId, bestellingId );
            //Factuur f = factuurService.zoekNaarBean(factuurId);
            //factuurService.voegNieuweBeanToe(factuur);
            model.addAttribute("success", "FactuurId: " + f.getId() +" en factuurnummer:  " + f.getFactuurnummer()
                            + " Factuurdatum  " + f.getFactuurdatum()+ /*" Factuur bij bestelling  " 
                            + f.getBestelling()+ " bijbehorende klant" + f.getKlant()+ */
                            " is toegevoegd aan het bestand");

               
            // bedrag berekenen
             double totaalBedrag = 0.0;   
             Set<BestellingArtikel> ba = bs.zoekBestellingArtikelByBestellingId(bestelling);
             for (BestellingArtikel bestelArtikel : ba) {
                 int aantal = bestelArtikel.getArtikelAantal();
                 double artPrijs = bestelArtikel.getArtikel().getArtikelPrijs();
                 double bedrag = aantal * artPrijs;
                 totaalBedrag += bedrag;
             }
                
            model.addAttribute("factuurbedrag", totaalBedrag);
            model.addAttribute("bestelartikelset", ba);
//             Set <Betaling> betalingen = factuur.getBetalingset();   
//               model.addAttribute("betalingset", betalingen );

            return "factuur/toevoegengelukt"; 
        }

        // readall
        @RequestMapping (value = "/factuur/readallfactuur", method = RequestMethod.GET)
        public String listFactuur(ModelMap model){
            ArrayList<Factuur> factuurLijst = (ArrayList<Factuur>) factuurService.zoekAlleBeans();
            model.addAttribute("factuurlijst", factuurLijst);
            return "factuur/readallfactuur";            

        }

        // readone
        @RequestMapping (value= "/factuur/readfactuur-{Id}", method = RequestMethod.GET)
        public String readFactuur(@PathVariable Long Id, ModelMap model, BindingResult result, 
                @Valid Factuur factuur){
    
                if (result.hasErrors()){
                    return "factuur/readallfactuur";
                }
                factuurService.zoekNaarBean(Id);
                model.addAttribute("factuurId", factuur.getId());
                model.addAttribute("factuurnummer", factuur.getFactuurnummer() );
                model.addAttribute("factuurdatum", factuur.getFactuurdatum());
                model.addAttribute("factuurbestelling", factuur.getBestelling());
                 Set <Betaling> betalingen = factuur.getBetalingset();  
                model.addAttribute("factuurbetalingset", betalingen);
                Klant klant = factuur.getKlant();
                model.addAttribute("factuurklant", 
                        klant.getVoornaam() + " " + klant.getTussenvoegsel() + " " + klant.getAchternaam());
                double factuurBedrag = berekenTotaalBedrag(factuur.getBestelling().getId());
                model.addAttribute("factuurbedrag", factuurBedrag);
            
                return "factuur/readfactuur";
        }
        
        
        // update
        @RequestMapping (value = {"/factuur/updatefactuur"}, method = RequestMethod.GET)
        public String update () {
                return "factuur/updatefactuur";
            }
        
        
        @RequestMapping (value = {"/factuur/updatefactuur-{Id}"}, method = RequestMethod.POST)
        public String updateFactuur(@PathVariable Long Id, ModelMap model, BindingResult result, 
                @Valid Factuur factuur){
            
              if (result.hasErrors()) {
                return "factuur/updatefactuur-{Id}";
              }
              
            factuurService.wijzigBeanGegevens(factuur);
            model.addAttribute("success", "Factuur: Factuurnummer " + factuur.getFactuurnummer()
                        + " Factuurdatum  " + factuur.getFactuurdatum()+ " Factuur bij bestelling  " 
                        + factuur.getBestelling()+ " bijbehorende klant" + factuur.getKlant()+ 
                        " is gewijzigd in het bestand");

            double factuurBedrag = berekenTotaalBedrag(factuur.getBestelling().getId());                        
            model.addAttribute("factuurbedrag", factuurBedrag);

            Set <Betaling> betalingen = factuur.getBetalingset();   
            model.addAttribute("betalingset", betalingen );
            
            return "factuur/toevoegengelukt";
        }
        
        
        
        // delete
        @RequestMapping(value ="/factuur/deletefactuur", method = RequestMethod.GET)
        public String delete(){
            return "factuur/deletefactuur";
        }
        
        @RequestMapping(value = { "/factuur/deletefactuur-{Id}" }, method = RequestMethod.GET)
        public String deleteArtikel(@PathVariable Long Id) {
            factuurService.verwijderBeanGegevens(Id);
            return "redirect:/factuur/readallfactuur";
         }  

        
        public double berekenTotaalBedrag(Long bestellingId) {

            double totaalBedrag = 0.0;            
            Bestelling bestelling = (Bestelling) bestellingService.zoekNaarBean(bestellingId);
            
            Set<BestellingArtikel> ba = (Set<BestellingArtikel>)bs.zoekBestellingArtikelByBestellingId(bestelling);
            for (BestellingArtikel bestelArtikel : ba) {
                int aantal = bestelArtikel.getArtikelAantal();
                //artikel = bestelArtikel.getArtikel();
                double artPrijs = bestelArtikel.getArtikel().getArtikelPrijs();
                double bedrag = aantal * artPrijs;

                totaalBedrag += bedrag;
            }
            return totaalBedrag;
        }

//        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
// Date date = new Date();
// System.out.println(dateFormat.format(date));
}
