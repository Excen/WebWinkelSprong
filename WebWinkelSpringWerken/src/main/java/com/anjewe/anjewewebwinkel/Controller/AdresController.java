


package com.anjewe.anjewewebwinkel.Controller;


import com.anjewe.anjewewebwinkel.POJO.Adres;
import com.anjewe.anjewewebwinkel.Service.AdresService;
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
public class AdresController {

private static final Logger log = LoggerFactory.getLogger(AdresController.class);


    @Autowired
    GenericServiceInterface <Adres, Long> adresService = new AdresService();
    
    @Autowired
    MessageSource messageSource; 
        
    
    @RequestMapping (value = "/adres/homeadres", method = RequestMethod.GET)
    public String adres(){
        return "adres/homeadres";
    }

    @RequestMapping (value = "/adres/readalladres", method = RequestMethod.GET)
    public String listAdressen(ModelMap model){
        ArrayList<Adres> adressenLijst = (ArrayList<Adres>)adresService.zoekAlleBeans();
        model.addAttribute("adressenlijst", adressenLijst);
        return "adres/readalladres";            
    }
    
    @RequestMapping (value = "/adres/createadres", method = RequestMethod.GET)
    public String nieuwAdres(ModelMap model){
        Adres adres = new Adres();
        model.addAttribute("adres", adres);
        model.addAttribute("edit", false);
        return "adres/addadres";
        
    }
    
    @RequestMapping (value = "/adres/createadres", method = RequestMethod.POST)
    public String saveAdres (@Valid Adres adres, ModelMap model, BindingResult result){
        
        if (result.hasErrors()){
            return "adres/addadres"; // nog aanpassen naar een geschikte pagina
        }
        
        adresService.voegNieuweBeanToe(adres);
        model.addAttribute("succes", "Adres met id" + adres.getId()
                        + " straatnaam" + adres.getStraatnaam() + " huisnummer " 
                        + adres.getHuisnummer() + " toevoeging " + adres.getToevoeging() + 
                        " postcode " + adres.getPostcode() + " woonplaats " + adres.getWoonplaats() +
                        " is toegevoegd aan het bestand");
        
        return "adres/toevoegengelukt";
        
    }
    //update
    
    @RequestMapping (value ="/adres/updateadres", method = RequestMethod.GET)
    public String update(){
        return "adres/updateadres";
    }
    
    // werkelijke update methode
    @RequestMapping (value = "/adres/updateadres-{Id}", method = RequestMethod.POST)
    public String updateAdres(@Valid Adres adres, BindingResult result, 
            ModelMap model, @PathVariable Long Id){
        
        if (result.hasErrors()) {
            return "adres/updateadres-{Id}";
        }
        
        adresService.wijzigBeanGegevens(adres);
        model.addAttribute("succes", "Adres met id: " + adres.getId() + "is toegevoegd." +
                "Straatnaam: " + adres.getStraatnaam() + " ,huisnummer: " + adres.getHuisnummer() +
                " ,toevoeging: " + adres.getToevoeging() + " , postcode: " + adres.getPostcode() + 
                " , woonplaats: " + adres.getWoonplaats() + ". AdresType: " + adres.getAdresType());
        
        return "adres/toevoegengelukt";
        
    }
    
    
    
    //delete
    @RequestMapping (value = "/adres/deleteadres", method = RequestMethod.GET)
    public String delete(){
        return "adres/deleteadres";
    }
    
    // werkelijke delete methode
    @RequestMapping (value = "/adres/deleteadres-{Id}" , method = RequestMethod.GET)
    public String deleteAdres(@PathVariable Long Id){
        adresService.verwijderBeanGegevens(Id);
        return "redirect:/adres/readalladres";
    }
}
