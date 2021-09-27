-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 27, 2021 at 01:35 PM
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
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `razaosocial` varchar(100) NOT NULL,
  `contato` varchar(50) NOT NULL,
  `obs` varchar(200) DEFAULT NULL,
  `ativo` varchar(5) NOT NULL,
  `data_encerramento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `data_cadastro`, `razaosocial`, `contato`, `obs`, `ativo`, `data_encerramento`) VALUES
(39, '2021-09-24 15:01:44', 'SIERRA TERE', 'Rene', 'Está com pendência na receita.', 'T', '2021-09-24 15:01:44'),
(40, '2021-09-24 15:04:54', 'ESTRELA GAS E AGUA', 'Thaissa', 'Usa PDV', 'T', '2021-09-24 15:04:54'),
(41, '2021-09-24 15:33:21', 'KB SERVIÇOS USINAGEM', 'Carlos', 'Pedi para remarcar outro treinamento. ', 'T', '2021-09-24 15:33:21'),
(42, '2021-09-24 15:34:51', 'MR INTERFER', 'Daniel', 'Enviará as planilhas para importação no sistema.', 'T', '2021-09-24 15:34:51'),
(43, '2021-09-24 15:36:40', 'CE CHIQUE MODAS', 'Pollyana', 'Usuária utilizando sistema', 'T', '2021-09-24 15:36:40'),
(44, '2021-09-24 15:38:27', 'CAPUTI PIRACICABA DISTRIB', 'Gabriela', 'Computador fora da rede, ela irá verificar com o técnico.', 'T', '2021-09-24 15:38:27'),
(45, '2021-09-24 15:41:03', 'MIDAS MIX', 'Miriam', 'Irá transferir o sistema para Nuvem.', 'T', '2021-09-24 15:41:03'),
(46, '2021-09-24 15:43:02', 'INTERATIVA DISTRIB', 'Bruna', 'Feito instalação, falta o treinamento', 'T', '2021-09-24 15:43:02'),
(47, '2021-09-24 15:43:42', 'MADEVERA', 'Leiza', 'Madeireira', 'T', '2021-09-24 15:43:42'),
(48, '2021-09-24 17:02:41', 'ATELIE CARIOCA', 'Natalia', 'Cliente PDV explorar Crediario e financeiro', 'T', '2021-09-24 17:02:41'),
(49, '2021-09-24 17:05:40', 'LESS NOW', 'Claudio', 'A planilha de produto nem todos os produtos tem o numero de referencia, ele quer que a referencia seja o codigo fiscal.', 'T', '2021-09-24 17:05:40'),
(50, '2021-09-24 17:07:41', 'DISTRIB ERVA MATE KAISER', 'Adriano', 'Configuramos boleto, falta pagar, irá entrar em contato hoje a tarde.', 'T', '2021-09-24 17:07:41');

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
  `contato` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `implantacao`
--

INSERT INTO `implantacao` (`id_implantacao`, `id_cliente`, `data_implantacao`, `obs`, `uso`, `contato`) VALUES
(22, 39, '2021-09-24 15:02:18', 'Problema com a receita, irá passar o acesso hoje para tentar emissão da nota, falei com o Aldo e vamos tentar emitir a nota fiscal novamente', NULL, 'Rene'),
(23, 39, '2021-09-24 15:02:42', 'Cliente ficou de me enviar o acesso, falei com ele via whatsapp as 10:12', NULL, 'Rene'),
(24, 39, '2021-09-24 15:03:20', 'Passei para o Leonardo e realmente precisa de numero da inscrição estadual mesmo sendo isento. Ele ficou de verificar com a contadora a respeito do IE.', NULL, 'Rene'),
(25, 39, '2021-09-24 15:03:47', 'Verificar o cancelamento da assinatura', NULL, 'Rene'),
(26, 40, '2021-09-24 15:05:25', 'Cliente formatou o computador, emitiu o cupom fiscal e restaurei os arquivos.', NULL, 'Thaissa'),
(27, 40, '2021-09-24 15:06:13', 'Cliente emitindo Cupom Fiscal e Nota Fiscal Eletronica', NULL, 'Thaissa'),
(28, 41, '2021-09-24 15:33:58', 'Já fiz o treinamento, enviou o logo, falta atualizar o sistema, perdi o treinamento de hoje, tem que remarcar.', NULL, 'Carlos'),
(29, 42, '2021-09-24 15:35:02', 'Enviará as planilhas para importação no sistema.', NULL, 'Daniel'),
(30, 42, '2021-09-24 15:35:15', 'Fez treinamento de OS simples, impressão para enviar para produzir peças, irá envia planilha para importação de Cotações.', NULL, 'Daniel'),
(31, 42, '2021-09-24 15:35:26', 'Não realizou o treinamento, não estava na empresa.', NULL, 'Daniel'),
(32, 42, '2021-09-24 15:35:39', 'Já está usando o sistema e emitindo nota fiscal ', NULL, 'Daniel'),
(33, 43, '2021-09-24 15:37:14', 'Já tem a pratica, falamos de financeiro, relatórios, configurei fiado, existe um chamado de um relatório, e instalar impressora.', NULL, 'Pollyana'),
(34, 44, '2021-09-24 15:38:40', 'Computador fora da rede, ela irá verificar com o técnico.', NULL, 'Gabriela'),
(35, 44, '2021-09-24 15:39:28', 'Nova Licença', NULL, 'Adriane'),
(36, 45, '2021-09-24 15:41:29', 'Irá transferir o sistema para Nuvem.', NULL, 'Miriam'),
(37, 45, '2021-09-24 15:41:44', 'Instalar sistema local devido a rede wifi instavel. Implantar nota fiscal, trabalham com factoring...', NULL, 'Miriam'),
(38, 46, '2021-09-24 15:43:12', 'Feito instalação, falta o treinamento', NULL, 'Bruna'),
(39, 47, '2021-09-24 15:44:00', 'Instalação em nuvem, treinamento financeiro, falta realizar mais treinamentos, falar sobre financeiro.', NULL, 'Leiza'),
(40, 47, '2021-09-24 15:44:15', 'Falamos sobre orçamentos de venda.', NULL, 'Leiza'),
(41, 47, '2021-09-24 15:44:46', 'Orçamento de Venda, falta enviar o logo da nova empresa', NULL, 'Leiza'),
(42, 48, '2021-09-24 17:02:56', 'Cliente PDV explorar Crediario e financeiro', NULL, 'Nathalia'),
(43, 49, '2021-09-24 17:05:49', 'A planilha de produto nem todos os produtos tem o numero de referencia, ele quer que a referencia seja o codigo fiscal.', NULL, 'Claudio'),
(44, 49, '2021-09-24 17:06:06', 'Exportar planilha da tray para o GestãoPRO', NULL, 'Claudio'),
(45, 49, '2021-09-24 17:06:19', 'Falei com Claudio, tem integração tray e PDV. Fazer integração amanha.', NULL, 'Claudio'),
(46, 49, '2021-09-24 17:06:43', 'Perguntou sobre Cupom Fiscal para começar emitir, não tem SAP, mas precisa.', NULL, 'Claudio'),
(47, 50, '2021-09-24 17:07:49', 'Configuramos boleto, falta pagar, irá entrar em contato hoje a tarde.', NULL, 'Adriano'),
(48, 50, '2021-09-24 17:08:04', 'Treinamento tirar dúvidas. Cliente precisa emitir nota fiscal, desvinculou o Pedido Ok com o GestãoPRO na integração.', NULL, 'Adriano');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `implantacao`
--
ALTER TABLE `implantacao`
  MODIFY `id_implantacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
