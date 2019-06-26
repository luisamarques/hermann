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
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Luísa Marques
 */
@Entity
@Table(name = "professor")
@NamedQueries({
    @NamedQuery(name = "Professor.findAll", query = "SELECT p FROM Professor p"),
    @NamedQuery(name = "Professor.login", query = "SELECT p FROM Professor p WHERE p.pemail = :email AND p.psenha = :senha")
})
public class Professor implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "pcod")
    private Integer pcod;
    @Column(name = "pemail")
    private String pemail;
    @Column(name = "psenha")
    private String psenha;
    @Column(name = "pnome")
    private String pnome;
    @ManyToMany(mappedBy = "professorList")
    private List<Aluno> alunoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "pcod")
    private List<Disciplina> disciplinaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "pcod")
    private List<Apresentacao> apresentacaoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "pcod")
    private List<Exercicio> exercicioList;

    public Professor() {
    }

    public Professor(Integer pcod) {
        this.pcod = pcod;
    }

    public Integer getPcod() {
        return pcod;
    }

    public void setPcod(Integer pcod) {
        this.pcod = pcod;
    }

    public String getPemail() {
        return pemail;
    }

    public void setPemail(String pemail) {
        this.pemail = pemail;
    }

    public String getPsenha() {
        return psenha;
    }

    public void setPsenha(String psenha) {
        this.psenha = psenha;
    }

    public String getPnome() {
        return pnome;
    }

    public void setPnome(String pnome) {
        this.pnome = pnome;
    }

    public List<Aluno> getAlunoList() {
        return alunoList;
    }

    public void setAlunoList(List<Aluno> alunoList) {
        this.alunoList = alunoList;
    }

    public List<Disciplina> getDisciplinaList() {
        return disciplinaList;
    }

    public void setDisciplinaList(List<Disciplina> disciplinaList) {
        this.disciplinaList = disciplinaList;
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
        hash += (pcod != null ? pcod.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Professor)) {
            return false;
        }
        Professor other = (Professor) object;
        if ((this.pcod == null && other.pcod != null) || (this.pcod != null && !this.pcod.equals(other.pcod))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return pnome;
    }
    
}
