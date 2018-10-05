/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.dao;

import dsm.dao.contracts.IGenericDAO;
import dsm.models.Lesson;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author Leonardo
 */
public class LessonDAO implements IGenericDAO<Lesson> {

    @Override
    public void delete(Lesson entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Lesson entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void create(Lesson entity) {
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
    public List<Lesson> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Lesson getById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
