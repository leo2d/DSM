<%-- 
    Document   : Login
    Created on : Sep 29, 2018, 6:55:17 PM
    Author     : Leonardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
        <style>

        </style>
        <title>DSM - Login</title>
    </head>

    <body>
        <div class="section"></div>
        <main>
            <center>
                <!--<img class="responsive-img" style="width: 250px;" src="https://i.imgur.com/ax0NCsK.gif" />-->
                <h3 class="indigo-text title"> Dirver School Manager</h3>
                <hr class="indigo-text"/>
                <br>
                <div class="hide section card-panel deep-orange lighten-5">
                    <h4 class="message red-text text-accent-2">Login ou senha Inválidos</h4>
                </div>

                <h5 class="indigo-text">Faça login com a sua conta para continuar</h5>
                <div class="section"></div>

                <div class="container">
                    <div class="z-depth-1 grey lighten-4 row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">

                        <form class="col s12" method="post" action="?ac=login">
                            <div class='row'>
                                <div class='col s12'>
                                </div>
                            </div>

                            <div class='row'>
                                <div class='input-field col s12'>
                                    <input class='validate' type='text' name='login' id='email' />
                                    <label for='email'>Login</label>
                                </div>
                            </div>

                            <div class='row'>
                                <div class='input-field col s12'>
                                    <input class='validate' type='password' name='password' id='password' />
                                    <label for='password'>Senha</label>
                                </div>
                            </div>

                            <br />
                            <center>
                                <div class='row'>
                                    <button type='submit' name='btn_login' class='col s12 btn btn-large waves-effect indigo'>Login</button>
                                </div>
                            </center>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <a class="btn btn-small  ight-blue darken-4" style="margin: 10px" href="?ac=preregistration">Realizar pré Matricula</a>
                    <a class="btn btn-small pink darken-1" style="text-decoration: none;" href="?ac=findLessons">Ver aulas livres</a>
                </div>
            </center>

            <div class="section"></div>
            <div class="section"></div>
        </main>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
    </body>

</html>
