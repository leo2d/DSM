/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.dao;

import dsm.dao.contracts.IGenericDAO;
import dsm.models.Payment;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author Leonardo
 */
public class PaymentDAO implements IGenericDAO<Payment> {

    @Override
    public void delete(Payment entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Payment entity) {
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
    public void create(Payment entity) {
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
    public List<Payment> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Payment getById(int id) {
        EntityManager em = null;
        try {
            em = open();

            return em.getReference(Payment.class, id);
        } catch (Exception e) {
            return null;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

}
