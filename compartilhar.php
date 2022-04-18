<?php
include("conexao.php");
session_start();
$arquivo = "myfile".$_FILES['arquivo']['name'];
$tmp_name = $_FILES['arquivo']['tmp_name'];
date_default_timezone_set('america/sao_paulo');
$datahora=date('d-m-Y H:i:s');
if(move_uploaded_file($arquivo,"/arquivos".$tmp_name)){
mysqli_query($conexao,"insert into trabalhosacademicos(titulo,arquivos,datahora,Usuarios_id,Categorias_id) values('$_POST[titulo]','$arquivo','$datahora','$_SESSION[id]','$_POST[categoria])");
}
?>