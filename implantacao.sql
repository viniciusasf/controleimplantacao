-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 26, 2021 at 12:54 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `implantacao`
--

-- --------------------------------------------------------

--
-- Table structure for table `atendimento`
--

CREATE TABLE `atendimento` (
  `id` int(11) NOT NULL,
  `data_atendimento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `contato` varchar(100) NOT NULL,
  `observacao` varchar(200) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `atendimento`
--

INSERT INTO `atendimento` (`id`, `data_atendimento`, `contato`, `observacao`, `id_cliente`) VALUES
(1, '2021-10-22 16:58:40', 'teste', 'teste', 43),
(2, '2021-10-25 13:34:44', 'NATHALIA', 'Emitir nota de devolução de venda e emissão de orçamento e pedido de venda.', 55);

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `razaosocial` varchar(100) NOT NULL,
  `contato` varchar(50) NOT NULL,
  `obs` varchar(200) DEFAULT NULL,
  `ativo` varchar(5) NOT NULL,
  `data_encerramento` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `data_cadastro`, `razaosocial`, `contato`, `obs`, `ativo`, `data_encerramento`) VALUES
(39, '2021-09-24 15:01:44', 'SIERRA TERE', 'Rene', 'Está com pendência na receita.', 'F', '2021-10-20 13:25:15'),
(40, '2021-09-24 15:04:54', 'ESTRELA GAS E AGUA', 'Thaissa', 'Usa PDV', 'F', '2021-10-22 13:58:42'),
(41, '2021-09-24 15:33:21', 'KB SERVIÇOS USINAGEM', 'Carlos', 'Pedi para remarcar outro treinamento. ', 'F', '2021-09-27 20:16:44'),
(42, '2021-09-24 15:34:51', 'MR INTERFER', 'Daniel', 'Enviará as planilhas para importação no sistema.', 'F', '2021-10-22 13:59:08'),
(43, '2021-09-24 15:36:40', 'CE CHIQUE MODAS', 'Pollyana', 'Usuária utilizando sistema', 'T', NULL),
(44, '2021-09-24 15:38:27', 'CAPUTI PIRACICABA DISTRIB', 'Gabriela', 'Computador fora da rede, ela irá verificar com o técnico.', 'T', NULL),
(45, '2021-09-24 15:41:03', 'MIDAS MIX', 'Miriam', 'Irá transferir o sistema para Nuvem.', 'T', NULL),
(46, '2021-09-24 15:43:02', 'INTERATIVA DISTRIB', 'Bruna', 'Feito instalação, falta o treinamento', 'T', NULL),
(47, '2021-09-24 15:43:42', 'MADEVERA', 'Leiza', 'Madeireira', 'T', NULL),
(48, '2021-09-24 17:02:41', 'ATELIE CARIOCA', 'Natalia', 'Cliente PDV explorar Crediario e financeiro', 'F', '2021-10-22 14:02:17'),
(49, '2021-09-24 17:05:40', 'LESS NOW', 'Claudio', 'A planilha de produto nem todos os produtos tem o numero de referencia, ele quer que a referencia seja o codigo fiscal.', 'T', NULL),
(50, '2021-09-24 17:07:41', 'DISTRIB ERVA MATE KAISER', 'Adriano', 'Configuramos boleto, falta pagar, irá entrar em contato hoje a tarde.', 'F', '2021-10-20 13:25:30'),
(51, '2021-09-28 12:13:49', 'MINERADORA SALOMAO', 'Renato', 'Instalar Licença', 'T', NULL),
(52, '2021-09-30 16:54:30', 'CENTROBEL COMERCIO', 'GERSON', 'Interesse no GiroPro', 'T', NULL),
(53, '2021-10-20 20:18:33', 'JPK MECANICA', 'HARONEO', 'Mecânica, irá usar o sistema apenas para clientes cadastrados, utilizará o PDV', 'T', NULL),
(54, '2021-10-21 12:31:54', 'DISTRIBUIDORA SILVEIRA', 'DANIELA', 'Instalação do sistema', 'T', NULL),
(55, '2021-10-25 13:33:37', 'DISTRIBUIDORA VELOZ', 'NATHALIA', '', 'T', '2021-10-25 13:33:37');

-- --------------------------------------------------------

--
-- Table structure for table `implantacao`
--

CREATE TABLE `implantacao` (
  `id_implantacao` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `data_implantacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `obs` varchar(200) NOT NULL,
  `uso` varchar(20) DEFAULT NULL,
  `contato` varchar(40) NOT NULL,
  `data` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `implantacao`
--

INSERT INTO `implantacao` (`id_implantacao`, `id_cliente`, `data_implantacao`, `obs`, `uso`, `contato`, `data`) VALUES
(22, 39, '2021-09-24 15:02:18', 'Problema com a receita, irá passar o acesso hoje para tentar emissão da nota, falei com o Aldo e vamos tentar emitir a nota fiscal novamente', NULL, 'Rene', NULL),
(23, 39, '2021-09-24 15:02:42', 'Cliente ficou de me enviar o acesso, falei com ele via whatsapp as 10:12', NULL, 'Rene', NULL),
(24, 39, '2021-09-24 15:03:20', 'Passei para o Leonardo e realmente precisa de numero da inscrição estadual mesmo sendo isento. Ele ficou de verificar com a contadora a respeito do IE.', NULL, 'Rene', NULL),
(25, 39, '2021-09-24 15:03:47', 'Verificar o cancelamento da assinatura', NULL, 'Rene', NULL),
(26, 40, '2021-09-24 15:05:25', 'Cliente formatou o computador, emitiu o cupom fiscal e restaurei os arquivos.', NULL, 'Thaissa', NULL),
(27, 40, '2021-09-24 15:06:13', 'Cliente emitindo Cupom Fiscal e Nota Fiscal Eletronica', NULL, 'Thaissa', NULL),
(28, 41, '2021-09-24 15:33:58', 'Já fiz o treinamento, enviou o logo, falta atualizar o sistema, perdi o treinamento de hoje, tem que remarcar.', NULL, 'Carlos', NULL),
(29, 42, '2021-09-24 15:35:02', 'Enviará as planilhas para importação no sistema.', NULL, 'Daniel', NULL),
(30, 42, '2021-09-24 15:35:15', 'Fez treinamento de OS simples, impressão para enviar para produzir peças, irá envia planilha para importação de Cotações.', NULL, 'Daniel', NULL),
(31, 42, '2021-09-24 15:35:26', 'Não realizou o treinamento, não estava na empresa.', NULL, 'Daniel', NULL),
(32, 42, '2021-09-24 15:35:39', 'Já está usando o sistema e emitindo nota fiscal ', NULL, 'Daniel', NULL),
(33, 43, '2021-09-24 15:37:14', 'Já tem a pratica, falamos de financeiro, relatórios, configurei fiado, existe um chamado de um relatório, e instalar impressora.', NULL, 'Pollyana', NULL),
(34, 44, '2021-09-24 15:38:40', 'Computador fora da rede, ela irá verificar com o técnico.', NULL, 'Gabriela', NULL),
(35, 44, '2021-09-24 15:39:28', 'Nova Licença', NULL, 'Adriane', NULL),
(36, 45, '2021-09-24 15:41:29', 'Irá transferir o sistema para Nuvem.', NULL, 'Miriam', NULL),
(37, 45, '2021-09-24 15:41:44', 'Instalar sistema local devido a rede wifi instavel. Implantar nota fiscal, trabalham com factoring...', NULL, 'Miriam', NULL),
(38, 46, '2021-09-24 15:43:12', 'Feito instalação, falta o treinamento', NULL, 'Bruna', NULL),
(39, 47, '2021-09-24 15:44:00', 'Instalação em nuvem, treinamento financeiro, falta realizar mais treinamentos, falar sobre financeiro.', NULL, 'Leiza', NULL),
(40, 47, '2021-09-24 15:44:15', 'Falamos sobre orçamentos de venda.', NULL, 'Leiza', NULL),
(41, 47, '2021-09-24 15:44:46', 'Orçamento de Venda, falta enviar o logo da nova empresa', NULL, 'Leiza', NULL),
(42, 48, '2021-09-24 17:02:56', 'Cliente PDV explorar Crediario e financeiro', NULL, 'Nathalia', NULL),
(43, 49, '2021-09-24 17:05:49', 'A planilha de produto nem todos os produtos tem o numero de referencia, ele quer que a referencia seja o codigo fiscal.', NULL, 'Claudio', NULL),
(44, 49, '2021-09-24 17:06:06', 'Exportar planilha da tray para o GestãoPRO', NULL, 'Claudio', NULL),
(45, 49, '2021-09-24 17:06:19', 'Falei com Claudio, tem integração tray e PDV. Fazer integração amanha.', NULL, 'Claudio', NULL),
(46, 49, '2021-09-24 17:06:43', 'Perguntou sobre Cupom Fiscal para começar emitir, não tem SAP, mas precisa.', NULL, 'Claudio', NULL),
(47, 50, '2021-09-24 17:07:49', 'Configuramos boleto, falta pagar, irá entrar em contato hoje a tarde.', NULL, 'Adriano', NULL),
(48, 50, '2021-09-24 17:08:04', 'Treinamento tirar dúvidas. Cliente precisa emitir nota fiscal, desvinculou o Pedido Ok com o GestãoPRO na integração.', NULL, 'Adriano', NULL),
(49, 51, '2021-09-28 13:39:35', 'Não tem rede interna, fez cotação para plano em nuvem', NULL, 'Renato', NULL),
(50, 42, '2021-09-29 13:02:09', 'No financeiro está inserindo contas manuais como telefone, gasolina, agua, fora os diversos que é a despesa do dia a dia.', NULL, 'Daniel', NULL),
(51, 52, '2021-10-01 11:55:43', 'Implantacao Não realizada', NULL, 'Não realizado', NULL),
(52, 50, '2021-10-01 14:53:02', 'Está fazendo treinamento com Diego.', NULL, 'Contato', NULL),
(53, 40, '2021-10-20 15:14:39', 'Já está tudo certo, emitindo cupom fiscal e nota fiscal eletronica.', NULL, 'Thaisa', NULL),
(54, 53, '2021-10-20 20:20:12', 'Fizemos instalação PDV, fiz cadastros de clientes, produtos e venda no PDV, apresentei alguns relatórios', NULL, 'HARONEO', NULL),
(55, 45, '2021-10-21 16:59:58', 'Teste para colocar a data de implantação.', NULL, 'Teste', '2021-10-21 14:01:00'),
(56, 54, '2021-10-21 17:07:38', 'Instalação', NULL, 'Daniela', '2021-10-21 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(220) NOT NULL,
  `senha_usuario` varchar(220) NOT NULL,
  `usuario` varchar(220) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ativo` varchar(50) NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `senha_usuario`, `usuario`, `data_cadastro`, `ativo`, `data_exclusao`) VALUES
(1, 'Vinicius Antonio da Silva Ferreira', '$2y$10$9Eq9x9oE8UQanGpret4V/.EJLXmmKqldyfvXnHvo5dFV8nqCPOlw6', 'viniciusasf', '2021-09-29 15:23:11', 'T', NULL),
(2, 'Romeu', '$2y$10$rLVVDwWQ/N5oDYsLlPvcEOGgEfIofkXhTDrLYe/CAaMdSgjRE7.6W', 'romeu', '2021-09-30 17:46:14', 'T', '2021-09-30 17:46:14'),
(3, 'Jonas', '$2y$10$ieIx2AsLQAIhfIDVkdJK3.X0OJYwqhBMFJbxPKW2xzio9.vZ1WQLC', 'jonas', '2021-09-30 17:58:07', 'T', '2021-09-30 17:58:07'),
(4, 'Camila Castro', '$2y$10$/gzSotzWXcFrE3o5VcLI4.6hIK42gcHsdpKQVZFSWSt824is1k77K', 'camila', NULL, 'T', NULL),
(5, 'Romualdo', '$2y$10$KWMzmMW0djRO7YIUpQc24OM4FFs8ao5LQV6mbBFT0ljVwMhglQIrC', 'romualdo', NULL, 'T', NULL),
(6, 'João Anastacio', '$2y$10$Nt2GhRWAji1I7zmAlnqeaeoqaXNT2elhkOEUJyfOJWlw50M8e2Gv.', 'joao', '2021-09-30 20:01:24', 'T', NULL),
(7, 'Isabella', '$2y$10$X9Vz3msp8An4OQ97L.w71O3e0w.eysQWdXb4uFdITaUQjcLxMD2ny', 'isabella', '2021-10-01 15:19:51', 'T', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indexes for table `implantacao`
--
ALTER TABLE `implantacao`
  ADD PRIMARY KEY (`id_implantacao`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `implantacao`
--
ALTER TABLE `implantacao`
  MODIFY `id_implantacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
