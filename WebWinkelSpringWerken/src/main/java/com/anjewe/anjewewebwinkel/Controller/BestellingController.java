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
    @RequestMapping(value = {value = "/nieuwbestelling", method = RequestMethod.POST})
        public String addBestelling(@ModelAttribute("bestelling") Bestelling bestelling){
        
                if ()
                



    }
    
    /*
    
    @RequestMapping(value= "/person/add", method = RequestMethod.POST)
	public String addPerson(@ModelAttribute("person") Person p){
		
		if(p.getId() == 0){
			//new person, add it
			this.personService.addPerson(p);
		}else{
			//existing person, call update
			this.personService.updatePerson(p);
		}
		
		return "redirect:/persons";
		
	}
    
    */
    
    // Bestellinglijst ophalen
    @RequestMapping(value = { "/bestellingen", "/bestellinglijst" }, method = RequestMethod.GET)
    public String listBestellingen(ModelMap model) { 
 
        List <Bestelling> accounts = bestellingService.zoekAlleBeans();
        model.addAttribute("bestellinglijst", accounts);
        return "bestellinglijst"; // bestellinglijst.jsp
    }
    
    
    
    
    
    
    
    
}
