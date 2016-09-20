


package com.anjewe.anjewewebwinkel.Controller;

import com.anjewe.anjewewebwinkel.POJO.Betaalwijze;
import com.anjewe.anjewewebwinkel.POJO.Betaling;
import com.anjewe.anjewewebwinkel.POJO.Factuur;
import com.anjewe.anjewewebwinkel.Service.BetalingService;
import com.anjewe.anjewewebwinkel.Service.GenericServiceInterface;
import java.util.ArrayList;
import java.util.Arrays;
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
public class BetalingController {

private static final Logger log = LoggerFactory.getLogger(BetalingController.class);

    @Autowired
    GenericServiceInterface<Betaling, Long> betalingService = new BetalingService();

    @Autowired
    MessageSource messageSource;
    
    // startpagina
    @RequestMapping(value = "/betaling/homebetaling", method = RequestMethod.GET)
    public String betaling(){
        return "betaling/homebetaling";
    }
    
    // create
    @RequestMapping (value = "/betaling/createbetaling", method = RequestMethod.GET)
    public String nieuwBetaling(ModelMap model){
        Betaling betaling = new Betaling();
        Factuur factuur = new Factuur();
        
        Betaalwijze[] bw = Betaalwijze.values();
        List<Betaalwijze> enumValues = Arrays.asList(bw); 
        model.addAttribute("factuur", factuur);
        model.addAttribute("betaling", betaling);
        model.addAttribute("enumValues", enumValues); 
        model.addAttribute("edit", false);
        return "betaling/addbetaling";
        
    }
    
    @RequestMapping (value = "/betaling/createbetaling", method = RequestMethod.POST)
    public String saveBetaling(ModelMap model, BindingResult result, 
            @Valid Betaling betaling){
        
        if (result.hasErrors()){
            return "betaling/addbetaling";
        }
        
        betalingService.voegNieuweBeanToe(betaling);
        //model.addAttribute("success", "toevoegen gelukt");
        model.addAttribute("betaaldatum", betaling.getBetaaldatum());
        model.addAttribute("betaalwijze",betaling.getBetaalwijze());
        model.addAttribute("betaalgegevens",betaling.getBetalingsGegevens());
        model.addAttribute("betalingfactuur",betaling.getFactuur());
        model.addAttribute("betalingklant",betaling.getKlant());
        model.addAttribute("betalingId",betaling.getId());
        return "betaling/toevoegengelukt";
        
    }
    
    
    // readall
    @RequestMapping (value = "/betaling/readallbetaling", method = RequestMethod.GET)
    public String listBetaling(ModelMap model){
        ArrayList<Betaling> betalingLijst = (ArrayList<Betaling>)betalingService.zoekAlleBeans();
        model.addAttribute("betalinglijst", betalingLijst);
        return "betaling/readallbetaling";     
        
    }
    
    
    
    // update- vanuit llink startmenu betaling
     @RequestMapping (value = {"/betaling/updatebetaling"}, method = RequestMethod.GET)
        public String update () {
                return "betaling/updatebetaling";
            }
    
    // update - edit    
    @RequestMapping (value= "/betaling/updatebetaling-{Id}", method = RequestMethod.GET)
    public String editBetaling(ModelMap model, @PathVariable Long Id ){
        Betaling betaling = betalingService.zoekNaarBean(Id);
        Betaalwijze[] bw = Betaalwijze.values();
        List<Betaalwijze> enumValues = Arrays.asList(bw);
        
        model.addAttribute("betaling", betaling);
        model.addAttribute("enumValues", enumValues);
        model.addAttribute("edit", true);
        return "betaling/addBetaling";
    }
    
    
            // update - daadwerkelijke update
    @RequestMapping (value = "betaling/updatebetaling-{Id}", method = RequestMethod.POST)
    public String updateBetaling(BindingResult result, ModelMap model, 
            @Valid Betaling betaling, @PathVariable Long Id){
        if (result.hasErrors()){
            return "betaling/updatebetaling-{Id}";
        }
        
        betalingService.wijzigBeanGegevens(Id);
        model.addAttribute("betaaldatum", betaling.getBetaaldatum());
        model.addAttribute("betaalwijze",betaling.getBetaalwijze());
        model.addAttribute("betaalgegevens",betaling.getBetalingsGegevens());
        model.addAttribute("betalingfactuur",betaling.getFactuur());
        model.addAttribute("betalingklant",betaling.getKlant());
        model.addAttribute("betalingId",betaling.getId());
       
        return "betaling/toevoegengelukt";
    }
    
    
    // delete
    @RequestMapping (value = "/betaling/deletebetaling-{Id}", method = RequestMethod.GET)
    public String deleteBetaling(@PathVariable Long Id){
       betalingService.verwijderBeanGegevens(Id);
       return "redirect:/betaling/readallbetaling";    
    }
}
