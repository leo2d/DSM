/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.controllers.actions;

import dsm.contracts.ICommander;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Leonardo
 */
public class ManageTestsViewAction implements ICommander {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
         RequestDispatcher rd = request.getRequestDispatcher("page.jsp?page=authorize/ManageTests");
        rd.forward(request, response);
    }
    
}
