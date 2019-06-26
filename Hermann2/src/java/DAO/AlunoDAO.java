/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import javax.persistence.Query;
import modelo.Aluno;

/**
 *
 * @author Luísa Marques
 */
public class AlunoDAO extends GenericDAO<Aluno, Integer> {

    public AlunoDAO() {
        super(Aluno.class);
    }

    public Aluno logar(String email, String senha) {
        Aluno retorno;
        Query q = em.createNamedQuery("Aluno.login").setParameter("email", email).setParameter("senha", senha);
        try {
            retorno = (Aluno) q.getSingleResult();

        } catch (Exception e) {
            retorno = null;
        }
        return retorno;
    }
}
