/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.contracts;

/**
 *
 * @author leo-r
 */
public interface IEncryption {
    String encrypt(String password);
    String decrypt(String password);
}
