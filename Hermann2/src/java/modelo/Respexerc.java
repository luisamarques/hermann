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
@Table(name = "respexerc")
@NamedQueries({
    @NamedQuery(name = "Respexerc.findAll", query = "SELECT r FROM Respexerc r"),
    @NamedQuery(name="Respexerc.findRbyExercicio", query="SELECT r FROM Respexerc r WHERE r.ecod.ecod = :cod")
})
public class Respexerc implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "recod")
    private Integer recod;
    @JoinColumn(name = "acod", referencedColumnName = "acod")
    @ManyToOne(optional = false)
    private Aluno acod;
    @JoinColumn(name = "ecod", referencedColumnName = "ecod")
    @ManyToOne(optional = false)
    private Exercicio ecod;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "recod")
    private List<Respquest> respquestList;

    public Respexerc() {
    }

    public Respexerc(Integer recod) {
        this.recod = recod;
    }

    public Integer getRecod() {
        return recod;
    }

    public void setRecod(Integer recod) {
        this.recod = recod;
    }

    public Aluno getAcod() {
        return acod;
    }

    public void setAcod(Aluno acod) {
        this.acod = acod;
    }

    public Exercicio getEcod() {
        return ecod;
    }

    public void setEcod(Exercicio ecod) {
        this.ecod = ecod;
    }

    public List<Respquest> getRespquestList() {
        return respquestList;
    }

    public void setRespquestList(List<Respquest> respquestList) {
        this.respquestList = respquestList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (recod != null ? recod.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Respexerc)) {
            return false;
        }
        Respexerc other = (Respexerc) object;
        if ((this.recod == null && other.recod != null) || (this.recod != null && !this.recod.equals(other.recod))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Respexerc[ recod=" + recod + " ]";
    }
    
}
