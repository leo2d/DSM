<%-- 
    Document   : CreateLesson
    Created on : Oct 1, 2018, 11:20:21 PM
    Author     : Leonardo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    .space{
        margin-left: 50px;
        margin-right: 50px;
    }
    input::-webkit-datetime-edit{ color: transparent; }
    input[type=date]:required:invalid::-webkit-datetime-edit {
        color: transparent;
    }
</style>
<div>
    <title> Cadastro de aula</title>

    <br>
    <div class="hide section card-panel deep-orange lighten-5">
        <h4 class="message red-text text-accent-2">mensagem de erro</h4>
    </div>
    <br>
    <h5 class="indigo-text  valign center">Preencha os campos corretamente para cadastrar a aula</h5>
    <hr class="indigo"/>
    <br>
    <div class="section"></div>

    <div class="container">
        <form class="col s12" method="post" action="?ac=addLesson">
            <div class='row'>
                <div class='col s12'>
                </div>
            </div>

            <div class='row'>
                <div class='input-field col s12 space'>
                    <select class="validate" aria-required="true" required="">
                        <option disabled selected>Selecione o instrutor</option>
                        <c:forEach items="${requestScope.instructorsList}" var="i">
                            <option value="${i.id}">${i.name}</option>
                        </c:forEach>
                    </select>
                    <label for='Instrutor'>Instrutor</label>
                </div>
            </div>

            <h6>Data</h6>
            <div class='row'>
                <div class='input-field col s12 space'>
                    <div class="row">
                        <!--<label for='totalValue'>Dia / mes / ano</label>-->
                        <!--<input id="data" name="data" type="text" required class="validate"  onkeypress="formatDate()"/>-->
                        <input type="text" name="data" OnKeyUp="formatDate(this);" maxlength="10"  class="validate" />
                    </div>
                </div>

                <div>
                    <div class="row">
                        <div class='input-field col s12'>
                            <label for='paymentMethod'> Tipo de aula </label><br>
                            <p>
                                <input class='validate' type='radio' name='lessonType' value="teorica" id="teorica" onclick="updateValue()" />
                                <label for='teorica'>Teórica</label>
                            </p>
                            <p>
                                <input class='validate' type='radio' name='lessonType' value="pratica" id="pratica" onclick="updateValue()" />
                                <label for='pratica'>Pratica</label>
                            </p>
                        </div>
                    </div>
                    <div class='row'>
                        <div class='input-field col s12'>
                            <div>
                                <label for='totalValue'>Valor</label><br><br>
                                <input type="text" name="value" id="money" class="money" readonly  />
                            </div>
                        </div>
                    </div>
                </div>

                <div>
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="studentSearch" type="text" data-length="10">
                            <label for="studentSearch">Procurar aluno</label>
                        </div>
                        <button class="waves-effect waves-light btn-small" onclick="getStudens()">Buscar</button>
                    </div>

                    <div id="searchResult">

                    </div>
                </div>

                <br />
                <div class="btn-save">
                    <div class='row' style="display: flex; justify-content: space-between">
                        <button type='submit' name='btnPreRegister'  class=' space col s12 btn btn-large waves-effect indigo'>Cadastrar aula</button>
                        <a href='?=' class=' space col s12 btn btn-large waves-effect pink'>Cancelar</a>
                    </div>
                </div>
        </form>
    </div>
</div>     


<div class="section"></div>
<div class="section"></div>
</div>


<script>
    const getStudens = () => {
        let name = document.getElementById("studentSearch").value;
         let data = {
            name: name
        };
        $.ajax({
            url: '?ac=getStudentsAjax',
            type: 'Post',
            data: data,

            success: (response) => {
                $("#searchResult").html(response);
            }
        });

    };



//    const getStudens = () => {
//        let name = new FormData(document.getElementById('studentSearch'));
//                //document.getElementById("studentSearch").value;
//        console.log(name);
//        let data = {
//            name: name
//        };
//        let fetchData = {
//            method: 'POST',
//            body: data,
//            headers: new Headers()
//        };
//        fetch('?ac=getStudentsAjax', fetchData)
//                .then((response) => {
//                    document.getElementById("searchResult").value = response;
//                });
//    };

    const updateValue = () => {

        let value = 0;
        let lessonType = document.querySelector('input[name="lessonType"]:checked').value;
        if (lessonType === "pratica")
            value = 80;
        else if (lessonType === "teorica")
            value = 50;
        value = value.toLocaleString('pt-br', {style: 'currency', currency: 'BRL'});
        document.getElementById("money").value = (value);
    };

    const formatDate = (campoData) => {
        let data = campoData.value;
        if (data.length == 2) {
            data = data + '/';
            document.forms[0].data.value = data;
            return true;
        }
        if (data.length == 5) {
            data = data + '/';
            document.forms[0].data.value = data;
            return true;
        }
    };
</script>