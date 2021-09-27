<?php
$mensagem = '';
if (isset($_GET['status'])) {
    switch ($_GET['status']) {
        case 'success':
            $mensagem = '<div class="alert alert-success">Cliente Cadastrado com Sucesso!</div>';
            break;
        case 'error':
            $mensagem = '<div class="alert alert-danger">Cliente Não Cadastrado!</div>';
            break;
    }
}

?>

<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <!-- Estilos customizados para esse template -->
    <link href="css/singnin.css" rel="stylesheet">

    <title>Confirmação de Cadastro</title>
</head>

<body class="text-center">
    <form class="form-signin">            
        <label class="sr-only">Endereço de email</label>
        <?= $mensagem ?>
        </br>  
        </br>
        <a href="index.php" class="btn btn-outline-primary" role="button" aria-pressed="true">Pagina Inicial</a>        
        <a href="listagem.php" class="btn btn-outline-primary" role="button" aria-pressed="true">Listagem Clientes</a>        
    </form>
</body>
</html>