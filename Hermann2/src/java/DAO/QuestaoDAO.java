/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import modelo.Apresentacao;
import modelo.Disciplina;
import modelo.Exercicio;
import modelo.Professor;
import modelo.Questao;

/**
 *
 * @author Luísa Marques
 */
public class QuestaoDAO extends GenericDAO<Questao, Integer> {

    public QuestaoDAO() {
        super(Questao.class);
    }

    public List<Questao> listarporex(Exercicio e) {
        return em.createNamedQuery(persistedClass.getSimpleName() + ".findByExercicio").setParameter("cod", e.getEcod()).getResultList();
    }

    public List<Exercicio> listarporprof(Professor p) {
        return em.createNamedQuery(persistedClass.getSimpleName() + ".findEByProf").setParameter("cod", p.getPcod()).getResultList();
    }
}
