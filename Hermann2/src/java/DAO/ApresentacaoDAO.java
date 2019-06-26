/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import modelo.Apresentacao;
import modelo.Disciplina;
import modelo.Professor;

/**
 *
 * @author Luísa Marques
 */
public class ApresentacaoDAO extends GenericDAO<Apresentacao, Integer> {

    public ApresentacaoDAO() {
        super(Apresentacao.class);
    }

    public List<Apresentacao> listarporprof(Professor p) {
        return em.createNamedQuery(persistedClass.getSimpleName() + ".findAByProf").setParameter("cod", p.getPcod()).getResultList();
    }

    public List<Apresentacao> listarultimas(Professor p) {
        return em.createNamedQuery(persistedClass.getSimpleName() + ".findUltimas5").setMaxResults(5).setParameter("cod", p.getPcod()).getResultList();
    }

    public List<Apresentacao> listarpordisci(Disciplina d) {
        return em.createNamedQuery(persistedClass.getSimpleName() + ".findAByDisci").setParameter("cod", d.getDcod()).getResultList();
    }
}
