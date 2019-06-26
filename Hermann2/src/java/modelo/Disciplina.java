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
import javax.persistence.ManyToMany;
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
@Table(name = "disciplina")
@NamedQueries({
    @NamedQuery(name = "Disciplina.findAll", query = "SELECT d FROM Disciplina d ORDER BY d.dnome"),
    @NamedQuery(name="Disciplina.findByProf", query ="SELECT d FROM Disciplina d WHERE d.pcod.pcod = :cod")
    
    
})
public class Disciplina implements Serializable {

    @ManyToMany(mappedBy = "disciplinaList")
    private List<Aluno> alunoList;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "dcod")
    private Integer dcod;
    @Basic(optional = false)
    @Column(name = "dnome")
    private String dnome;
    @Basic(optional = false)
    @Column(name = "dperiodo")
    private String dperiodo;
    @JoinColumn(name = "pcod", referencedColumnName = "pcod")
    @ManyToOne(optional = false)
    private Professor pcod;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "dcod")
    private List<Apresentacao> apresentacaoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "dcod")
    private List<Exercicio> exercicioList;

    public Disciplina() {
    }

    public Disciplina(Integer dcod) {
        this.dcod = dcod;
    }

    public Disciplina(Integer dcod, String dnome, String dperiodo) {
        this.dcod = dcod;
        this.dnome = dnome;
        this.dperiodo = dperiodo;
    }

    public Integer getDcod() {
        return dcod;
    }

    public void setDcod(Integer dcod) {
        this.dcod = dcod;
    }

    public String getDnome() {
        return dnome;
    }

    public void setDnome(String dnome) {
        this.dnome = dnome;
    }

    public String getDperiodo() {
        return dperiodo;
    }

    public void setDperiodo(String dperiodo) {
        this.dperiodo = dperiodo;
    }

    public Professor getPcod() {
        return pcod;
    }

    public void setPcod(Professor pcod) {
        this.pcod = pcod;
    }

    public List<Apresentacao> getApresentacaoList() {
        return apresentacaoList;
    }

    public void setApresentacaoList(List<Apresentacao> apresentacaoList) {
        this.apresentacaoList = apresentacaoList;
    }

    public List<Exercicio> getExercicioList() {
        return exercicioList;
    }

    public void setExercicioList(List<Exercicio> exercicioList) {
        this.exercicioList = exercicioList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (dcod != null ? dcod.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Disciplina)) {
            return false;
        }
        Disciplina other = (Disciplina) object;
        if ((this.dcod == null && other.dcod != null) || (this.dcod != null && !this.dcod.equals(other.dcod))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return dnome;
    }

    public List<Aluno> getAlunoList() {
        return alunoList;
    }

    public void setAlunoList(List<Aluno> alunoList) {
        this.alunoList = alunoList;
    }
    
}
