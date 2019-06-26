/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import modelo.Apresentacao;
import modelo.Slide;

/**
 *
 * @author Luísa Marques
 */
public class SlideDAO extends GenericDAO<Slide, Integer>{
    public SlideDAO(){
        super(Slide.class);
    }
    public List<Slide> listarporap(Apresentacao a) {
      return em.createNamedQuery(persistedClass.getSimpleName()+".findByApresentacao").setParameter("cod", a.getApcod()).getResultList();
   }
}
