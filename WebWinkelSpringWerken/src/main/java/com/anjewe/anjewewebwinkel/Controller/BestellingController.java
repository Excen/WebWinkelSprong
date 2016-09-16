/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anjewe.anjewewebwinkel.Controller;

// imports

import com.anjewe.anjewewebwinkel.POJO.Account;
import com.anjewe.anjewewebwinkel.POJO.Bestelling;
import com.anjewe.anjewewebwinkel.Service.GenericServiceInterface;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



/**
 *
 * @author Excen
 */

@Controller
public class BestellingController {
    
    // Datafields
    @Autowired 
    GenericServiceInterface<Bestelling, Long> bestellingService;

    @Autowired
    MessageSource messageSource;

    // Methoden
    
    // Bestelling toevoegen
    @RequestMapping(value = {"bestelling/createbestelling"}, method = RequestMethod.POST)
        public String createBestelling(@ModelAttribute("bestelling") ModelMap model){
            Bestelling bestelling = new Bestelling();
            model.addAttribute("bestelling", bestelling);
            model.addAttribute("edit", false);
            return "createbestelling";              
    }
    
    // Alle bestellingen ophalen
    @RequestMapping(value = {"/bestelling/readallbestelling"}, method = RequestMethod.GET)
        public String readAllBestelling(ModelMap model) { 
            List <Bestelling> bestellingen = bestellingService.zoekAlleBeans();
            model.addAttribute("bestellinglijst", bestellingen);
            return "readallbestelling"; 
    }
    
    // bestelling ophalen
    @RequestMapping(value = {"/bestelling/readbestelling"}, method = RequestMethod.GET)
        public String readBestelling (@PathVariable Long id, ModelMap model){
            Bestelling bestelling = bestellingService.zoekNaarBean(id);
            model.addAttribute("bestelling", bestelling);
            return "readbestelling";
        }
        
    // bestelling updaten     
    @RequestMapping(value = {"/bestelling/updatebestelling"}, method = RequestMethod.POST)    
        public String updateBestelling (@PathVariable Long Id, ModelMap model) {
            Bestelling bestelling = (Bestelling)bestellingService.zoekNaarBean(Id);
            model.addAttribute("bestelling", bestelling);
            model.addAttribute("edit", true);
            return "updatebestelling";
        }
        
    // bestelling verwijderen
    @RequestMapping(value = {"/bestelling/deletebestelling"}, method = RequestMethod.POST)
        public String deleteBestelling(@PathVariable Long Id) {
            bestellingService.verwijderBeanGegevens(Id);
            return "deletebestelling";
        }
    
    // alle bestellingen verwijderen    
    @RequestMapping(value = {"/bestelling/deleteallbestelling"}, method = RequestMethod.POST)    
        public String delleteAllBestelling(){
            bestellingService.verwijderAlleBeans();
            return "deleteallbestelling";
        }
    
}
