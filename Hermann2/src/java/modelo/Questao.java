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
@Table(name = "questao")
@NamedQueries({
    @NamedQuery(name = "Questao.findAll", query = "SELECT q FROM Questao q"),
    @NamedQuery(name="Questao.findByExercicio", query="SELECT q FROM Questao q WHERE q.ecod.ecod = :cod ORDER BY q.qcod")
})
public class Questao implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "qcod")
    private List<Respquest> respquestList;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "qcod")
    private Integer qcod;
    @Column(name = "eimg")
    private String eimg;
    @Column(name = "epergunta")
    private String epergunta;
    @Column(name = "ealt1")
    private String ealt1;
    @Column(name = "ealt2")
    private String ealt2;
    @Column(name = "ealt3")
    private String ealt3;
    @Column(name = "ealt4")
    private String ealt4;
    @Column(name = "ealt5")
    private String ealt5;
    @Basic(optional = false)
    @Column(name = "etipo")
    private String etipo;
    @Column(name = "eresposta")
    private String eresposta;
    @Column(name = "elegenda")
    private String elegenda;
    @JoinColumn(name = "ecod", referencedColumnName = "ecod")
    @ManyToOne(optional = false)
    private Exercicio ecod;

    public Questao() {
    }

    public Questao(Integer qcod) {
        this.qcod = qcod;
    }

    public Questao(Integer qcod, String etipo) {
        this.qcod = qcod;
        this.etipo = etipo;
    }

    public Integer getQcod() {
        return qcod;
    }

    public void setQcod(Integer qcod) {
        this.qcod = qcod;
    }

    public String getEimg() {
        return eimg;
    }

    public void setEimg(String eimg) {
        this.eimg = eimg;
    }

    public String getEpergunta() {
        return epergunta;
    }

    public void setEpergunta(String epergunta) {
        this.epergunta = epergunta;
    }

    public String getEalt1() {
        return ealt1;
    }

    public void setEalt1(String ealt1) {
        this.ealt1 = ealt1;
    }

    public String getEalt2() {
        return ealt2;
    }

    public void setEalt2(String ealt2) {
        this.ealt2 = ealt2;
    }

    public String getEalt3() {
        return ealt3;
    }

    public void setEalt3(String ealt3) {
        this.ealt3 = ealt3;
    }

    public String getEalt4() {
        return ealt4;
    }

    public void setEalt4(String ealt4) {
        this.ealt4 = ealt4;
    }

    public String getEalt5() {
        return ealt5;
    }

    public void setEalt5(String ealt5) {
        this.ealt5 = ealt5;
    }

    public String getEtipo() {
        return etipo;
    }

    public void setEtipo(String etipo) {
        this.etipo = etipo;
    }

    public String getEresposta() {
        return eresposta;
    }

    public void setEresposta(String eresposta) {
        this.eresposta = eresposta;
    }

    public String getElegenda() {
        return elegenda;
    }

    public void setElegenda(String elegenda) {
        this.elegenda = elegenda;
    }

    public Exercicio getEcod() {
        return ecod;
    }

    public void setEcod(Exercicio ecod) {
        this.ecod = ecod;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (qcod != null ? qcod.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Questao)) {
            return false;
        }
        Questao other = (Questao) object;
        if ((this.qcod == null && other.qcod != null) || (this.qcod != null && !this.qcod.equals(other.qcod))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Questao[ qcod=" + qcod + " ]";
    }

    public List<Respquest> getRespquestList() {
        return respquestList;
    }

    public void setRespquestList(List<Respquest> respquestList) {
        this.respquestList = respquestList;
    }
    
}
