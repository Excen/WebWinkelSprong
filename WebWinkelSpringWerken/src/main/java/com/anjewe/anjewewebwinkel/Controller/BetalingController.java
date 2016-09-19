


package com.anjewe.anjewewebwinkel.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Wendy
 */
@Controller
public class BetalingController {

private static final Logger log = LoggerFactory.getLogger(BetalingController.class);

    // startpagina
    @RequestMapping(value = "/betaling/homebetaling", method = RequestMethod.GET)
    public String betaling(){
        return "betaling/homebetaling";
    }
    
    // create
    
    // read
    
    // update
    
    // delete

}
