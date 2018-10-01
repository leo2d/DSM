/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.dao.contracts;

/**
 *
 * @author Leonardo
 */
public interface IUserDAO <T>{
    T getByUserId(int id);
}
