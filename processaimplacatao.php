<?php 

$idcliente       = $_GET['id_cliente'];
$data_implatacao = $_GET['data_implantacao'];
$obs             = $_GET["obs"];
$contato         = $_GET["contato"];
$data            = $_GET["data"];
//date_format($data_implatacao, 'd/m/Y H:i:s'); // formata data pt-br

include_once "conecta.php";

$sql = $conn->prepare("INSERT INTO implantacao (id_cliente, data_implantacao, obs, contato, data) VALUES (?, ?, ?, ?,?)");
$sql->bindParam(1, $idcliente);
$sql->bindParam(2, $data_implatacao);
$sql->bindParam(3, $obs);
$sql->bindParam(4, $contato);
$sql->bindParam(5, $data);
$sql->execute();

if ($sql->rowCount()){
    header("location: implantacao.php?id=$idcliente");

} else{
  header("location: 404.html");
}
$sql = null;
$conn = null;
exit;
?>