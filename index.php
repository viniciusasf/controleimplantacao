<?php
include_once "conecta.php";
include "cabecalho.php";
?>


<nav class="navbar navbar-light" style="background-color: #e3f2fd;">
    
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="cadastroCliente.php">Cadastro de Cliente</a>
            </li>
        </ul>
    
</nav>
<br>


<table class="table table-hover" width="100%">
    <thead class="thead-dark">
        <tr>

            <th>EMPRESA</th>
            <th>CONTATO</th>
            <th>AÇÕES</th>

        </tr>
    </thead>

    <form action="index.php">
        <div class="form-group input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
            <input type="text" class="form-control" name="procura" placeholder="Busca">
            <div class="input-group-append">
                <div class="input-group-text" style="background-color: #FFF"><i class="fas fa-search"></i></div>
            </div>
        </div>
    </form>

    <?php
    // Bloco que realiza o papel do Read - recupera os dados e apresenta na tela
    $p = $_GET["procura"];

    try {

        $stmt = $conn->prepare("SELECT * FROM cliente WHERE ativo = 'T' AND razaosocial LIKE '%$p%'");
        if ($stmt->execute()) {
            while ($rs = $stmt->fetch(PDO::FETCH_OBJ)) {

    ?>
                <tr>
                    <td><?php echo $rs->razaosocial; ?> </td>
                    <td><?php echo $rs->contato; ?></td>
                    <td>
                        <center>
                            <a href=implantacao.php?id=<?php echo $rs->id_cliente; ?> <i class="fas fa-bars"></i></a>
                            <!--<a href=implantacao.php?id=<?php echo $rs->id_cliente; ?> class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Excluir</a>-->
                        </center>
                    </td>
                </tr>
    <?php
            }
        } else {
            echo "Erro: Não foi possível recuperar os dados do banco de dados";
        }
    } catch (PDOException $erro) {
        echo "Erro: " . $erro->getMessage();
    }

    ?>
    </tbody>

</table>
<a href="index.php" class="btn btn-outline-primary" role="button" aria-pressed="true">Voltar</a><br>

</div>
<? include "scripts.php"; ?>