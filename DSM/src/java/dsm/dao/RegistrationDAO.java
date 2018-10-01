/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.dao;

import dsm.dao.contracts.IGenericDAO;
import dsm.dao.contracts.IRegistrationDAO;
import dsm.models.Registration;
import dsm.models.Student;
import dsm.models.User;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Query;

/**
 *
 * @author Leonardo
 */
public class RegistrationDAO implements IGenericDAO<Registration>, IRegistrationDAO {

    @Override
    public void delete(Registration entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Registration entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void create(Registration entity) {
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
    public List<Registration> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Registration getById(int id) {
        EntityManager em = null;
        try {
            em = open();

            return em.getReference(Registration.class, id);
        } catch (Exception e) {
            return null;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public List<Registration> getByStudentId(int id) {
        EntityManager em = null;
        try {
            em = open();
            String jpql = "select r from Registration r "
                    + " where r.student = :stu ";
            
            Student s = new Student();
            s.setId(id);
            Query q = em.createQuery(jpql);
            q.setParameter("stu", s);

            return q.getResultList();
        } catch (NoResultException e) {
            return null;
        } catch (NonUniqueResultException e) {
            return null;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public List<Registration> getWithLessons() {
        EntityManager em = null;
        try {
            em = open();
            String jpql = "select r from Registration r "
                    + " INNER JOIN Lesson l ";

            Query q = em.createQuery(jpql);
            // q.setParameter("id", id);

            return q.getResultList();
        } catch (NoResultException e) {
            return null;
        } catch (NonUniqueResultException e) {
            return null;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

}
