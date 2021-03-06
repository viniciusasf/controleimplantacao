<?php

try {
    include_once "conecta.php";
    date_default_timezone_set('America/Sao_Paulo');

    $id_cliente          = $_GET['id_cliente'];
    $ativo               = $_GET['ativo'];
    $data_encerramento   = date('Y-m-d H:i:s');

    $data = [
        'id_cliente' => $id_cliente,
        'ativo' => $ativo,    
        'data_encerramento' => $data_encerramento,    
    ];

    $update = "UPDATE cliente SET ativo= :ativo, data_encerramento= :data_encerramento WHERE id_cliente= :id_cliente";
    $step = $conn->prepare($update);
    $result = $step->execute($data);

    if (!$result) {
        header("location: 404.html");
    } else {
        header("location: index.php");
    }
    $step = null;
    $conn = null;
    exit;
} catch (Exception $e) {
    echo '<pre />';
    echo 'Exceção capturada: ',  $e->getMessage(), "\n";
}
