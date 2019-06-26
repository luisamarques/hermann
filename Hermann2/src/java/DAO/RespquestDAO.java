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
import modelo.Respquest;

/**
 *
 * @author Luísa Marques
 */
public class RespquestDAO  extends GenericDAO<Respquest, Integer> {
    public RespquestDAO(){
        super(Respquest.class);
    }
    public List<Respquest> listarporrespexerc(Respexerc re) {
      return em.createNamedQuery(persistedClass.getSimpleName()+".findRqByRe").setParameter("cod", re.getRecod()).getResultList();
   }
}
