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
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
        <style>
            .body-style  {
                display: flex;
                min-height: 100vh;
                flex-direction: column;
            }

            .main-style  {
                flex: 1 0 auto;
            }

            .body-style {
                background: #fff;
            }

            .input-field input[type=date]:focus + label,
            .input-field input[type=text]:focus + label,
            .input-field input[type=email]:focus + label,
            .input-field input[type=password]:focus + label {
                color: #e91e63;
            }

            .input-field input[type=date]:focus,
            .input-field input[type=text]:focus,
            .input-field input[type=email]:focus,
            .input-field input[type=password]:focus {
                border-bottom: 2px solid #e91e63;
                box-shadow: none;
            }
             
            .space{
                margin-left: 50px;
                margin-right: 50px;
            }
        </style>
    </head>

    <body >
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

                <h5 class="indigo-text">Preencha os campos corretamente para efetuar sua pré matricula</h5>
                <div class="section"></div>

                <div class="container">
                    <!--<div class="z-depth-1 grey lighten-4 row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">-->

                    <form class="col s12" method="post">
                        <div class='row'>
                            <div class='col s12'>
                            </div>
                        </div>

                        <div class='row'>
                            <div class='input-field col s12'>
                                <input class='validate' type='text' name='name' id='name' />
                                <label for='email'>Nome</label>
                            </div>
                        </div>

                        <div class="address">
                            <div class='row'>
                                <div class='input-field col s12'>
                                    <input class='validate' type='text' name='address' id='address' />
                                    <label for='email'>Endereço</label>
                                </div>
                            </div>
                        </div>
                        <!--                    </div>-->

                        <div class='row'>
                            <div class='input-field col s12'>
                                <input class='validate' type='text' name='email' id='email' />
                                <label for='email'>Email</label>
                            </div>
                        </div>
                        <div class='row'>
                            <div class='input-field col s12'>
                                <input class='validate' type='text' name='login' id='login' />
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
                        <div class="btn-save">
                            <div class='row' style="display: flex; justify-content: space-between">
                                <button type='submit' name='btnPreRegister'  class=' space col s12 btn btn-large waves-effect indigo'>Salvar Pré-Matricula</button>
                                <a href='?=' class=' space col s12 btn btn-large waves-effect pink'>Cancelar</a>
                            </div>
                        </div>
                    </form>
                </div>
                </div>     
            </center>

            <div class="section"></div>
            <div class="section"></div>
        </main>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
    </body>

</html>