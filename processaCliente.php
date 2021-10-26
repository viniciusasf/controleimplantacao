<?php
include_once "conecta.php";


$razaosocial   = $_GET['razaosocial'];
$contato       = $_GET['contato'];
$obs           = $_GET['obs'];
$data_cadastro = $_GET['data_cadastro'];
$ativo         = $_GET['ativo'];


$stmt = $conn->prepare("SELECT * 
                            FROM cliente 
                            WHERE razaosocial LIKE '%$razaosocial%' ");

$stmt->execute();

$count = $stmt->rowCount(); //faz o contador de registros.

if ($count == 0) {
    //INSERT NO BANCO
$sql = $conn->prepare("INSERT INTO cliente (razaosocial, contato, obs, data_cadastro, ativo) VALUES (? ,? ,?,?,? )");
$sql->bindParam(1, $razaosocial);
$sql->bindParam(2, $contato);
$sql->bindParam(3, $obs);
$sql->bindParam(4, $data_cadastro);
$sql->bindParam(5, $ativo);
$sql->execute();

header("location: confirmacadastro.php?status=success");  
$sql = null;
$conn = null;

}elseif ($count >= 0){

include "404.php";

$sql = null;
$conn = null;

}

