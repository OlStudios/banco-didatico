<html lang="pt-BR">
    <head>
        <meta charset="utf-8">
        <link rel="style/css" src="hub.css">
        <link rel="icon" href="icone.png" type="image/png">
        <title>
            Banco Didático
        </title>
    </head>
    <body>
        <header>
            <h1>
                BANCO DIDÁTICO
            </h1>
            <img src="logo.png">
        </header>
        <nav>
            <a href="Categorias.php">
				Categorias
            </a>|
            <a href="Eventos.php">
                Eventos
            </a>|
            <a href="Pesquisar.php">
                Pesquisar
            </a>|
            <a href="Sobre.php">
                Sobre
            </a>
        </nav>
        <section>
			<h2>
				PUBLICAR
			</h2>
			<h3>
				Compartilhe um projeto didático seu conosco, em qualquer formato:
			</h3>
			<form method="post" enctype="multipart/form-data" action="compartilhar.php" id="compartilhar">
			<label for="titulo">
			Insira um título:
			</label>
			<input type="text" name="titulo" id="titulo" required>
			<label for="categoria">
			Insira a categoria correspondente:
			</label>
			<select name="categoria" form="compartilhar" required>
			<option value="1">
			Língua Portuguesa
			</option>
			<option value="2">
			Língua Estrangeira Moderna
			</option>
			<option value="3">
			Artes 
			</option>
			<option value="4">
			Educação Física 
			</option>
			<option value="5">
			História
			</option>
			<option value="6">
			Geografia
			</option>
			<option value="7">
			Filosofia
			</option>
			<option value="8">
			Sociologia
			</option>
			<option value="9">
			Física
			</option>
			<option value="10">
			Química
			</option>
			<option value="11">
			Biologia
			</option>
			<option value="12">
			Matemática
			</option>
			</select>
			<label for="arquivo">
			Insira seu trabalho aqui:
			</label>
			<input type="file" name="arquivo" id="arquivo">
			<input type="submit" value="Compartilhar">
			</form>
			<h2>
			SEUS TRABALHOS
			</h2>
			<?php
	include("conexao.php");
	session_start();
	if((mysqli_query($conexao,"select * from trabalhosacademicos where Usuarios_id='$_SESSION[id]'"))!=null){
		echo "
		<h2>
			Você ainda não compartilhou nada, :(
		</h2>";
	}else{
			while($row2=mysqli_fetch_assoc(mysqli_query($conexao,"select * from trabalhosacademicos where usuarios_id='$_SESSION[id]'"))){
		echo "
		<h3>
			".$row2['titulo']."
		</h3>
		<img src='arquivos/".$row2['arquivo']."'>
		<p>".$row2['categoria']."
		";
	}
	}
			?>
        </section>
        <aside>
			<?php
			if((isset($_SESSION['email']))and(isset($_SESSION['nome']))and(isset($_SESSION['senha']))){
				echo "
				<h3>
				".$_SESSION['nome']."
				</h3>
				<a href='deslogar.php'>
					Sair
				</a>|
				<a href='historico.php'>
					Histórico
				</a>|
				<a href='favoritos.php'>
					Favoritos
				</a>|
				<a href='comentarios.php'>
					Comentários
				</a>|
				<a href='eventos.php'>
					Eventos
				</a>|
				<a href='personalizacoes.php'>
					Personalizações
				</a>|
				<a href='batepapo.php'>
					Bate-papo
				</a>|
				<a href='trabalhosacademicos.php'>
					Projetos
				</a>
				";
			}else{
			echo '
			<h2>
                Cadastre-se e acesse:
            </h2>
            <ul type="square">
                <li>Histórico
                <li>Favoritos
                <li>Comentários
                <li>Eventos
                <li>Personalizações
				<li>Bate-papo
            </ul>
			<h2>
				Além de poder compartilhar seus trabalhos com todo mundo e receber feedback de mestres.
			</h2>
            <form method="post" action="cadastro.php">
                <label for="email">
                    Insira seu endereço de e-mail:
                </label>
                <input type="email" name="email" id="email" required>
                <label for="nome">
                    Insira o seu nome completo:
                </label>
                <input type="text" name="nome" id="nome" required>
                <label for="senha">
                    Insira uma senha:
                </label>
                <input type="password" name="senha" id="senha" required>
				<input type="submit" value="Criar Conta">
			</form>
			';
			}
			?>
        </aside>
        <footer>
        Banco Didático © - Todos os direitos reservados
        </footer>
    </body>
</html>