<?php

include_once "cabecalho_cadcliente.php";
?>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="btn-group">
        <button type="button" class="btn btn-outline-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Menu
        </button>
        <div class="dropdown-menu">
            <a class="dropdown-item" href="index.php">Menu Inicial</a>
        </div>
</nav>
</br>
<form class="needs-validation" action="processaCliente.php" novalidate>
    <input type="hidden" class="form-control" name="ativo" value="T">
    <!--Input oculto ativando o cliente cadastrado -->

    <div class="form-group">
        <input type="text" class="form-control" id="validationCustom01" name="razaosocial" placeholder="Digite a Razão Social do Cliente" required>
        <div class="invalid-feedback">
            Necessário digitar a Razão Social.
        </div>
    </div>

    <div class="form-group">
        <input type="text" class="form-control" name="contato" placeholder="Digite o Contato do Cliente" required>
        <div class="invalid-feedback">
            Necessário digitar o Contato.
        </div>
    </div>

    <div class="form-group">
        <textarea type="textarea" class="form-control" name="obs" placeholder="Digite a Observação"></textarea>        
    </div>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">

    <button type="submit" class="btn btn-outline-primary">Cadastrar</button>
    </nav>
</form>
</div>



<? include "scripts.php"; ?>