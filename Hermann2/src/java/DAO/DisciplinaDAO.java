/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import modelo.Aluno;
import modelo.Disciplina;
import modelo.Professor;

/**
 *
 * @author Luísa Marques
 */
public class DisciplinaDAO extends GenericDAO<Disciplina, Integer> {

    public DisciplinaDAO() {
        super(Disciplina.class);
    }

    public List<Disciplina> listarporprof(Professor p) {
        return em.createNamedQuery(persistedClass.getSimpleName() + ".findByProf").setParameter("cod", p.getPcod()).getResultList();
    }

    public List<Disciplina> listarporaluno(Aluno a) {
        return em.createNamedQuery(persistedClass.getSimpleName() + ".findByAluno").setParameter("cod", a.getAcod()).getResultList();
    }
}
