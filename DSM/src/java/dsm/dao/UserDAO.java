/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.dao;

import dsm.dao.contracts.IGenericDAO;
import dsm.models.User;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Query;

/**
 *
 * @author Leonardo
 */
public class UserDAO implements IGenericDAO<User> {

    @Override
    public void update(User entity) {
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
    public void create(User entity) {
        EntityManager em = null;
        try {
            em = open();
            em.getTransaction().begin();
            em.persist(entity);
            em.getTransaction().commit();
        } 
        catch(Exception e){
            System.out.println("e");
        }
        finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public List<User> getAll() {
        EntityManager em = null;
        try {
            em = open();

            Query q = em.createNamedQuery("User.findAll");

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
    public User getById(int id) {
        EntityManager em = null;
        try {
            em = open();

            return em.getReference(User.class, id);
        } catch (Exception e) {
            return null;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public void delete(User entity) {
        EntityManager em = null;
        try {
            em = open();
            em.getTransaction().begin();
            em.remove(entity);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public User getByLoginAndPassword(String login, String password) {
        EntityManager em = null;
        try {
            em = open();
            String jpql = "select u from User u "
                    + " where u.login = :log and u.password = :pass ";
                    

            Query q = em.createQuery(jpql);
            q.setParameter("log", login);
            q.setParameter("pass", password);

            User user = (User) q.getSingleResult();
            return user;
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
