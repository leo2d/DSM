<%-- 
    Document   : StudentRegistration
    Created on : Sep 29, 2018, 10:33:31 PM
    Author     : Leonardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .space{
        margin-left: 50px;
        margin-right: 50px;
    }
</style>
<div>
    <title> Cadastro de aluno</title>

    <!--<img class="responsive-img" style="width: 250px;" src="https://i.imgur.com/ax0NCsK.gif" />-->
    <br>
    <div class="hide section card-panel deep-orange lighten-5">
        <h4 class="message red-text text-accent-2">mensagem de erro</h4>
    </div>
    <br>
    <h5 class="indigo-text  valign center">Preencha os campos corretamente para Finalizar matricula</h5>
    <hr class="indigo"/>
    <br>
    <div class="section"></div>

    <div class="container">
        <!--<div class="z-depth-1 grey lighten-4 row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">-->

        <form class="col s12" method="post" action="?ac=saveStudent">
            <div class='row'>
                <div class='col s12'>
                </div>
            </div>

            <div class='row'>
                <div class='input-field col s12 space'>
                    <div class="row">
                        <label for='totalValue'>Quantidade aulas teoricas</label>
                        <input type="number" max="50" name="teorica" id="teoricas" class="validate" min="0" onkeyup="updateValue()" />

                    </div>

                </div>
                <div class='input-field col s12 space'>
                    <div class="row">
                        <label for='totalValue'>Quantidade aulas práticas</label>
                        <input type="number" max="50" name="pratica" id="praticas" min="0" class="validate" onkeyup="updateValue()" />
                    </div>
                </div> </div>

            <div>
                <h6>Pagamento</h6>
                <div class='row'>
                    <div class='input-field col s12'>
                        <div>
                            <label for='totalValue'>Valor</label><br><br>
                            <input type="text" name="value" id="money" class="money validate" readonly  />
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class='input-field col s12'>
                        <label for='paymentMethod'> Forma de pagamento </label><br>
                        <p>
                            <input class='validate' type='radio' name='payment' value="vista" id="vista" />
                            <label for='vista'>À Vista</label>
                        </p>
                        <p>
                            <input class='validate' type='radio' name='payment' value="parcelado" id="parcelado"/>
                            <label for='parcelado'>Parcelado</label>
                        </p>
                    </div>
                </div>
                <br>
            </div>


            <div class='row'>
                <div class='input-field col s12'>
                    <input class='validate' type='text' name='name' id='name' />
                    <label for='name'>Nome</label>
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
                    <button type='submit' name='btnPreRegister'  class=' space col s12 btn btn-large waves-effect indigo'>Finalizar matricula</button>
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

    const updateValue = () => {
        let totalValue = document.getElementById("money").value;
        totalValue = totalValue.toString().replace("R$", "");
        totalValue = isNaN(parseFloat(totalValue)) ? 0 : parseFloat(totalValue);

        console.log(totalValue + "tt");

        let praticas = document.getElementById("praticas").value;
        praticas = isNaN(parseFloat(praticas)) ? 0 : parseFloat(praticas);

        console.log(praticas + "pra");

        let teoricas = document.getElementById("teoricas").value;
        teoricas = isNaN(parseFloat(teoricas)) ? 0 : parseFloat(teoricas);

        console.log(teoricas + "teor");
        let final = ((praticas * 80) + (teoricas * 50) + 0);
        document.getElementById("money").value = ("R$" + final);
    };

    const format = () => {
        // alert("banana");
        let value = document.getElementById("money").value;
        console.log(value);
        let banana = value.toString().replace(",", ".");
        //banana = banana.replace(".", "");
        banana = banana.replace("R$", "");
        doubleValue = parseFloat(banana);
        let pattern = {style: 'currency', currency: 'BRL', currencyDisplay: 'symbol'};
        let newValue = doubleValue.toLocaleString('pt-BR', pattern);
        console.log(newValue);
        document.getElementById("money").value = (newValue);// = (newValue);
        // $("#money").append(doubleValue.toLocaleString('pt-BR', pattern));
    };
</script>