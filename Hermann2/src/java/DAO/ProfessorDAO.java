/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import javax.persistence.Query;
import modelo.Professor;

/**
 *
 * @author Luísa Marques
 */
public class ProfessorDAO extends GenericDAO<Professor, Integer>{
    public ProfessorDAO(){
        super(Professor.class);
    }
    public Professor logar(String email, String senha)
    {
        Professor retorno;
        Query q = em.createNamedQuery("Professor.login").setParameter("email", email).setParameter("senha",senha);
        try {
            retorno = (Professor)q.getSingleResult();
            
        } catch (Exception e) {
            retorno =  null;
        }
        return retorno;
}
    
}
