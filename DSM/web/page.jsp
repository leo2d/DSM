<%-- 
    Document   : base
    Created on : Sep 29, 2018, 1:46:07 PM
    Author     : Leonardo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<html lang="pt-br">
    <head>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="src/css/mycustomcss.css">

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <style type="text/css">
            header,
            main,
            footer {
                /*padding-left: 240px;*/
            }
            .left-content{
                padding-left: 240px;
            }
            body {
                backgroud: white;
            }

            @media only screen and (max-width: 992px) {
                header,
                main,
                footer {
                    padding-left: 0;
                }
            }

            #credits li,
            #credits li a {
                color: white;
            }

            #credits li a {
                font-weight: bold;
            }

            .footer-copyright .container,
            .footer-copyright .container a {
                color: #BCC2E2;
            }

            .fab-tip {
                position: fixed;
                right: 85px;
                padding: 0px 0.5rem;
                text-align: right;
                background-color: #323232;
                border-radius: 2px;
                color: #FFF;
                width: auto;
            }

            .content {
                min-height: calc(100vh - 70px);
            }
            .footer {
                /*height: 50px;*/
            }
        </style>
    </head>

    <body>
        <div class="content">
            <c:if test="${sessionScope.user != null}"> 
                <ul id="slide-out" class="side-nav fixed z-depth-2">
                    <li class="center no-padding">
                        <div class="indigo darken-2 white-text" style="height: 180px;">
                            <div class="row">
                                <!--<img style="margin-top: 5%;" width="100" height="100" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxRPdeOoDtViYUO-mSfj0uru_2vB1Qy7x0tICoto5wvizhcffv" class="circle responsive-img" />-->

                                <c:if test="${sessionScope.user.profile == 'EMPLOYEE'}"> 
                                    <img style="margin-top: 5%;" width="100" height="100" src="https://uploads.disquscdn.com/images/43ea0a469e1678fa402ad1530af321fc59c882f0811d5fa1eae6c72511a45a28.jpg" class="circle responsive-img" />
                                </c:if>
                                <c:if test="${sessionScope.user.profile == 'STUDENT'}"> 
                                    <img style="margin-top: 5%;" width="100" height="100" src="https://uploads.disquscdn.com/images/eaff8171edfd4ef701b008a12ed51da8854b0338e3ed488eba021d8d8fa81553.jpg" class="circle responsive-img" />
                                </c:if>
                                <c:if test="${sessionScope.user.profile == 'INSTRUCTOR'}"> 
                                    <img style="margin-top: 5%;" width="100" height="130" src="https://chuvadenanquim.files.wordpress.com/2012/01/onizuka-careta21.jpg" class="circle responsive-img" />
                                </c:if>
                                <p style="margin-top: -13%;">
                                    <c:if test="${sessionScope.user != null}"> 
                                        ${sessionScope.user.login}
                                    </c:if>
                                </p>
                            </div>
                        </div>
                    </li>

                    <c:if test="${(sessionScope.user.profile == 'INSTRUCTOR') || (sessionScope.user.profile == 'STUDENT')}"> 
                        <li id="dash_dashboard"><a class="waves-effect" href="?ac=findLessons"><b>Aulas</b></a></li>
                        <c:if test="${(sessionScope.user.profile == 'STUDENT')}">
                            <li id="dash_dashboard"><a class="waves-effect" href="?ac=getTestResult"><b>Resultados de provas</b></a></li>        
                        </c:if>
                    </c:if>
                    <ul class="collapsible" data-collapsible="accordion">
                        <c:if test="${(sessionScope.user.profile == 'EMPLOYEE') || sessionScope.user.profile == 'ADMIN'}"> 
                            <li id="dash_dashboard"><a class="waves-effect" href="?ac=authorize-home"><b>Página Inicial</b></a></li>
                            <li id="dash_users">
                                <div id="dash_users_header" class="collapsible-header waves-effect"><b>Alunos</b></div>
                                <div id="dash_users_body" class="collapsible-body">
                                    <ul>
                                        <li id="users_seller">
                                            <a class="waves-effect" style="text-decoration: none;" href="?ac=authorize-studentRegistration">Cadastrar</a>
                                        </li>

                                        <li id="users_customer">
                                            <a class="waves-effect" style="text-decoration: none;" href="#!">Gerenciar provas</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>

                            <li id="dash_products">
                                <div id="dash_products_header" class="collapsible-header waves-effect"><b>Aulas</b></div>
                                <div id="dash_products_body" class="collapsible-body">
                                    <ul>
                                        <li id="products_product">
                                            <a class="waves-effect" style="text-decoration: none;" href="?ac=authorize-createLesson">Cadastrar</a>
                                            <a class="waves-effect" style="text-decoration: none;" href="?ac=findLessons">Pesquisar</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </c:if>
                        <li id="dash_dashboard"><a class="waves-effect" href="?ac=logout"><b>Sair</b></a></li>
                    </ul>
                </ul>
                <div class="left-content">
                </c:if>


                <header>
                    <c:if test="${sessionScope.user != null}">
                        <ul class="dropdown-content" id="user_dropdown">
                            <li><a class="indigo-text" href="?ac=logout">Logout</a></li>
                        </ul>
                    </c:if>


                    <nav class="indigo" role="navigation">
                        <div class="nav-wrapper">
                            <c:if test="${sessionScope.user != null}">
                                <ul class="right hide-on-med-and-down">
                                    <li>
                                        <a class='right dropdown-button' href='' data-activates='user_dropdown'><i class='medium material-icons'>account_circle</i></a>
                                    </li>
                                </ul>
                            </c:if>
                            <c:if test="${sessionScope.user == null}">
                                <a href="?ac=loginPage" style="margin-top: 2em; margin-right: 3em;" class="right waves-effect waves-lighten pink btn-large"><i class='material-icons left'>account_circle</i> Login</a>
                                <a href="?ac=preregistration" style="margin-top: 2em; margin-right: 3em;" class="right waves-effect waves-lighten pink btn-large"><i class='material-icons left'>person_add</i> Pré-Matricula</a>
                            </c:if>
                            <a href="#" data-activates="slide-out" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
                        </div>
                    </nav>

                    <nav>
                        <div class="nav-wrapper indigo darken-2">
                            <span style="margin-left: 20px;" class="breadcrumb"> Driver School Manager - Alpha v0.1.1</span>

                            <div style="margin-right: 20px;" id="timestamp" class="right"></div>
                        </div>
                    </nav>
                </header>

                <main>
                    <c:if test="${param.page == null}">
                        <jsp:include page="Pages/Home.jsp" />
                    </c:if>
                    <c:if test="${param.page != null}">
                        <jsp:include page="Pages/${param.page}.jsp" />
                    </c:if>
                </main>
            </div>
        </div>
        <footer class="indigo page-footer footer">
            <div class="container">
                <div class="row">
                    <div style="display:flex; align-items: center; align-content: center; justify-content: center">
                        <h5  class="white-text">Auto escola do Majin Boo  </h5>
                        <img  style="margin-left: 20px; width:90px; height:100px  "src="https://img00.deviantart.net/d829/i/2011/307/f/f/buu_chibi_by_maffo1989-d4exvw2.png"/>
                        <!--                        <ul id='credits' class="row">
                                                    <li>
                                                        <img  style="width:90px; height:100px  "src="https://img00.deviantart.net/d829/i/2011/307/f/f/buu_chibi_by_maffo1989-d4exvw2.png">
                                                    </li>
                                                </ul>-->
                    </div>
                </div>
            </div>
            <div class="footer-copyright">
                <div class="container">
                    <span>Original Template Made By <a style='font-weight: bold;' href="https://github.com/piedcipher" target="_blank">Tirth Patel</a></span>
                </div>
            </div>
        </footer>

        <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>  
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('.button-collapse').sideNav();
                $('.collapsible').collapsible();
                $('select').material_select();
            });
        </script>

        <script>
            <%
                if (request.getAttribute("hasAlert") != null
                        && ((boolean) request.getAttribute("hasAlert"))) {
            %>
            alert("<%= request.getAttribute("alertMessage")%>");
            <%
                }
            %>
        </script>

    </body>
</html>
