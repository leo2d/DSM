<%-- 
    Document   : SearchStudentsResult
    Created on : Oct 2, 2018, 11:35:51 AM
    Author     : Leonardo

--%>
<%--
<c:forEach items="${requestScope.result}" var="i">
            <c:forEach items="${i.registration}" var="r">
                <tr>
                    <td name="idregistration" value="${i.idregistration}">${r.idregistration}</td>
                    <td name="name">${i.name}</td>
                </tr>
            </c:forEach>
        </c:forEach>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<table class="highlight">
    <thead>
        <tr>
            <th></th>
            <th>Matricula</th>
            <th>Nome</th>
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
                <td name="name">${r.student.name}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>