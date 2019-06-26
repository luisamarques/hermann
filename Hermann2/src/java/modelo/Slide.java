/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Luísa Marques
 */
@Entity
@Table(name = "slide")
@NamedQueries({
    @NamedQuery(name = "Slide.findAll", query = "SELECT s FROM Slide s ORDER BY s.scod"),
    @NamedQuery(name="Slide.findByApresentacao", query="SELECT s FROM Slide s WHERE s.apcod.apcod = :cod ORDER BY s.scod")})
public class Slide implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "scod")
    private Integer scod;
    @Column(name = "stitulo")
    private String stitulo;
    @Column(name = "stipo")
    private String stipo;
    @Column(name = "sresposta")
    private String sresposta;
    @Column(name = "stexto")
    private String stexto;
    @Column(name = "simg1")
    private String simg1;
    @Column(name = "slegendaimg1")
    private String slegendaimg1;
    @JoinColumn(name = "apcod", referencedColumnName = "apcod")
    @ManyToOne(optional = false)
    private Apresentacao apcod;

    public Slide() {
    }

    public Slide(Integer scod) {
        this.scod = scod;
    }

    public Integer getScod() {
        return scod;
    }

    public void setScod(Integer scod) {
        this.scod = scod;
    }

    public String getStitulo() {
        return stitulo;
    }

    public void setStitulo(String stitulo) {
        this.stitulo = stitulo;
    }

    public String getStipo() {
        return stipo;
    }

    public void setStipo(String stipo) {
        this.stipo = stipo;
    }

    public String getSresposta() {
        return sresposta;
    }

    public void setSresposta(String sresposta) {
        this.sresposta = sresposta;
    }

    public String getStexto() {
        return stexto;
    }

    public void setStexto(String stexto) {
        this.stexto = stexto;
    }

    public String getSimg1() {
        return simg1;
    }

    public void setSimg1(String simg1) {
        this.simg1 = simg1;
    }

    public String getSlegendaimg1() {
        return slegendaimg1;
    }

    public void setSlegendaimg1(String slegendaimg1) {
        this.slegendaimg1 = slegendaimg1;
    }

    public Apresentacao getApcod() {
        return apcod;
    }

    public void setApcod(Apresentacao apcod) {
        this.apcod = apcod;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (scod != null ? scod.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Slide)) {
            return false;
        }
        Slide other = (Slide) object;
        if ((this.scod == null && other.scod != null) || (this.scod != null && !this.scod.equals(other.scod))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Slide[ scod=" + scod + " ]";
    }
    
}
