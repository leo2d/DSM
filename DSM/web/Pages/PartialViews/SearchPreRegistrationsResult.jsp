<%-- 
    Document   : SearchPreRegistrationsResult
    Created on : Oct 6, 2018, 11:41:29 PM
    Author     : Leonardo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<table class="highlight">
    <thead>
        <tr>
            <th></th>
            <th>Código</th>
            <th>Nome</th>
            <th>Email</th>
        </tr>
    </thead>

    <tbody>
        <c:forEach items="${requestScope.result}" var="r">
            <tr>
                <td>
                    <p>
                        <input class='validate' type='radio' name='student' value="${r.id}" id="${r.id}" />
                        <label for='${r.id}'></label>
                    </p>                    
                </td>                    
                <td name="idregistration" value="${r.id}">${r.id}</td>
                <td name="name">${r.name}</td>
                <td name="name">${r.email}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
