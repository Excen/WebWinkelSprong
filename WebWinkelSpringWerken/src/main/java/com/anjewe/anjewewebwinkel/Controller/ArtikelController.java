


package com.anjewe.anjewewebwinkel.Controller;

import com.anjewe.anjewewebwinkel.POJO.Artikel;
import com.anjewe.anjewewebwinkel.Service.ArtikelService;
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
import static org.springframework.web.bind.annotation.RequestMethod.GET;

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
    
     // ga naar begin pagina artikelen
        @RequestMapping (value = "/artikel/homeartikel", method = RequestMethod.GET)
        public String artikel(){
            return "artikel/homeartikel";
        }

        //create
        @RequestMapping (value = {"artikel", "/artikel/createartikel"}, method = RequestMethod.GET)
        public String nieuwArtikel(ModelMap model){
            Artikel artikel = new Artikel();
            // haal gegevens op voor artikel > view?
            artikelService.voegNieuweBeanToe(artikel);
            
            model.addAttribute("artikel", artikel);
            model.addAttribute("edit", false);  //betekenis?
            
            return "artikel/createartikel";
        }

        // save
        
         /**
         * Lijst bestaande accounts
         * @param model
         * @return 
         */
        
        // read
        @RequestMapping (value = {"artikelen", "/artikel/readallartikel" }, method = RequestMethod.GET)
        public String listArtikelen(ModelMap model){
            
            ArrayList <Artikel> artikelLijst = (ArrayList <Artikel>) artikelService.zoekAlleBeans();
            model.addAttribute("artikellijst", artikelLijst);
            return "artikel/readallartikel";
        }

        // update


        //delete

}
