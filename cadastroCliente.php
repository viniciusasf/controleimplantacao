<?php

include_once "cabecalho.php";
?>


<form class="needs-validation" action="processa.php" novalidate>
    <input type="hidden" class="form-control" name="ativo" value="T"><!--Input oculto ativando o cliente cadastrado -->

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
        <textarea type="textarea" class="form-control" name="obs" placeholder="Digite a Observação" required></textarea>
        <div class="invalid-feedback">
            Necessário digitar uma Observação.
        </div></br>
    </div>

    <button type="submit" class="btn btn-outline-primary">Cadastrar</button><i class="fa fa-floppy-o" aria-hidden="true"></i>
    <a href="index.php" class="btn btn-outline-info" role="button" aria-pressed="true">Listagem</a>

</form>
</br>

</div>
<? include "scripts.php"; ?>