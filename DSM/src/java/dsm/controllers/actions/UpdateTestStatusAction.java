/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.controllers.actions;

import dsm.contracts.ICommander;
import dsm.dao.RegistrationDAO;
import dsm.models.Registration;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Leonardo
 */
public class UpdateTestStatusAction implements ICommander {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        RegistrationDAO regDao = new RegistrationDAO();

        Registration reg = regDao.getById(Integer.parseInt(request.getParameter("student")));
        reg.setWasApproved(Boolean.parseBoolean(request.getParameter("testResult")));
        
        regDao.update(reg);
        
        new HomeViewAction().execute(request, response);
    }

}
