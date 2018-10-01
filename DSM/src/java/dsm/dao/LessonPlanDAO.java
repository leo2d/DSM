/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.dao;

import dsm.dao.contracts.IGenericDAO;
import dsm.models.LessonPlan;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author Leonardo
 */
public class LessonPlanDAO implements IGenericDAO<LessonPlan> {

    @Override
    public void delete(LessonPlan entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(LessonPlan entity) {
        EntityManager em = null;
        try {
            em = open();
            em.getTransaction().begin();
            em.merge(entity);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public void create(LessonPlan entity) {
        EntityManager em = null;
        try {
            em = open();
            em.getTransaction().begin();
            em.persist(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("e");
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public List<LessonPlan> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public LessonPlan getById(int id) {
        EntityManager em = null;
        try {
            em = open();

            return em.getReference(LessonPlan.class, id);
        } catch (Exception e) {
            return null;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

}
