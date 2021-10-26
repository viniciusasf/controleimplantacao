<!--Captura o ID da Lista e Busca a Razão Social-->
<?PHP
include_once "conecta.php";
include "cabecalho_atendimento.php";

$idCliente   = $_GET['id'];

$cmd = $conn->prepare('SELECT id_cliente, razaosocial FROM cliente WHERE id_cliente = :idCliente');
$cmd->bindValue(":idCliente", $idCliente);
$cmd->execute();

$resultado = $cmd->fetch(PDO::FETCH_ASSOC);

foreach ($resultado as $key => $values)

?>

<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">

        <h1><? echo $values; ?> </h1>
        <!--Busca a Razão Social do cliente-->
    </nav>
    <hr>

    <!--Inicia formulário para Cadastro Atendimento-->
    <form class="needs-validation" action="processaatendimento.php" novalidate>

        <div class="form-group">
            <input type="hidden" class="form-control" name="id_cliente" value="<? echo $resultado["id_cliente"]; ?>"><!--Oculta ID do Cliente no Form-->            
        </div>

        <div class="form-group">
            <input type="text" class="form-control" name="contato" placeholder="Digite o Contato do Atendimento" required>
            <div class="invalid-feedback">
                Necessário digitar o Contato.
            </div>
        </div>

        <div class="form-group">
            <textarea type="textarea" class="form-control" name="observacao" placeholder="Digite a Observação do Atendimento" required></textarea>
            <div class="invalid-feedback">
                Necessário digitar uma Observação.
            </div>
        </div>
        
        <button type="submit" class="btn btn-outline-primary">Cadastrar Atendimento</button>
        <a href="index.php" class="btn btn-outline-info" role="button" aria-pressed="true">Menu Inicial</a>
        <!--<a href="confirmar-exclusao.php" class="btn btn-outline-danger" role="button" aria-pressed="true" data-toggle="modal" data-target="#exampleModalCenter<? echo $resultado["id_cliente"]; ?>">Finalizar Implantação</a>-->
    </form>
    <br>

    <!--inicio modal finaliza implantacao-->
    <!-- Modal -->

    <div class="modal fade" id="exampleModalCenter<? echo $resultado["id_cliente"]; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <!--<h5 class="modal-title" id="exampleModalLongTitle">Finalizar a Implantação?</h5>-->
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="confirmar-exclusao.php">
                    <div class="modal-body">
                        <h5>Deseja Encerrar Treinamento com o Cliente <strong><? echo $resultado["razaosocial"]; ?>?</strong></h5>
                        <input type="hidden" name="ativo" value="F">
                        <input type="hidden" name="id_cliente" value=<? echo $resultado["id_cliente"]; ?>>                        
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-outline-danger">Encerrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!--Final modal finaliza implantacao-->


    <table class="table table-primary" width="100%">
        <thead class="thead-dark">
            <tr>
                <!--<th>ID Cliente</th>-->
                <th>Data Cadastro</th>
                <th>Contato</th>
                <th>Observação</th>                
                <th>Ações</th>
                <th></th>
            </tr>
        </thead>
        <?php
        // Bloco que realiza o papel do Read - recupera os dados e apresenta na tela
        try {
            $cmd = $conn->prepare('SELECT * FROM atendimento WHERE id_cliente = :idCliente');
            $cmd->bindValue(":idCliente", $idCliente);
            if ($cmd->execute()) {
                while ($rs = $cmd->fetch(PDO::FETCH_OBJ)) {

        ?>
                    <tr>
                        <!--<td><?php echo $rs->id_cliente; ?></td>-->
                        <td><?php echo $rs->data_atendimento; ?></td>
                        <td><?php echo $rs->contato; ?></td>
                        <td><?php echo $rs->observacao; ?></td>                        
                        <td><button type="submit" class="btn btn-outline-dark" data-toggle="modal" data-target="#exampleModalCenter<?php echo $rs->id; ?>">Editar</button></td>
                        <!--<td><button type="submit" class="btn btn-outline-dark" data-toggle="modal2" data-target="#exampleModalCenter<?php echo $rs->id_implantacao; ?>">Editar</button></td>-->

                    </tr>

                    <!-- Button trigger modal -->
                    <!-- Modal INICIO -->
                    <div class="modal fade" id="exampleModalCenter<?php echo $rs->id; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Editar Atendimento || Nº <?php echo $rs->id; ?></h5>
                                </div>
                                <div class="modal-body">

                                    <form class="needs-validation" method="GET">

                                        <div class="form-group">
                                            <input type="hidden" class="form-control" name="id_implantacao" value="<?php echo $rs->id; ?>">
                                            <!--Oculta ID do Cliente no Form-->
                                        </div>

                                        <div class="form-group">
                                            <input type="text" class="form-control" name="contato" value="<?php echo $rs->contato; ?>">
                                        </div>

                                        <div class="form-group">
                                            <input type="text" class="form-control" name="obs" value="<?php echo $rs->observacao; ?>">
                                        </div>
                                
                                        <button type="submit" class="btn btn-outline-primary">Salvar</button>
                                    </form>
                                
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal FIM-->

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



        <?php
        $count = $cmd->rowCount();

        if ($count == 0) {

            echo ("<h5>Não Localizado Implantação.\n</h5><br>");
        } else if ($count == 1) {

            echo ("<h5>Encontrado: " . $count . " Implantação.\n</h5><br>");
        } else if ($count > 1) {

            echo ("<h5>Encontrado: " . $count . " Implantações.\n</h5><br>");
        }

        ?>

    </table>

</div>
<? include "scripts.php"; ?>

