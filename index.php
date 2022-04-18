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
                RECENTES
            </h2>
            <a href="MaisRecentes.php">
                Mais
            </a>
                <article>

                </article>
                <article>

                </article>
                <article>

                </article>
                <article>

                </article>
                <article>
                
                </article>
                <article>
                
                </article>
                <article>
                
                </article>
                <article>
                
                </article>
                <article>
                
                </article>
                <article>
                
                </article>
            <h2>
                POPULARES
            </h2>
            <a href="MaisPopulares.php">
                Mais
            </a>
                <article>
                
                </article>
                <article>
                
                </article>
                <article>
                
                </article>
                <article>
                
                </article>
                <article>
                
                </article>
        </section>
        <aside>
			<?php
			session_start();
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
			<h3>
				Além de poder compartilhar seus trabalhos com todo mundo e receber feedback de mestres.
			</h3>
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
			if(isset($_SESSION['erro1'])){
				echo $_SESSION['erro1'];
				unset($_SESSION['erro1']);
			}
			echo '
            <h2>
                Já possui uma conta?
            </h2>
			<form method="post" action="login.php">
                <label for="email">
                    Insira seu endereço de e-mail:
                </label>
                <input type="email" name="email" id="email" required>
                <label for="senha">
                    Insira uma senha:
                </label>
                <input type="password" name="senha" id="senha" required>
				<input type="submit" value="Logar">
            </form>
			';
			if(isset($_SESSION['erro2'])){
			echo $_SESSION['erro2'];
			unset($_SESSION['erro2']);
			}
			}
			?>
        </aside>
        <footer>
			© 2020 Banco Didático
        </footer>
    </body>
</html>