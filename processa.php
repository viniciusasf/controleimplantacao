<?php

$razaosocial   = $_GET['razaosocial'];
$contato       = $_GET['contato'];
$obs           = $_GET['obs'];
$data_cadastro = $_GET['data_cadastro'];
$ativo         = $_GET['ativo'];


include_once "conecta.php";


//INSERT 
$sql = $conn->prepare("INSERT INTO cliente (razaosocial, contato, obs, data_cadastro, ativo) VALUES (? ,? ,?,?,? )");
$sql->bindParam(1, $razaosocial);
$sql->bindParam(2, $contato);
$sql->bindParam(3, $obs);
$sql->bindParam(4, $data_cadastro);
$sql->bindParam(5, $ativo);
$sql->execute();

if ($sql->rowCount()){
    header("location: confirmacadastro.php?status=success");

} else{
    header("location: 404.html");
}
$sql = null;
$conn = null;
exit;
?>












