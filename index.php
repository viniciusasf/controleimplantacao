<?php
include_once "conecta.php";
include "cabecalho.php";
?>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="btn-group">
        <button type="button" class="btn btn-outline-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Menu
        </button>
        <div class="dropdown-menu">
            <a class="dropdown-item" href="cadastroCliente.php">Cadastro Cliente</a>
            <a class="dropdown-item" href="cadastroUser.php">Cadastro Usuário</a>
        </div>
</nav>
<br>

<table class="table table-hover" width="100%">
    <thead class="thead-dark">
        <tr>
            <th>COD</th>
            <th>EMPRESA</th>
            <th>CONTATO</th>
            <th>AÇÕES</th>
        </tr>
    </thead>

    <form>
        <div class="form-group input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
            <input type="text" class="form-control" name="procura" placeholder="Busca">

            <div class="input-group-append">
                <div class="input-group-text" style="background-color: #FFF"><i class="fas fa-search"></i></div>
            </div>
        </div>
    </form>

    <!-- Bloco que realiza o papel do Read PHP- recupera os dados e apresenta na tela -->
    <?php
    $p = $_GET["procura"]; //captura a variavel do form 

    $stmt = $conn->prepare("SELECT * 
                            FROM cliente 
                            WHERE ativo = 'T' AND 
                                  razaosocial LIKE '%$p%' AND
                                  contato     LIKE '%$p%' OR 
                                  id_cliente = '{$p}' ");
                                  //inseri a variavel procura dentro 
    $stmt->execute();

    $count = $stmt->rowCount(); //faz o contador de registros.
    
    if ($count == 0) {
        echo ("<h5>Não Localizado implantações para o cliente $p</h5>");

    } else if ($count == 1) {
        echo ("<h5>" . $count . " Implantação localizada.</h5>");

    } else if ($count > 1) {
        echo ("<h5>". $count . " Implantações localizadas</h5>");
        
    }

    while ($rs = $stmt->fetch(PDO::FETCH_OBJ)) {

    ?>
        <!--Inicia html -->
        <tr>
            <td><?php echo $rs->id_cliente; ?> </td>
            <td><?php echo $rs->razaosocial; ?> </td>
            <td><?php echo $rs->contato; ?></td>
            <td>
                <center>
                    <a href=implantacao.php?id=<?php echo $rs->id_cliente; ?> <i class="fas fa-bars"></i></a>
                </center>
            </td>
        </tr>
        <!--Finaliza html -->

    <?php
    }

    ?>
    </tbody>

</table>
</div>
<? include "scripts.php"; ?>