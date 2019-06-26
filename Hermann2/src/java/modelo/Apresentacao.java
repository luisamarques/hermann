/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Luísa Marques
 */
@Entity
@Table(name = "apresentacao")
@NamedQueries({
    @NamedQuery(name = "Apresentacao.findAll", query = "SELECT a FROM Apresentacao a"),
    @NamedQuery(name = "Apresentacao.findAByProf", query = "SELECT a FROM Apresentacao a WHERE a.pcod.pcod = :cod"),
    @NamedQuery(name= "Apresentacao.findUltimas5", query="SELECT a FROM Apresentacao a WHERE a.pcod.pcod = :cod ORDER BY a.apcod DESC"),
    @NamedQuery(name = "Apresentacao.findAByDisci", query = "SELECT a FROM Apresentacao a WHERE a.dcod.dcod = :cod")
})
public class Apresentacao implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "apcod")
    private Integer apcod;
    @Column(name = "atitulo")
    private String atitulo;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "apcod")
    private List<Slide> slideList;
    @JoinColumn(name = "dcod", referencedColumnName = "dcod")
    @ManyToOne(optional = false)
    private Disciplina dcod;
    @JoinColumn(name = "pcod", referencedColumnName = "pcod")
    @ManyToOne(optional = false)
    private Professor pcod;

    public Apresentacao() {
    }

    public Apresentacao(Integer apcod) {
        this.apcod = apcod;
    }

    public Integer getApcod() {
        return apcod;
    }

    public void setApcod(Integer apcod) {
        this.apcod = apcod;
    }

    public String getAtitulo() {
        return atitulo;
    }

    public void setAtitulo(String atitulo) {
        this.atitulo = atitulo;
    }

    public List<Slide> getSlideList() {
        return slideList;
    }

    public void setSlideList(List<Slide> slideList) {
        this.slideList = slideList;
    }

    public Disciplina getDcod() {
        return dcod;
    }

    public void setDcod(Disciplina dcod) {
        this.dcod = dcod;
    }

    public Professor getPcod() {
        return pcod;
    }

    public void setPcod(Professor pcod) {
        this.pcod = pcod;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (apcod != null ? apcod.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Apresentacao)) {
            return false;
        }
        Apresentacao other = (Apresentacao) object;
        if ((this.apcod == null && other.apcod != null) || (this.apcod != null && !this.apcod.equals(other.apcod))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Apresentacao[ apcod=" + apcod + " ]";
    }
    
}
