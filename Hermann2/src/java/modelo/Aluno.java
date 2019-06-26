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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author Luísa Marques
 */
@Entity
@Table(name = "aluno")
@NamedQueries({
    @NamedQuery(name = "Aluno.findAll", query = "SELECT a FROM Aluno a ORDER BY a.anome"),
    @NamedQuery(name="Aluno.login", query="SELECT a FROM Aluno a WHERE a.aemail = :email AND a.asenha = :senha")
})
public class Aluno implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "acod")
    private List<Respexerc> respexercList;

    @JoinTable(name = "alunodisci", joinColumns = {
        @JoinColumn(name = "acod", referencedColumnName = "acod")}, inverseJoinColumns = {
        @JoinColumn(name = "dcod", referencedColumnName = "dcod")})
    @ManyToMany
    private List<Disciplina> disciplinaList;

    @OneToOne
    private Confi config;
    
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "acod")
    private Integer acod;
    @Column(name = "aemail")
    private String aemail;
    @Column(name = "asenha")
    private String asenha;
    @Column(name = "anome")
    private String anome;
    @JoinTable(name = "profaluno", joinColumns = {
        @JoinColumn(name = "acod", referencedColumnName = "acod")}, inverseJoinColumns = {
        @JoinColumn(name = "pcod", referencedColumnName = "pcod")})
    @ManyToMany
    private List<Professor> professorList;

    public Aluno() {
    }

    public Aluno(Integer acod) {
        this.acod = acod;
    }

    public Integer getAcod() {
        return acod;
    }

    public void setAcod(Integer acod) {
        this.acod = acod;
    }

    public String getAemail() {
        return aemail;
    }

    public void setAemail(String aemail) {
        this.aemail = aemail;
    }

    public String getAsenha() {
        return asenha;
    }

    public void setAsenha(String asenha) {
        this.asenha = asenha;
    }

    public String getAnome() {
        return anome;
    }

    public void setAnome(String anome) {
        this.anome = anome;
    }

    public List<Professor> getProfessorList() {
        return professorList;
    }

    public void setProfessorList(List<Professor> professorList) {
        this.professorList = professorList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (acod != null ? acod.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Aluno)) {
            return false;
        }
        Aluno other = (Aluno) object;
        if ((this.acod == null && other.acod != null) || (this.acod != null && !this.acod.equals(other.acod))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Aluno[ acod=" + acod + " ]";
    }

    public List<Disciplina> getDisciplinaList() {
        return disciplinaList;
    }

    public void setDisciplinaList(List<Disciplina> disciplinaList) {
        this.disciplinaList = disciplinaList;
    }

    public List<Respexerc> getRespexercList() {
        return respexercList;
    }

    public void setRespexercList(List<Respexerc> respexercList) {
        this.respexercList = respexercList;
    }

    public Confi getConfig() {
        return config;
    }

    public void setConfig(Confi config) {
        this.config = config;
    }

    
    
}
