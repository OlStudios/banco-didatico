<?php
session_start();
unset($_SESSION['email']);
unset($_SESSION['nome']);
unset($_SESSION['senha']);
	header("location:index.php");
?>