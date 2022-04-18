-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 22-Nov-2020 às 19:02
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1_swedish_cimb4 */;

--
-- Database: `bancodidatico`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `batepapo`
--

CREATE TABLE `batepapo` (
  `id` int(10) UNSIGNED NOT NULL,
  `Usuarios_id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `usuario1` varchar(45) DEFAULT NULL,
  `usuario2` varchar(45) DEFAULT NULL,
  `usuario3` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `descricao` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `TrabalhosAcademicos_id` int(10) UNSIGNED NOT NULL,
  `Usuarios_id` int(10) UNSIGNED NOT NULL,
  `comentario` text,
  `data_2` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `eventos`
--

CREATE TABLE `eventos` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` int(10) UNSIGNED DEFAULT NULL,
  `descricao` int(10) UNSIGNED DEFAULT NULL,
  `data_2` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `favoritos`
--

CREATE TABLE `favoritos` (
  `id` int(10) UNSIGNED NOT NULL,
  `TrabalhosAcademicos_id` int(10) UNSIGNED NOT NULL,
  `Usuarios_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico`
--

CREATE TABLE `historico` (
  `id` int(10) UNSIGNED NOT NULL,
  `Usuarios_id` int(10) UNSIGNED NOT NULL,
  `TrabalhosAcademicos_id` int(10) UNSIGNED NOT NULL,
  `data_2` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagens`
--

CREATE TABLE `mensagens` (
  `id` int(10) UNSIGNED NOT NULL,
  `Batepapo_id` int(10) UNSIGNED NOT NULL,
  `mensagem` text,
  `data_2` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `participantes`
--

CREATE TABLE `participantes` (
  `Usuarios_id` int(10) UNSIGNED NOT NULL,
  `Eventos_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pontuacao`
--

CREATE TABLE `pontuacao` (
  `id` int(10) UNSIGNED NOT NULL,
  `Usuarios_id` int(10) UNSIGNED NOT NULL,
  `pontos` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `premios`
--

CREATE TABLE `premios` (
  `id` int(10) UNSIGNED NOT NULL,
  `Usuarios_id` int(10) UNSIGNED NOT NULL,
  `Pontuacao_id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `descricao` text,
  `imagem` varchar(45) DEFAULT NULL,
  `comando` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `trabalhosacademicos`
--

CREATE TABLE `trabalhosacademicos` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` text,
  `arquivos` varchar(255) NOT NULL,
  `Usuarios_id` int(10) UNSIGNED NOT NULL,
  `Categorias_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batepapo`
--
ALTER TABLE `batepapo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Usuarios_id` (`Usuarios_id`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Usuarios_id` (`Usuarios_id`),
  ADD KEY `TrabalhosAcademicos_id` (`TrabalhosAcademicos_id`);

--
-- Indexes for table `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Usuarios_id` (`Usuarios_id`),
  ADD KEY `TrabalhosAcademicos_id` (`TrabalhosAcademicos_id`);

--
-- Indexes for table `historico`
--
ALTER TABLE `historico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `TrabalhosAcademicos_id` (`TrabalhosAcademicos_id`),
  ADD KEY `Usuarios_id` (`Usuarios_id`);

--
-- Indexes for table `mensagens`
--
ALTER TABLE `mensagens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Batepapo_id` (`Batepapo_id`);

--
-- Indexes for table `participantes`
--
ALTER TABLE `participantes`
  ADD PRIMARY KEY (`Usuarios_id`,`Eventos_id`),
  ADD KEY `Eventos_id` (`Eventos_id`);

--
-- Indexes for table `pontuacao`
--
ALTER TABLE `pontuacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Usuarios_id` (`Usuarios_id`);

--
-- Indexes for table `premios`
--
ALTER TABLE `premios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Pontuacao_id` (`Pontuacao_id`),
  ADD KEY `Usuarios_id` (`Usuarios_id`);

--
-- Indexes for table `trabalhosacademicos`
--
ALTER TABLE `trabalhosacademicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Usuarios_id` (`Usuarios_id`),
  ADD KEY `Categorias_id` (`Categorias_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batepapo`
--
ALTER TABLE `batepapo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `historico`
--
ALTER TABLE `historico`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mensagens`
--
ALTER TABLE `mensagens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pontuacao`
--
ALTER TABLE `pontuacao`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `premios`
--
ALTER TABLE `premios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trabalhosacademicos`
--
ALTER TABLE `trabalhosacademicos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `batepapo`
--
ALTER TABLE `batepapo`
  ADD CONSTRAINT `batepapo_ibfk_1` FOREIGN KEY (`Usuarios_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`Usuarios_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`TrabalhosAcademicos_id`) REFERENCES `trabalhosacademicos` (`id`);

--
-- Limitadores para a tabela `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`Usuarios_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`TrabalhosAcademicos_id`) REFERENCES `trabalhosacademicos` (`id`);

--
-- Limitadores para a tabela `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`TrabalhosAcademicos_id`) REFERENCES `trabalhosacademicos` (`id`),
  ADD CONSTRAINT `historico_ibfk_2` FOREIGN KEY (`Usuarios_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `mensagens`
--
ALTER TABLE `mensagens`
  ADD CONSTRAINT `mensagens_ibfk_1` FOREIGN KEY (`Batepapo_id`) REFERENCES `batepapo` (`id`);

--
-- Limitadores para a tabela `participantes`
--
ALTER TABLE `participantes`
  ADD CONSTRAINT `participantes_ibfk_1` FOREIGN KEY (`Usuarios_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `participantes_ibfk_2` FOREIGN KEY (`Eventos_id`) REFERENCES `eventos` (`id`);

--
-- Limitadores para a tabela `pontuacao`
--
ALTER TABLE `pontuacao`
  ADD CONSTRAINT `pontuacao_ibfk_1` FOREIGN KEY (`Usuarios_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `premios`
--
ALTER TABLE `premios`
  ADD CONSTRAINT `premios_ibfk_1` FOREIGN KEY (`Pontuacao_id`) REFERENCES `pontuacao` (`id`),
  ADD CONSTRAINT `premios_ibfk_2` FOREIGN KEY (`Usuarios_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `trabalhosacademicos`
--
ALTER TABLE `trabalhosacademicos`
  ADD CONSTRAINT `trabalhosacademicos_ibfk_1` FOREIGN KEY (`Usuarios_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `trabalhosacademicos_ibfk_2` FOREIGN KEY (`Categorias_id`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
