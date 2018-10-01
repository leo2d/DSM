/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.dao;

import dsm.dao.contracts.IGenericDAO;
import dsm.dao.contracts.IUserDAO;
import dsm.models.Employee;
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
public class EmployeeDAO implements IGenericDAO<Employee>, IUserDAO<Employee> {

    @Override
    public void delete(Employee entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Employee entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void create(Employee entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Employee> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Employee getById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Employee getByUserId(int id) {
        EntityManager em = null;
        try {
            em = open();
            String jpql = "select e from Employee e "
                    + " where e.user = :userId";

            User temp = new User();
            temp.setId(id);
            Query q = em.createQuery(jpql);
            q.setParameter("userId", temp);

            Employee employee = (Employee) q.getSingleResult();

            return employee;
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
