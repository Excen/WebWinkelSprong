/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anjewe.anjewewebwinkel.DAOs;


import com.anjewe.anjewewebwinkel.DAOGenerics.GenericDaoImpl;
import com.anjewe.anjewewebwinkel.POJO.Klant;
import org.springframework.transaction.annotation.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Anne
 */
@Component
public class KlantDao extends GenericDaoImpl <Klant, Long> {
    
    private static final Logger log = LoggerFactory.getLogger(ArtikelDao.class);

        public KlantDao(){
            super();
        }
       
    
    
    
     
    
}
