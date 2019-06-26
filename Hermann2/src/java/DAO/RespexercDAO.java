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
import modelo.Respexerc;

/**
 *
 * @author Luísa Marques
 */
public class RespexercDAO  extends GenericDAO<Respexerc, Integer> {
    public RespexercDAO(){
        super(Respexerc.class);
    }
     public List<Respexerc> listarporexercicio(Exercicio e) {
      return em.createNamedQuery(persistedClass.getSimpleName()+".findRbyExercicio").setParameter("cod", e.getEcod()).getResultList();
   }
}
