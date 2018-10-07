<%-- 
    Document   : Home
    Created on : Sep 29, 2018, 4:34:25 PM
    Author     : Leonardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<title>DSM - Menu</title>
<div class="container" >
    <div class="" >
        <div class="row">
            <div class="align-center" >
                <div class="" style=" align-items: center; align-content: center; justify-content: center">
                    <div style="padding: 35px;" align="center" class="card">
                        <div class="row">
                            <div class="left card-title">
                                <b>Opções de aluno</b>
                            </div>
                        </div>

                        <div class="row">
                            <a href="?ac=authorize-studentRegistration">
                                <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                    <i class="indigo-text text-lighten-1 large material-icons">person_add</i>
                                    <span class="indigo-text text-lighten-1"><h5>Cadastro de Aluno</h5></span>
                                </div>
                            </a>
                            <div class="col s1">&nbsp;</div>
                            <div class="col s1">&nbsp;</div>

                            <a href="authorize-#!">
                                <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                    <i class="indigo-text text-lighten-1 large material-icons">settings</i>
                                    <span class="indigo-text text-lighten-1"><h5>Gerenciar provas</h5></span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!--
                    <div class="col s6">
                        <div style="padding: 35px;" align="center" class="card">
                            <div class="row">
                                <div class="left card-title">
                                    <b>Aulas</b>
                                </div>
                            </div>
                            <div class="row">
                                <a href="#!">
                                    <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                        <i class="indigo-text text-lighten-1 large material-icons">directions_car</i>
                                        <span class="indigo-text text-lighten-1"><h5>Aula prática</h5></span>
                                    </div>
                                </a>
            
                                <div class="col s1">&nbsp;</div>
                                <div class="col s1">&nbsp;</div>
            
                                <a href="#!">
                                    <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                        <i class="indigo-text text-lighten-1 large material-icons">import_contacts</i>
                                        <span class="indigo-text text-lighten-1"><h5>Aula teórica</h5></span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>-->
        </div>

        <div class="row">
            <div class="">
                <div style="padding: 35px;" align="center" class="card">
                    <div class="row">
                        <div class="left card-title">
                            <b>Aulas</b>
                        </div>
                    </div>
                    <div class="row">
                        <a href="?ac=authorize-createLesson">
                            <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                <i class="indigo-text text-lighten-1 large material-icons">directions_car</i>
                                <span class="indigo-text text-lighten-1"><h5>Cadastrar aula</h5></span>
                            </div>
                        </a>

                        <div class="col s1">&nbsp;</div>
                        <div class="col s1">&nbsp;</div>

                        <a href="?ac=findLessons">
                            <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                <i class="indigo-text text-lighten-1 large material-icons">search</i>
                                <span class="indigo-text text-lighten-1"><h5>Pesquisar aula</h5></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!--            <div class="">
                            <div style="padding: 35px;" align="center" class="card">
                                <div class="row">
                                    <div class="left card-title">
                                        <b>Brand Management</b>
                                    </div>
                                </div>
            
                                <div class="row">
                                    <a href="#!">
                                        <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                            <i class="indigo-text text-lighten-1 large material-icons">local_offer</i>
                                            <span class="indigo-text text-lighten-1"><h5>Brand</h5></span>
                                        </div>
                                    </a>
            
                                    <div class="col s1">&nbsp;</div>
                                    <div class="col s1">&nbsp;</div>
            
                                    <a href="#!">
                                        <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                            <i class="indigo-text text-lighten-1 large material-icons">loyalty</i>
                                            <span class="indigo-text text-lighten-1"><h5>Sub Brand</h5></span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>-->
            <!--
                    <div class="col s6">
                        <div style="padding: 35px;" align="center" class="card">
                            <div class="row">
                                <div class="left card-title">
                                    <b>Category Management</b>
                                </div>
                            </div>
                            <div class="row">
                                <a href="#!">
                                    <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                        <i class="indigo-text text-lighten-1 large material-icons">view_list</i>
                                        <span class="indigo-text text-lighten-1"><h5>Category</h5></span>
                                    </div>
                                </a>
                                <div class="col s1">&nbsp;</div>
                                <div class="col s1">&nbsp;</div>
            
                                <a href="#!">
                                    <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                        <i class="indigo-text text-lighten-1 large material-icons">view_list</i>
                                        <span class="truncate indigo-text text-lighten-1"><h5>Sub Category</h5></span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>-->
        </div>
    </div>

    <div class="fixed-action-btn click-to-toggle" style="bottom: 45px; right: 24px;">
        <a class="btn-floating btn-large pink waves-effect waves-light">
            <i class="large material-icons">add</i>
        </a>

        <ul>
            <li>
                <a class="btn-floating red"><i class="material-icons">note_add</i></a>
                <a href="" class="btn-floating fab-tip">Add a note</a>
            </li>

            <li>
                <a class="btn-floating yellow darken-1"><i class="material-icons">add_a_photo</i></a>
                <a href="" class="btn-floating fab-tip">Add a photo</a>
            </li>

            <li>
                <a class="btn-floating green"><i class="material-icons">alarm_add</i></a>
                <a href="" class="btn-floating fab-tip">Add an alarm</a>
            </li>

            <li>
                <a class="btn-floating blue"><i class="material-icons">vpn_key</i></a>
                <a href="" class="btn-floating fab-tip">Add a master password</a>
            </li>
        </ul>
    </div>
</div>
