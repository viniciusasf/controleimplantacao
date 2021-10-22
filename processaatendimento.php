<?php 

$id_cliente       = $_GET['id_cliente'];
$data_atendimento = $_GET['data_atendimento'];
$observacao       = $_GET["observacao"];
$contato          = $_GET["contato"];


include_once "conecta.php";

$sql = $conn->prepare("INSERT INTO atendimento (id_cliente, data_atendimento, observacao, contato) VALUES (?, ?, ?, ?)");
$sql->bindParam(1, $id_cliente);
$sql->bindParam(2, $data_atendimento);
$sql->bindParam(3, $observacao);
$sql->bindParam(4, $contato);
$sql->execute();

if ($sql->rowCount()){
    header("location: atendimento.php?id=$idcliente");

} else{
  header("location: 404.html");
}
$sql = null;
$conn = null;
exit;
?>