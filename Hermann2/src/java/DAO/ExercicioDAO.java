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
public class ExercicioDAO extends GenericDAO<Exercicio, Integer> {

    public ExercicioDAO() {
        super(Exercicio.class);
    }

    public List<Exercicio> listarporprof(Professor p) {
        return em.createNamedQuery(persistedClass.getSimpleName() + ".findEByProf").setParameter("cod", p.getPcod()).getResultList();
    }

    public List<Exercicio> listarprovaspublicas(Professor p) {
        return em.createNamedQuery(persistedClass.getSimpleName() + ".findProva").setParameter("pcod", p.getPcod()).getResultList();
    }

    public List<Exercicio> listarexerciciospordisciplina(Disciplina d) {
        return em.createNamedQuery(persistedClass.getSimpleName() + ".findExercicioByDisciplina").setParameter("dcod", d.getDcod()).getResultList();
    }

    public List<Questao> listarporex(Exercicio e) {
        return em.createNamedQuery(persistedClass.getSimpleName() + ".findByExercicio").setParameter("cod", e.getEcod()).getResultList();
    }

    public List<Exercicio> listarpordisci(Disciplina d) {
        return em.createNamedQuery(persistedClass.getSimpleName() + ".findEByDisci").setParameter("cod", d.getDcod()).getResultList();
    }

    public List<Exercicio> listarprovaspublicas(Disciplina d) {
        return em.createNamedQuery(persistedClass.getSimpleName() + ".findProvaNathalia").setParameter("dcod", d.getDcod()).getResultList();
    }

   
}
