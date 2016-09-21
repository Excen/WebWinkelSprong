package com.anjewe.anjewewebwinkel.Controller;

import com.anjewe.anjewewebwinkel.POJO.Bestelling;
import com.anjewe.anjewewebwinkel.POJO.BestellingArtikel;
import com.anjewe.anjewewebwinkel.POJO.Betaling;
import com.anjewe.anjewewebwinkel.POJO.Factuur;
import com.anjewe.anjewewebwinkel.POJO.Klant;
import com.anjewe.anjewewebwinkel.Service.GenericServiceInterface;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * @author Wendy
 */
@Controller
public class FactuurController {

        private static final Logger log = LoggerFactory.getLogger(FactuurController.class);

        GenericServiceInterface<Factuur, Long> factuurService;
        GenericServiceInterface<Bestelling, Long> bestellingService;


        // startpagina factuur
        @RequestMapping(value = "/factuur/homefactuur", method = RequestMethod.GET)
        public String factuur() {
            return "factuur/homefactuur";
        }

        // nieuwe factuur aanmaken
        @RequestMapping(value = "/factuur/createfactuur", method = RequestMethod.GET)
        public String nieuwFactuur(ModelMap model) {
            Factuur factuur = new Factuur();
            model.addAttribute("factuur", factuur);
            model.addAttribute("edit", false);
            return "factuur/addfactuur";

        }
        
        // nieuwe factuuropslaan
        @RequestMapping (value = "/factuur/createfactuur", method = RequestMethod.POST)
        public String saveFactuur(ModelMap model, @Valid Factuur factuur, BindingResult result){

            if (result.hasErrors()) {
                        return "factuur/addfactuur"; // aanpassen> aangeven waar error zit
                    }

            factuurService.voegNieuweBeanToe(factuur);
               model.addAttribute("success", "Factuur: Factuurnummer " + factuur.getFactuurnummer()
                            + " Factuurdatum  " + factuur.getFactuurdatum()+ " Factuur bij bestelling  " 
                            + factuur.getBestelling()+ " bijbehorende klant" + factuur.getKlant()+ 
                            " is toegevoegd aan het bestand");

               double factuurBedrag = berekenTotaalBedrag(factuur);
               model.addAttribute("factuurbedrag", 
                            "Het totale bedrag van de factuur bedraagt € " + factuurBedrag);

               Set <Betaling> betalingen = factuur.getBetalingset();   
               model.addAttribute("betalingset", betalingen );

               return "factuur/toevoegengelukt"; 
        }

        // readall
        @RequestMapping (value = "/factuur/readallfactuur", method = RequestMethod.GET)
        public String listFactuur(ModelMap model){
            ArrayList<Factuur> factuurLijst = (ArrayList<Factuur>) factuurService.zoekAlleBeans();
            model.addAttribute("factuurlijst", factuurLijst);
            return "factuur/readallfactuur";            
// waar de loop voor betaling view of hier?
// waar bedrag berekenen view of hier?
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
                double factuurBedrag = berekenTotaalBedrag(factuur);
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

            double factuurBedrag = berekenTotaalBedrag(factuur);
            model.addAttribute("factuurbedrag", 
                        "Het totale bedrag van de factuur bedraagt € " + factuurBedrag);

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

        
        public double berekenTotaalBedrag(Factuur factuur) {

            double totaalBedrag = 0.0;
            long bestellingId = factuur.getBestelling().getId();

            Bestelling bestelling = (Bestelling) bestellingService.zoekNaarBean(bestellingId);
            Set<BestellingArtikel> ba = bestelling.getBestellingArtikellen();
            for (BestellingArtikel bestelArtikel : ba) {
                int aantal = bestelArtikel.getArtikelAantal();
                //moet artikel uit db gehaal worden? of fetchtype.eager?
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
