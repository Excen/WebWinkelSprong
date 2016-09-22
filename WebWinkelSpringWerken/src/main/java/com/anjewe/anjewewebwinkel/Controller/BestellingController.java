/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anjewe.anjewewebwinkel.Controller;

// imports

import com.anjewe.anjewewebwinkel.POJO.Account;
import com.anjewe.anjewewebwinkel.POJO.Artikel;
import com.anjewe.anjewewebwinkel.POJO.Bestelling;
import com.anjewe.anjewewebwinkel.POJO.BestellingArtikel;
import com.anjewe.anjewewebwinkel.POJO.Klant;
import com.anjewe.anjewewebwinkel.Service.ArtikelService;
import com.anjewe.anjewewebwinkel.Service.BestellingService;
import com.anjewe.anjewewebwinkel.Service.GenericServiceInterface;
import com.anjewe.anjewewebwinkel.Service.KlantService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



/**
 *
 * @author Excen
 */

@Controller
public class BestellingController {
    
    // Datafields
    @Autowired 
    GenericServiceInterface <Bestelling, Long> bestellingService = new BestellingService();
    
    @Autowired
    BestellingService bs;
    
    @Autowired
    GenericServiceInterface<Artikel, Long> artikelService = new ArtikelService();
    

    @Autowired
    GenericServiceInterface<Klant, Long> klantService = new KlantService();
    
    @Autowired
    MessageSource messageSource;
    
    

    // Methoden
    
    // Bestelling home
    @RequestMapping (value = "/bestelling/homebestelling", method = RequestMethod.GET)
        public String bestellingHome(){
            return "bestelling/homebestelling";
        }
    
    // Standaard bestelling aanmaken
    @RequestMapping(value = "/klant/readallklant", method = RequestMethod.POST)
        public String bestellingToevoegen(ModelMap model, @RequestParam("KlantId") Long klantId){
            Klant klant = klantService.zoekNaarBean(klantId);    
            Bestelling bestelling = new Bestelling();
            bestelling.setBestellingDatum(new Date());
            bestelling.setKlant(klant);
            Long bestellingId = bestellingService.voegNieuweBeanToe(bestelling);
            
            return "redirect:/bestelling/createbestelling" + bestellingId;
        } 
        
    // Bestelling vullen
    @RequestMapping(value = "/bestelling/createbestelling{bestellingId}", method = RequestMethod.POST)
        public String createBestelling(ModelMap model, @RequestParam("ArtikelId") Long ArtikelId, @RequestParam("ArtikelAantal") Long ArtikelAantal, @PathVariable Long bestellingId){
           
            Bestelling bestelling = bestellingService.zoekNaarBean(bestellingId);
            ArrayList<Artikel>artikelLijst = (ArrayList<Artikel>)artikelService.zoekAlleBeans();
            model.addAttribute("bestelling", bestelling);
            model.addAttribute("artikellijst", artikelLijst);
            model.addAttribute("edit", false);
            
            Artikel artikel = artikelService.zoekNaarBean(ArtikelId);
            BestellingArtikel bestellingArtikel = new BestellingArtikel();
            bestellingArtikel.setArtikel(artikel);
            bestellingArtikel.setArtikelAantal(ArtikelAantal);
            
            
            // in view regelen dat er een artikel en aantal naar post gaat >> tussenoplossing om te zien of het werkt
            // code klopt nu niet
            // artikellijst blijft leeg. in readallartkel werkt het wel. wellciht met manier van weergave te maken. 
            // beter een artikel id opvragen en verder op omzetten naar artikel? 
            // later sowieso via andere view? 
            // idee: naar artikelkeuzelijst, daar artikelen aan klikken die in bestelling horen
            // probleem: kunnen nu geen bestelling opslaan zonder artikel. zodat met eerst de bestelling opslaat en dan update
            
            return "bestelling/addbestelling";              
    }
    
    @RequestMapping(value = {"/bestelling/addbestelling"})
        public String completeBestellingOpslaan (@Valid Bestelling bestelling, BindingResult result, ModelMap model){
            
        }

