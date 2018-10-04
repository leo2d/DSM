/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.dao;

import dsm.dao.contracts.*;
import dsm.models.*;
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
public class InstructorDAO implements IGenericDAO<Instructor>, IUserDAO<Instructor> {

    @Override
    public void delete(Instructor entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Instructor entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void create(Instructor entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Instructor> getAll() {
        EntityManager em = null;
        try {
            em = open();
            String jpql = "SELECT u FROM Instructor u";

            Query q = em.createQuery(jpql);

            return q.getResultList();
        } catch (NoResultException e) {
            return new ArrayList<Instructor>();
        } catch (NonUniqueResultException e) {
            return new ArrayList<Instructor>();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public Instructor getById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Instructor getByUserId(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
