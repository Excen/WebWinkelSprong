


package com.anjewe.anjewewebwinkel.Controller;


import com.anjewe.anjewewebwinkel.POJO.Adres;
import com.anjewe.anjewewebwinkel.Service.AdresService;
import com.anjewe.anjewewebwinkel.Service.GenericServiceInterface;
import java.util.ArrayList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
    
}
