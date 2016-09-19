/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package com.anjewe.anjewewebwinkel.POJO;



/**
 * @author Wendy
 */
public enum AdresType {
    
    POSTADRES{
        @Override
        public String getAdresType() {
            return "postadres";
        }
    },
    BEZORGADRES{
        @Override
        public String getAdresType() {
            return "bezorgadres";
        }
    },
    FACTUURADRES{
        @Override
        public String getAdresType() {
            return "factuuradres";
        }
    },
    KADOADRES{
        @Override
        public String getAdresType() {
            return "kadoadres";
        }
    },
    AFHAALPUNT{
        @Override
        public String getAdresType() {
            return "afhaalpunt";
        }
    };

   
    
    public abstract String getAdresType();
    
    private long adresTypeId;
    
    public long getAdresTypeId() {
        return adresTypeId;
    }

    public void setAdresTypeId(long adresTypeId) {
        this.adresTypeId = adresTypeId;
    }
}

