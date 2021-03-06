/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anjewe.anjewewebwinkel.POJO;

import java.io.Serializable;
import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.stereotype.Component;
/**
 *
 * @author Excen
 */
@Component
@Entity
@Table (name ="BESTELLINGARTIKEL")
@AssociationOverrides({
		@AssociationOverride(name = "pk.bestelling",
			joinColumns = @JoinColumn(name = "BESTELLING_ID")),
		@AssociationOverride(name = "pk.artikel",
			joinColumns = @JoinColumn(name = "ARTIKEL_ID")) })



public class BestellingArtikel implements Serializable {

    @EmbeddedId
    private BestellingArtikelId pk = new BestellingArtikelId();
    
    @Column (nullable = false) 
    private int artikelAantal;
//    
//    @ManyToOne
//    @JoinColumn (name = "ARTIKEL_ID", insertable = false, updatable = false)
//    private Artikel artikel;
//    
//    @ManyToOne
//    @JoinColumn (name = "BESTELLING_ID", insertable = false, updatable = false)
//    private Bestelling bestelling;
//    
//   
    
    
    // Constructor
    public BestellingArtikel(int artikelAantal){     
        this.artikelAantal = artikelAantal;
    }
    
    public BestellingArtikel(){
    }    
  

    /**
     * @return the artikelAantal
     */
    public int getArtikelAantal() {
        return artikelAantal;
    }

    /**
     * @param artikelAantal the artikelAantal to set
     */
    public void setArtikelAantal(int artikelAantal) {
        this.artikelAantal = artikelAantal;
    }

    /**
     * @return the pk
     */
    public BestellingArtikelId getPk() {
        return pk;
    }

    /**
     * @param pk the pk to set
     */
    public void setPk(BestellingArtikelId pk) {
        this.pk = pk;
    }

    /**
     * @return the artikel
     */
    @Transient
    public Artikel getArtikel() {
        return getPk().getArtikel();
    }

    /**
     * @param artikel the artikel to set
     */
    public void setArtikel(Artikel artikel) {
        getPk().setArtikel(artikel);
    }

    /**
     * @return the bestelling
     */
    @Transient
    public Bestelling getBestelling() {
        return getPk().getBestelling();
    }

    /**
     * @param bestelling the bestelling to set
     */
    public void setBestelling(Bestelling bestelling) {
        getPk().setBestelling(bestelling);
    }

       @Override
        public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		BestellingArtikel that = (BestellingArtikel) o;

		return !(getPk() != null ? !getPk().equals(that.getPk())
                        : that.getPk() != null);
	}

        @Override
	public int hashCode() {
		return (getPk() != null ? getPk().hashCode() : 0);
	}
        
       
   
    
    
    
    
    
    
}
