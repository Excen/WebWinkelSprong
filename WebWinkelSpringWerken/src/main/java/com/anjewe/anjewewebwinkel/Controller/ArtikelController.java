


package com.anjewe.anjewewebwinkel.Controller;

import com.anjewe.anjewewebwinkel.POJO.Artikel;
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
public class ArtikelController {

private static final Logger log = LoggerFactory.getLogger(ArtikelController.class);

    @Autowired
    GenericServiceInterface <Artikel, Long> artikelService = new ArtikelService();
    
    @Autowired
    MessageSource messageSource; 
    
         /**
         * Lijst bestaande artikelen
         * @param model
         * @return 
         */
    
        // startpagina artikelen
        @RequestMapping (value = "/artikel/homeartikel", method = RequestMethod.GET)
        public String artikel(){
            return "artikel/homeartikel";
        }

        
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
        
         /*** 
         * @param model
         * @return 
         */
        
        // readAll
        @RequestMapping (value = {"/artikel/readallartikel" }, method = RequestMethod.GET)
        public String listArtikelen(ModelMap model){            
            ArrayList <Artikel> artikelLijst = (ArrayList <Artikel>) artikelService.zoekAlleBeans();
            model.addAttribute("artikellijst", artikelLijst);
            return "artikel/readallartikel";
        }

        // readOne - >> in view knop voor voeg toe // aantal aanpassen
        @RequestMapping (value = {"/artikel/readartikel-{Id}"}, method = RequestMethod.GET)
        public String readArtikel(ModelMap model, @PathVariable Long Id) {
            // id ophalen in view
            Artikel artikel = (Artikel) artikelService.zoekNaarBean(Id);
            model.addAttribute ("artikel", artikel);
            return "artikel/readartikel";
        } 
        
        // readall tbv artikel bestellen >> zelfde als in readall maar knop voeg toe + aantal aanpassen
        @RequestMapping (value = {"/artikel/artikelkeuzelijst"}, method = RequestMethod.GET)
        public String artikelKeuzeLijst(ModelMap model){
            ArrayList<Artikel> artikelLijst = (ArrayList<Artikel>) artikelService.zoekAlleBeans();
            model.addAttribute("artikellijst", artikelLijst);            
            
            return "artikel/artikelkeuzelijst ";
        }
        
        
        // update
        @RequestMapping (value = {"/artikel/updateartikel-{Id}"}, method = RequestMethod.GET)
        public String editArtikel(@PathVariable Long Id, ModelMap model){
            Artikel artikel = (Artikel)artikelService.zoekNaarBean(Id);
            model.addAttribute("artikel", artikel);
            model.addAttribute("edit", true);
            return "artikel/addartikel"; // klopt dt?
        }
        
        
        @RequestMapping (value = {"/artikel/updateartikel"}, method = RequestMethod.GET)
        public String update () {
                return "artikel/updateartikel";
            }
        
        
        @RequestMapping (value = {"/artikel/updateartikel-{Id}"}, method = RequestMethod.POST)
        public String updateArtikel(@Valid Artikel artikel, BindingResult result,
            ModelMap model, @PathVariable Long Id){
             
            if (result.hasErrors()) {
            return "artikel/updateartikel-{Id}";
        }
// 
//        /*//Uncomment below 'if block' if you WANT TO ALLOW UPDATING SSO_ID in UI which is a unique key to a User.
//        if(!userService.isUserSSOUnique(user.getId(), user.getSsoId())){
//            FieldError ssoError =new FieldError("user","ssoId",messageSource.getMessage("non.unique.ssoId", new 
// 
//String[]{user.getSsoId()}, Locale.getDefault()));
//            result.addError(ssoError);
//            return "registration";
//        }*/
// 
            artikelService.wijzigBeanGegevens(artikel);
 
        model.addAttribute("success", "Artikel:\nArtikel nummer " + artikel.getArtikelNummer()
                        + "\nArtikel naam " + artikel.getArtikelNaam() + "\nArtikel prijs " 
                        + artikel.getArtikelPrijs() + "\nOmschrijving" + artikel.getOmschrijving() + 
                        "\nis gewijzigd in het bestand");
        //return "success";
        
        return "artikel/toevoegengelukt";
        }

        //delete
        
        @RequestMapping(value ="/artikel/deleteartikel", method = RequestMethod.GET)
        public String delete(){
            return "artikel/deleteartikel";
        }
        
        @RequestMapping(value = { "/artikel/deleteartikel-{Id}" }, method = RequestMethod.GET)
        public String deleteArtikel(@PathVariable Long Id) {
            artikelService.verwijderBeanGegevens(Id);
            return "redirect:/artikel/readallartikel";
         }    
        
}
