<%-- 
    Document   : SelectStudentRegistration
    Created on : Oct 9, 2018, 11:22:32 AM
    Author     : Leonardo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="container">
    <form class="" action="?ac=findLessons" method="POST" >
        <title>Selecione a matricula</title>
        <br>
        <h4>Selecione a matricula para continuar</h4>
        <br>
        <table class="highlight">
            <thead>
                <tr>
                    <th></th>
                    <th>Matricula</th>
                    <th>Nome</th>
                    <th>Prova</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach items="${requestScope.result}" var="r">
                    <tr>
                        <td>
                            <p>
                                <input class='validate' type='radio' name='registration' value="${r.id}" id="${r.id}" />
                                <label for='${r.id}'></label>
                            </p>                    
                        </td>                    
                        <td name="idregistration" value="${r.id}">${r.id}</td>
                        <td name="name">${r.student.name}</td>
                        <td name="name">${r.wasApproved ? "Aprovado" : "Reprovado"}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="btn-save">
            <div class='row' style="display: flex; justify-content: space-between">
                <button type='submit' name='continue' vlaue="continue" class=' space col s12 btn btn-large waves-effect indigo'>Continuar</button>
            </div>
        </div>
    </form>
</div>
