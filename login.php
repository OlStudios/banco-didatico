<?php
include("conexao.php");
session_start();
$num=mysqli_num_rows(mysqli_query($conexao,"select * from usuarios where email='$_POST[email]' and senha='$_POST[senha]'"));
if($num==1){
	$_SESSION['email']=$_POST['email'];
	$_SESSION['senha']=$_POST['senha'];
	while($row=mysqli_fetch_assoc(mysqli_query($conexao,"select * from usuarios where email='$_POST[email]' and senha='$_POST[senha]'"))){
		$_SESSION['nome']=$row['nome'];
		$_SESSION['id']=$row['id'];
		header("location:index.php");
	}
}else{
	$_SESSION['erro2']="E-mail ou senha inválidos.";
	header("location:index.php");
}
?>