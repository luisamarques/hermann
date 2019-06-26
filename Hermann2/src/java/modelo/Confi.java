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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author Luísa Marques
 */
@Entity
@Table(name = "confi")
@NamedQueries({
    @NamedQuery(name = "Confi.findAll", query = "SELECT c FROM Confi c")})
public class Confi implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ccod")
    private Integer ccod;
    @Column(name = "ctamanho")
    private Integer ctamanho;
    @Column(name = "cestilo")
    private String cestilo;
    @Column(name = "cvoz")
    private Integer cvoz;
    @OneToOne(mappedBy = "config")
    private Aluno aluno;

    public Confi() {
    }

    public Confi(Integer ccod) {
        this.ccod = ccod;
    }

    public Integer getCcod() {
        return ccod;
    }

    public void setCcod(Integer ccod) {
        this.ccod = ccod;
    }

    public Integer getCtamanho() {
        return ctamanho;
    }

    public void setCtamanho(Integer ctamanho) {
        this.ctamanho = ctamanho;
    }

    public String getCestilo() {
        return cestilo;
    }

    public void setCestilo(String cestilo) {
        this.cestilo = cestilo;
    }

    public Integer getCvoz() {
        return cvoz;
    }

    public void setCvoz(Integer cvoz) {
        this.cvoz = cvoz;
    }

    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }
    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ccod != null ? ccod.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Confi)) {
            return false;
        }
        Confi other = (Confi) object;
        if ((this.ccod == null && other.ccod != null) || (this.ccod != null && !this.ccod.equals(other.ccod))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Confi[ ccod=" + ccod + " ]";
    }

}