    // Bestelling opslaan
    @RequestMapping(value = {"/bestelling/createbestelling{klantId}", "/bestelling/createbestelling"}, method = RequestMethod.POST)
        public String saveBestelling(@Valid Bestelling bestelling, BindingResult result, ModelMap model, @PathVariable Long klantId){
          if (result.hasErrors()){
              model.addAttribute("error", "er is een error " + result.getNestedPath());
              return "bestelling/addbestelling";
          }  
         // >> zie hierboven: artikelaantal en artikel eerst ophalen om hier toe te kunnen voegen
         // bs.voegBestellingToe(bestelling, artikelAantal, artikel);
          model.addAttribute("succes", "Bestelling: " + bestelling.getId() + "BestellingDatum: " + bestelling.getBestellingDatum() + "Bestelling Klant: " + bestelling.getKlant().getId());
          
          return "bestelling/toevoegengelukt";
        }
        
        
    /*
        
        // create
        @RequestMapping (value = {"artikel", "/artikel/createartikel"}, method = RequestMethod.GET)
        public String nieuwArtikel(ModelMap model){
            Artikel artikel = new Artikel();            
            model.addAttribute("artikel", artikel);
            model.addAttribute("edit", false);  
            
            return "artikel/addartikel";
        }

        // save        
        @RequestMapping(value = { "/artikel/createartikel" }, method = RequestMethod.POST)
        public String saveArtikel(@Valid Artikel artikel,  BindingResult result,
            ModelMap model){
            
                if (result.hasErrors()) {
                    return "artikel/addartikel"; // aanpassen> aangeven waar error zit
                }
            
                artikelService.voegNieuweBeanToe(artikel); 
                model.addAttribute("success", "Artikel: Artikel nummer " + artikel.getArtikelNummer()
                        + " Artikel naam " + artikel.getArtikelNaam() + " Artikel prijs " 
                        + artikel.getArtikelPrijs() + " Omschrijving" + artikel.getOmschrijving() + 
                        " is toegevoegd aan het bestand");
            //return "success"; 
            return "artikel/toevoegengelukt"; 
        }
        
        */    
        
    
    // Alle bestellingen ophalen
    @RequestMapping(value = {"/bestelling/readallbestelling"}, method = RequestMethod.GET)
        public String readAllBestelling(ModelMap model) { 
            ArrayList <Bestelling> bestellingLijst = (ArrayList<Bestelling>)bestellingService.zoekAlleBeans();
            model.addAttribute("bestellinglijst", bestellingLijst);
            return "bestelling/readallbestelling"; 
    }
        
        
        // bestellingartikellijst
        
    /*
        
        @RequestMapping (value = {"artikelen", "/artikel/readallartikel" }, method = RequestMethod.GET)
        public String listArtikelen(ModelMap model){            
            ArrayList <Artikel> artikelLijst = (ArrayList <Artikel>) artikelService.zoekAlleBeans();
            model.addAttribute("artikellijst", artikelLijst);
            return "artikel/readallartikel";
        }
        
        */    
        
    
    // bestelling ophalen
    @RequestMapping(value = {"bestelling/readbestelling-{id}"}, method = RequestMethod.GET)
        public String readBestelling (@PathVariable Long id, ModelMap model){
            Bestelling bestelling = bestellingService.zoekNaarBean(id);
            ArrayList <BestellingArtikel> bestellingartikellijst = bs.zoekBestellingArtikelByBestellingId(id);
            model.addAttribute("bestellingartikellijst", bestellingartikellijst);
            model.addAttribute("bestelling", bestelling);
            return "bestelling/readbestelling";
        }
        
    // bestelling updaten     
    @RequestMapping(value = {"/bestelling/updatebestelling"}, method = RequestMethod.POST)    
        public String updateBestelling (@PathVariable Long Id, ModelMap model) {
            Bestelling bestelling = (Bestelling)bestellingService.zoekNaarBean(Id);
            model.addAttribute("bestelling", bestelling);
            model.addAttribute("edit", true);
            return "bestelling/updatebestelling";
        }
        
    // bestelling verwijderen
    @RequestMapping(value = {"/bestelling/deletebestelling"}, method = RequestMethod.POST)
        public String deleteBestelling(@PathVariable Long Id) {
            bestellingService.verwijderBeanGegevens(Id);
            return "bestelling/deletebestelling";
        }
    
    // alle bestellingen verwijderen    
    @RequestMapping(value = {"/bestelling/deleteallbestelling"}, method = RequestMethod.POST)    
        public String delleteAllBestelling(){
            bestellingService.verwijderAlleBeans();
            return "bestelling/deleteallbestelling";
        }
    
}
