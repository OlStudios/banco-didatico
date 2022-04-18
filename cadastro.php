<?php
include("conexao.php");
session_start();
$rownum=mysqli_num_rows(mysqli_query($conexao,"select * from usuarios where email='$_POST[email]'"));
if($rownum==1){
	$_SESSION['erro1']="E-mail j? cadastrado.";
	header("location:index.php");
}else{
	mysqli_query($conexao,"insert into usuarios(nome,email,senha) values('$_POST[nome]','$_POST[email]','$_POST[senha]')");
	$_SESSION['email']=$_POST['email'];
	$_SESSION['nome']=$_POST['nome'];
	$_SESSION['senha']=$_POST['senha'];
	while($row=mysqli_fetch_assoc(mysqli_query($conexao,"select * from usuarios where email='$_POST[email]' and senha='$_POST[senha]'"))){
		$_SESSION['id']=$row['id'];
		header("location:index.php");
	}
}
?>