<%-- 
    Document   : ManageTests
    Created on : Oct 7, 2018, 2:15:30 PM
    Author     : Leonardo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div>
    <div class="container">
        <form class="col s12" method="post" action="?ac=authorize-UpdateTestStatus">
            <br><br>
            <div>
                <div class="row">
                    <div class="input-field col s6">
                        <input id="studentSearch" type="text" data-length="10">
                        <label for="studentSearch">Procurar aluno</label>
                    </div>
                    <a class="waves-effect waves-light btn-small" onclick="getStudens()">Buscar</a>
                </div>

                <div id="searchResult">

                </div>
            </div>

            <div>
                <div class="row">
                    <div class='input-field col s12'>
                        <label for='testResult'> Tipo de aula </label><br>
                        <p>
                            <input class='validate' type='radio' name='testResult' id="true" value="true" />
                            <label for='true'>Aprovado</label>
                        </p>
                        <p>
                            <input class='validate' type='radio' name='testResult' id="false" value="false" />
                            <label for='false'>Reprovado</label>
                        </p>
                    </div>
                </div>
            </div>

            <br />
            <div class="btn-save">
                <div class='row' style="display: flex; justify-content: space-between">
                    <button type='submit' name='' vlaue="save" class=' space col s12 btn btn-large waves-effect indigo'>Salvar</button>
                    <a href='?ac=authorize-home' class=' space col s12 btn btn-large waves-effect pink'>Cancelar</a>
                </div>
            </div> 
        </form>
    </div>
</div> 

<script>
    const getStudens = () => {
        let name = document.getElementById("studentSearch").value;
        let data = {
            name: name
        };
        $.ajax({
            url: '?ac=authorize-getStudentsAjax',
            type: 'Post',
            data: data,

            success: (response) => {
                $("#searchResult").html(response);
            }
        });

    };
</script>