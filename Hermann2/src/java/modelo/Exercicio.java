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
@Table(name = "exercicio")
@NamedQueries({
    @NamedQuery(name = "Exercicio.findAll", query = "SELECT e FROM Exercicio e"),
    @NamedQuery(name= "Exercicio.findProva", query= "SELECT e FROM Exercicio e WHERE e.etipo = 'pro' AND e.epublico = true AND e.pcod.pcod = :pcod"),
    @NamedQuery(name="Exercicio.findExercicioByDisciplina", query="SELECT e FROM Exercicio e WHERE e.etipo = 'exe' AND e.dcod.dcod = :dcod"),
    @NamedQuery(name="Exercicio.findEByProf", query="SELECT e FROM Exercicio e WHERE e.pcod.pcod = :cod"),
    @NamedQuery(name = "Exercicio.findEByDisci", query = "SELECT e FROM Exercicio e WHERE e.dcod.dcod = :cod"),
    @NamedQuery(name= "Exercicio.findProvaNathalia", query= "SELECT e FROM Exercicio e WHERE e.etipo = 'pro' AND e.epublico = true AND e.dcod.dcod = :dcod"),
    @NamedQuery(name="Exercicio.findExercicioByDisciplina", query="SELECT e FROM Exercicio e WHERE e.etipo = 'exe' AND e.dcod.dcod = :dcod")
    
})
public class Exercicio implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ecod")
    private List<Respexerc> respexercList;
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ecod")
    private Integer ecod;
    @Basic(optional = false)
    @Column(name = "etitulo")
    private String etitulo;
    @Basic(optional = false)
    @Column(name = "epublico")
    private boolean epublico;
    @Basic(optional = false)
    @Column(name = "etipo")
    private String etipo;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ecod")
    private List<Questao> questaoList;
    @JoinColumn(name = "dcod", referencedColumnName = "dcod")
    @ManyToOne(optional = false)
    private Disciplina dcod;
    @JoinColumn(name = "pcod", referencedColumnName = "pcod")
    @ManyToOne(optional = false)
    private Professor pcod;

    public Exercicio() {
    }

    public Exercicio(Integer ecod) {
        this.ecod = ecod;
    }

    public Exercicio(Integer ecod, String etitulo, boolean epublico, String etipo) {
        this.ecod = ecod;
        this.etitulo = etitulo;
        this.epublico = epublico;
        this.etipo = etipo;
    }

    public Integer getEcod() {
        return ecod;
    }

    public void setEcod(Integer ecod) {
        this.ecod = ecod;
    }

    public String getEtitulo() {
        return etitulo;
    }

    public void setEtitulo(String etitulo) {
        this.etitulo = etitulo;
    }

    public boolean getEpublico() {
        return epublico;
    }

    public void setEpublico(boolean epublico) {
        this.epublico = epublico;
    }

    public String getEtipo() {
        return etipo;
    }

    public void setEtipo(String etipo) {
        this.etipo = etipo;
    }

    public List<Questao> getQuestaoList() {
        return questaoList;
    }

    public void setQuestaoList(List<Questao> questaoList) {
        this.questaoList = questaoList;
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
        hash += (ecod != null ? ecod.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Exercicio)) {
            return false;
        }
        Exercicio other = (Exercicio) object;
        if ((this.ecod == null && other.ecod != null) || (this.ecod != null && !this.ecod.equals(other.ecod))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Exercicio[ ecod=" + ecod + " ]";
    }

    public List<Respexerc> getRespexercList() {
        return respexercList;
    }

    public void setRespexercList(List<Respexerc> respexercList) {
        this.respexercList = respexercList;
    }
    
}
