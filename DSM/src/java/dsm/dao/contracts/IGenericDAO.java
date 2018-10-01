/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.dao.contracts;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Leonardo
 */
public interface IGenericDAO <T>{

    default EntityManager open() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("DSMPU");
        EntityManager em = emf.createEntityManager();
        return em;
    }
    
    void delete(T entity);
    void update(T entity);
    void create(T entity);
    List<T>getAll();
    T getById(final int id);
    
}
