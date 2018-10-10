/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.dao;

import dsm.dao.contracts.IGenericDAO;
import dsm.dao.contracts.ILessonDAO;
import dsm.models.Instructor;
import dsm.models.Lesson;
import dsm.models.Registration;
import dsm.models.User;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author Leonardo
 */
public class LessonDAO implements IGenericDAO<Lesson>, ILessonDAO {

    @Override
    public void delete(Lesson entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Lesson entity) {
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
        EntityManager em = null;
        try {
            em = open();

            Query q = em.createQuery("SELECT l from Lesson l");

            return q.getResultList();
        } catch (Exception e) {
            return new ArrayList<>();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public Lesson getById(int id) {
        EntityManager em = null;
        try {
            em = open();

            return em.getReference(Lesson.class, id);
        } catch (Exception e) {
            return null;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public List<Lesson> getAllByInstructorId(int idInstructor) {
        EntityManager em = null;
        try {
            em = open();

            Query q = em.createQuery("SELECT l from Lesson l WHERE l.instructor = :id");

            Instructor temp = new Instructor();
            temp.setId(idInstructor);
            q.setParameter("id", temp);

            return q.getResultList();
        } catch (Exception e) {
            return new ArrayList<>();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public List<Lesson> getAllByRegistrationId(int idRegistration) {
        EntityManager em = null;
        try {
            em = open();

            Query q = em.createQuery("SELECT l from Lesson l WHERE l.registration = :id");

            Registration temp = new Registration();
            temp.setId(idRegistration);
            q.setParameter("id", temp);

            return q.getResultList();
        } catch (Exception e) {
            return new ArrayList<>();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public List<Lesson> getAllFree() {
        EntityManager em = null;
        try {
            em = open();

            Query q = em.createQuery("SELECT l from Lesson l WHERE l.registration = null");

            return q.getResultList();
        } catch (Exception e) {
            return new ArrayList<>();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

}
