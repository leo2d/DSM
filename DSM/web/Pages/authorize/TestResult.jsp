<%-- 
    Document   : TestResult
    Created on : Oct 7, 2018, 8:52:28 PM
    Author     : Leonardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class='row'>
    <div class='input-field col s12 space'>
        <select class="validate" aria-required="true" required="" name="instructor">
            <option disabled selected>Selecione o instrutor</option>
            <c:forEach items="${requestScope.instructorsList}" var="i">
                <option value="${i.id}">${i.name}</option>
            </c:forEach>
        </select>
        <label for='Instrutor'>Instrutor</label>
    </div>
</div>
