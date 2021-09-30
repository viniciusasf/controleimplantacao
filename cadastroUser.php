<?php

include_once "cabecalho.php";
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
<form method="POST" class="needs-validation" action="processaUsuario.php" novalidate>
    
    <input type="hidden" name="ativo" value="T">
    <input type="hidden" name="data_cadastro" value='<?php echo date('y-m-d H:i:s'); ?>'>
    
    <div class="form-group">
        <input type="text" class="form-control" id="validationCustom01" name="nome" placeholder="Digite o nome" required>
        <div class="invalid-feedback">
            Necessário digitar o Nome.
        </div>
    </div>

    <div class="form-group">
        <input type="text" class="form-control" name="usuario" placeholder="Crie um Usuário" required>
        <div class="invalid-feedback">
            Necessário Criar o Usuário.
        </div>
    </div>

    <div class="form-group">
        <input type="password" class="form-control" name="senha_usuario" placeholder="Crie uma Senha" required>
        <div class="invalid-feedback">
            Necessário Criar uma Senha.
        </div>
    </div>    

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <button type="submit" class="btn btn-outline-primary" name="enviar" value="Enviar">Cadastrar</button>
    </nav>
</form>
</div>
<? include "scripts.php"; ?>