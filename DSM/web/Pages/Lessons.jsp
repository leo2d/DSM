<%-- 
    Document   : Lessons
    Created on : Oct 6, 2018, 11:48:12 AM
    Author     : Leonardo
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dsm.models.Lesson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<title>Aulas</title>

<div class = "container"> 
    <br>
    <div class="info">
        <div class='row s12'>
            <!--<h5 class=" cyan-text cols4 text-darken-3">As aulas estão organizadas por ordem crescente de data</h5>-->
            <h6 class="pink-text text-accent-3">** As aulas praticas só podem ser iniciadas ao termino das aulas teóricas e após a aprovação na prova do detran.</h6>    
        </div>

    </div> <br>

    <div class = "row">
        <c:forEach items="${requestScope.lessons}" var="lesson">
            <c:if test="${lesson.type == 'THEORETICAL'}">
                <div class = "col s12 m3">
                    <!--<div class="card blue-grey darken-1">-->
                    <div class="card blue  waves-effect">
                        <div class="card-content white-text">
                            <span class="card-title">
                                <fmt:formatDate value="${lesson.lessonDate}" pattern="dd/MM/yyyy - HH:mm"/>
                            </span>
                            <p>
                                <c:if test="${lesson.registration == null}">
                                    -
                                </c:if>
                                <c:if test="${lesson.registration != null}">
                                    Aluno: ${lesson.registration.student.name}
                                </c:if>
                            </p>
                            <p>
                                Instrutor: ${lesson.instructor.name}
                            </p>
                            <p>
                                Tipo de aula: Teórica
                            </p>
                        </div>
                        <!--<div class="card-action  light-blue darken-3">-->
                        <div class="card-action  blue darken-3">
                            <c:if test="${sessionScope.user.profile == 'STUDENT'}"> 
                                <a href="#" >Pegar aula</a>
                            </c:if>
                            <c:if test="${sessionScope.user == null}">
                                <a href="#" >Pegar aula</a>
                            </c:if>
                            <c:if test="${sessionScope.user.profile == 'EMPLOYEE'}">
                                <a href="#" >Editar aula</a>
                            </c:if>
                            <c:if test="${sessionScope.user.profile == 'INSTRUCTOR'}">
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:if>

            <c:if test="${lesson.type == 'PRATICAL'}">

                <%--<c:if test="${sessionScope.user.profile == 'INSTRUCTOR'}">--%>   
                <div class = "col s12 m3">
                    <!--<div class="card blue-grey darken-1">-->
                    <div class="card pink  waves-effect">
                        <div class="card-content white-text">
                            <span class="card-title">
                                <fmt:formatDate value="${lesson.lessonDate}" pattern="dd/MM/yyyy - HH:mm"/>
                            </span>
                            <p>
                                <c:if test="${lesson.registration == null}">
                                    -
                                </c:if>
                                <c:if test="${lesson.registration != null}">
                                    Aluno: ${lesson.registration.student.name}
                                </c:if>
                            </p>
                            <p>
                                Instrutor: ${lesson.instructor.name}
                            </p>
                            <p>
                                Tipo de aula: Prática
                            </p>
                        </div>
                        <div class="card-action   pink darken-4">
                            <c:if test="${sessionScope.user.profile == 'STUDENT'}"> 
                                <a href="#" >Pegar aula</a>
                            </c:if>
                            <c:if test="${sessionScope.user == null}">
                                <a href="#" >Pegar aula</a>
                            </c:if>
                            <c:if test="${sessionScope.user.profile == 'EMPLOYEE'}">
                                <a href="#" >Editar aula</a>
                            </c:if>
                            <c:if test="${sessionScope.user.profile == 'INSTRUCTOR'}">
                            </c:if>
                        </div>
                    </div>
                </div>

            </c:if>

        </c:forEach>


    </div>     	  
</div>   