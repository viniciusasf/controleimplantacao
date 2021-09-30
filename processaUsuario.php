<?php
include_once "conecta.php";

//Funcão strip_tags - elimina qual extensão (html, php e etc)
//Função trim - elimina qualquer espaço em branco
if(isset($_POST['enviar'])){

$nome          = strip_tags(trim($_POST['nome']));
$usuario       = strip_tags(trim($_POST['usuario']));
$senha         = strip_tags(trim(password_hash($_POST['senha_usuario'], PASSWORD_DEFAULT)));
$ativo         = strip_tags(trim($_POST['ativo']));
$data_cadastro = strip_tags(trim($_POST['data_cadastro']));
$data_exclusao = NULL;

//echo "Nome: ". $nome ."<br>";
//echo "Usuario: ".$usuario ."<br>";
//echo "Senha: ".$senha ."<br>";
//echo "Data Cadastro: ".$data_cadastro ."<br>";
//echo "Ativo: ".$ativo;

//Define a tabela

$sql_teste  = 'INSERT INTO usuarios (nome, usuario, senha_usuario, data_cadastro, ativo, data_exclusao)';
$sql_teste .= 'VALUES (:nome, :usuario, :senha, :data_cadastro, :ativo, :data_exclusao)';  //Função [ .= ] - concatenar

try{
  //Antes de executar qualquer tarefa, verifica no Bco Dados Login e Senha
  $query_teste = $conn->prepare($sql_teste);

  $query_teste->bindValue(':nome',$nome, PDO::PARAM_STR);
  $query_teste->bindValue(':usuario',$usuario, PDO::PARAM_STR);
  $query_teste->bindValue(':senha',$senha, PDO::PARAM_STR);  
  $query_teste->bindValue(':data_cadastro',$data_cadastro, PDO::PARAM_STR);
  $query_teste->bindValue(':ativo',$ativo, PDO::PARAM_STR);
  $query_teste->bindValue(':data_exclusao',$data_exclusao = NULL, PDO::PARAM_STR);    

  $query_teste->execute();
  header("location: confirmacadastro.php?status=success");

} catch (PDOException $error_insert) {
  echo 'Erro ao cadastrar: Verifique  '.$error_insert->getMessage();
}

}
