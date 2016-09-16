


package com.anjewe.anjewewebwinkel.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * @author Wendy
 */
@Controller
public class HomeController {

private static final Logger log = LoggerFactory.getLogger(HomeController.class);

    @RequestMapping (value = "/", method = GET)        
    public String home(){
        return "home";
    }
    
    @RequestMapping (value = "/factuur/homefactuur", method = GET)
    public String factuur(){
        return "factuur/homefactuur";
    }
   
    
    @RequestMapping (value = "/account/homeaccount", method = GET)
    public String account(){
        return "account/homeaccount";
    }

}
