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
include "cabecalho.php";
?>

<!DOCTYPE html>


    <title>Confirmação de Cadastro</title>
</head>

<body class="text-center">
    <form class="form-signin">            
        <label class="sr-only">Endereço de email</label>
        <?= $mensagem ?>
        </br>  
        </br>        
        <a href="index.php" class="btn btn-outline-primary" role="button" aria-pressed="true">Listagem Clientes</a>        
    </form>
</body>
</html>