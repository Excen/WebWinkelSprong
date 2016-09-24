package com.anjewe.anjewewebwinkel.POJO;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.stereotype.Component;
/**
 *
 * @author Excen
 */
@Component
@Entity
@Table(name = "BESTELLING")
public class Bestelling implements Serializable {
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column (unique = true, nullable = false, name = "BESTELLING_ID")
    private long Id;
    
    @ManyToOne (fetch = FetchType.EAGER)
    @JoinColumn (name = "KLANT_ID")
    private Klant klant;   
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date bestellingDatum;
    
    @OneToMany (fetch = FetchType.LAZY, mappedBy = "pk.bestelling", cascade = CascadeType.ALL)
    private Set<BestellingArtikel> bestellingArtikellen = new HashSet<>(0);
    
    @OneToOne (mappedBy = "bestelling")
    private Factuur factuur; 

    public Bestelling(Klant klant, Date bestellingDatum, Factuur factuur) {        
        this.klant = klant;
        this.bestellingDatum = bestellingDatum;
        this.factuur = factuur;
    }
    
    public Bestelling(){}
    
    
    public long getId() {
        return Id;
    }

    public void setId(long Id) {
        this.Id = Id;
    }

    public Klant getKlant() {
        return klant;
    }

    public void setKlant(Klant klant) {
        this.klant = klant;
    }

    public Set<BestellingArtikel> getBestellingArtikellen() {
        return bestellingArtikellen;
    }

    /**
     * @param bestellingArtikellen the bestellingArtikellen to set
     */
    public void setBestellingArtikellen(Set<BestellingArtikel> bestellingArtikellen) {
        this.bestellingArtikellen = bestellingArtikellen;
    }

    /**
     * @return the factuur
     */
    public Factuur getFactuur() {
        return factuur;
    }

    /**
     * @param factuur the factuur to set
     */
    public void setFactuur(Factuur factuur) {
        this.factuur = factuur;
    }
    
    @Override
    public String toString(){
         String output = "Bestelling ID: " + this.getId() + "\n Klant ID: " + this.getKlant().getId();
         return output;
    }

    public Date getBestellingDatum() {
        return bestellingDatum;
    }

    public void setBestellingDatum(Date bestellingDatum) {
        this.bestellingDatum = bestellingDatum;
    }
    
    
}
