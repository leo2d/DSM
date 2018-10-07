/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.dao;

import dsm.dao.contracts.IGenericDAO;
import dsm.dao.contracts.IStudentDAO;
import dsm.dao.contracts.IUserDAO;
import dsm.models.*;
import java.util.*;
import javax.persistence.*;

/**
 *
 * @author Leonardo
 */
public class StudentDAO implements IGenericDAO<Student>, IUserDAO<Student>, IStudentDAO {

    @Override
    public void delete(Student entity) {
        throw new UnsupportedOperationException("ainda nao implementei esse cara"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Student entity) {
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
    public void create(Student entity) {
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
    public List<Student> getAll() {
        throw new UnsupportedOperationException("ainda nao implementei esse cara"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Student getById(int id) {
        EntityManager em = null;
        try {
            em = open();

            return em.getReference(Student.class, id);
        } catch (Exception e) {
            return null;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public Student getByUserId(int id) {
        EntityManager em = null;
        try {
            em = open();
            String jpql = "select s from Student s "
                    + " where s.user = :id";

            User temp = new User();
            temp.setId(id);
            Query q = em.createQuery(jpql);
            q.setParameter("id", temp);

            Student student = (Student) q.getSingleResult();

            return student;
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

    public List<Student> getByName(String name) {
        EntityManager em = null;
        try {
            em = open();

            String query = "SELECT s FROM Student s"
                    + " WHERE s.name LIKE '%" + name + "%' ";

            Query q = em.createQuery(query);

            return q.getResultList();
        } catch (NoResultException e) {
            return new ArrayList<Student>();
        } catch (NonUniqueResultException e) {
            return new ArrayList<Student>();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }
}
