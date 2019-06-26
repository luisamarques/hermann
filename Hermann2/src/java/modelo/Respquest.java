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
@Table(name = "respquest")
@NamedQueries({
    @NamedQuery(name = "Respquest.findAll", query = "SELECT r FROM Respquest r"),
    @NamedQuery(name = "Respquest.findRqByRe", query = "SELECT rq FROM Respquest rq WHERE rq.recod.recod = :cod")

})
public class Respquest implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "rqcod")
    private Integer rqcod;
    @Basic(optional = false)
    @Column(name = "resposta")
    private String resposta;
    @JoinColumn(name = "qcod", referencedColumnName = "qcod")
    @ManyToOne(optional = false)
    private Questao qcod;
    @JoinColumn(name = "recod", referencedColumnName = "recod")
    @ManyToOne(optional = false)
    private Respexerc recod;

    public Respquest() {
    }

    public Respquest(Integer rqcod) {
        this.rqcod = rqcod;
    }

    public Respquest(Integer rqcod, String resposta) {
        this.rqcod = rqcod;
        this.resposta = resposta;
    }

    public Integer getRqcod() {
        return rqcod;
    }

    public void setRqcod(Integer rqcod) {
        this.rqcod = rqcod;
    }

    public String getResposta() {
        return resposta;
    }

    public void setResposta(String resposta) {
        this.resposta = resposta;
    }

    public Questao getQcod() {
        return qcod;
    }

    public void setQcod(Questao qcod) {
        this.qcod = qcod;
    }

    public Respexerc getRecod() {
        return recod;
    }

    public void setRecod(Respexerc recod) {
        this.recod = recod;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (rqcod != null ? rqcod.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Respquest)) {
            return false;
        }
        Respquest other = (Respquest) object;
        if ((this.rqcod == null && other.rqcod != null) || (this.rqcod != null && !this.rqcod.equals(other.rqcod))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Respquest[ rqcod=" + rqcod + " ]";
    }

}
