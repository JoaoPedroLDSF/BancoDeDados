CREATE DATABASE  IF NOT EXISTS `celio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `celio`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: celio
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `documentos`
--

DROP TABLE IF EXISTS `documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentos` (
  `ID_do_documento` int NOT NULL,
  `Nome_do_documento` enum('Contrato','Relatório','Plano','Outro') DEFAULT NULL,
  `Descricao` varchar(50) DEFAULT NULL,
  `Data_de_upload` date DEFAULT NULL,
  PRIMARY KEY (`ID_do_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentos`
--

LOCK TABLES `documentos` WRITE;
/*!40000 ALTER TABLE `documentos` DISABLE KEYS */;
INSERT INTO `documentos` VALUES (1,'Contrato','Contrato de prestação de serviço','2024-10-13'),(2,'Relatório','Relatório financeiro trimestral','2024-10-10'),(3,'Plano','Plano estratégico anual','2024-10-12'),(4,'Contrato','Contrato de consultoria','2024-10-09'),(5,'Relatório','Relatório de atividades mensais','2024-10-11'),(6,'Outro','Documento técnico','2024-10-12');
/*!40000 ALTER TABLE `documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipe` (
  `ID_membro_da_equipe` int NOT NULL,
  `Nome_do_membro` varchar(50) DEFAULT NULL,
  `Funcao` enum('Desenvolvedor','Analista','Gerente','Outro') DEFAULT NULL,
  `Projetos_associados` varchar(50) DEFAULT NULL,
  `ID_do_risco` int DEFAULT NULL,
  PRIMARY KEY (`ID_membro_da_equipe`),
  KEY `ID_do_risco` (`ID_do_risco`),
  CONSTRAINT `equipe_ibfk_1` FOREIGN KEY (`ID_do_risco`) REFERENCES `riscos` (`ID_do_risco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
INSERT INTO `equipe` VALUES (1,'Ryan Robert','Desenvolvedor','Sistema Interno',1),(2,'Renan','Analista','App Mobile',2),(3,'Jéssica','Gerente','Projeto Web',3),(4,'Matheus Calasãs','Desenvolvedor','E-commerce',4),(5,'João Pedro','Analista','ERP',5),(6,'Eric','Gerente','Projeto Cloud',6);
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projetos`
--

DROP TABLE IF EXISTS `projetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projetos` (
  `ID_projeto` int NOT NULL,
  `Nome_do_projeto` varchar(50) DEFAULT NULL,
  `Descricao` text,
  `Data_de_inicio` date DEFAULT NULL,
  `Data_previsao_termino` date DEFAULT NULL,
  `Status` enum('Planejado','Em andamento','Concluído') DEFAULT NULL,
  `Gerente_projeto` varchar(50) DEFAULT NULL,
  `ID_tarefa` int DEFAULT NULL,
  PRIMARY KEY (`ID_projeto`),
  KEY `ID_tarefa` (`ID_tarefa`),
  CONSTRAINT `projetos_ibfk_1` FOREIGN KEY (`ID_tarefa`) REFERENCES `tarefas` (`ID_tarefa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projetos`
--

LOCK TABLES `projetos` WRITE;
/*!40000 ALTER TABLE `projetos` DISABLE KEYS */;
INSERT INTO `projetos` VALUES (1,'Sistema Interno','Desenvolvimento de um sistema interno para gestão','2024-09-01','2024-11-01','Em andamento','Ryan Robert',1),(2,'App Mobile','Aplicativo móvel para clientes','2024-10-01','2024-12-01','Em andamento','Renan',2),(3,'Projeto Web','Website institucional para a empresa','2024-08-01','2024-10-15','Concluído','Jéssica',3),(4,'E-commerce','Plataforma de vendas online','2024-09-15','2025-01-15','Em andamento','Matheus Calasãs',4),(5,'ERP','Sistema de gestão empresarial','2024-07-01','2024-12-30','Em andamento','João Pedro',5),(6,'Projeto Cloud','Migração para a nuvem','2024-10-01','2025-02-01','Planejado','Eric',6);
/*!40000 ALTER TABLE `projetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recursos`
--

DROP TABLE IF EXISTS `recursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recursos` (
  `ID_recursos` int NOT NULL,
  `Nome_recurso` varchar(50) DEFAULT NULL,
  `Tipo_recurso` enum('Humano','Tecnológico','Financeiro') DEFAULT NULL,
  `Disponibilidade` enum('Disponível','Indisponível') DEFAULT NULL,
  `ID_membro_da_equipe` int DEFAULT NULL,
  PRIMARY KEY (`ID_recursos`),
  KEY `ID_membro_da_equipe` (`ID_membro_da_equipe`),
  CONSTRAINT `recursos_ibfk_1` FOREIGN KEY (`ID_membro_da_equipe`) REFERENCES `equipe` (`ID_membro_da_equipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recursos`
--

LOCK TABLES `recursos` WRITE;
/*!40000 ALTER TABLE `recursos` DISABLE KEYS */;
INSERT INTO `recursos` VALUES (1,'Servidor Web','Tecnológico','Disponível',NULL),(2,'Banco de Dados','Tecnológico','Indisponível',NULL),(3,'Software de Gestão','Tecnológico','Disponível',NULL),(4,'Orçamento Projeto Web','Financeiro','Disponível',NULL),(5,'Licença Office 365','Tecnológico','Disponível',NULL),(6,'Ferramentas de Design','Tecnológico','Indisponível',NULL);
/*!40000 ALTER TABLE `recursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riscos`
--

DROP TABLE IF EXISTS `riscos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riscos` (
  `ID_do_risco` int NOT NULL,
  `Descricao_do_risco` varchar(100) DEFAULT NULL,
  `Probabilidade` enum('Baixa','Média','Alta') DEFAULT NULL,
  `Impacto` enum('Baixo','Médio','Alto') DEFAULT NULL,
  `Plano_de_acao` varchar(50) DEFAULT NULL,
  `ID_do_documento` int DEFAULT NULL,
  PRIMARY KEY (`ID_do_risco`),
  KEY `ID_do_documento` (`ID_do_documento`),
  CONSTRAINT `riscos_ibfk_1` FOREIGN KEY (`ID_do_documento`) REFERENCES `documentos` (`ID_do_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riscos`
--

LOCK TABLES `riscos` WRITE;
/*!40000 ALTER TABLE `riscos` DISABLE KEYS */;
INSERT INTO `riscos` VALUES (1,'Risco de atraso na entrega','Alta','Alto','Aumentar recursos',1),(2,'Falha na comunicação','Média','Médio','Reuniões diárias',2),(3,'Mudança de escopo','Baixa','Alto','Formalizar alterações',3),(4,'Problemas técnicos inesperados','Alta','Alto','Implementar plano de contingência',4),(5,'Turnover na equipe','Média','Médio','Plano de retenção',5),(6,'Atraso na compra de materiais','Baixa','Baixo','Negociar prazos com fornecedor',6);
/*!40000 ALTER TABLE `riscos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarefas`
--

DROP TABLE IF EXISTS `tarefas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefas` (
  `ID_tarefa` int NOT NULL,
  `Nome_tarefa` varchar(50) DEFAULT NULL,
  `Descricao_tarefa` text,
  `Data_inicio` date DEFAULT NULL,
  `Data_termino` date DEFAULT NULL,
  `Status_tarefa` enum('Pendente','Em andamento','Concluído') DEFAULT NULL,
  `Responsavel_tarefa` varchar(50) DEFAULT NULL,
  `ID_recursos` int DEFAULT NULL,
  PRIMARY KEY (`ID_tarefa`),
  KEY `ID_recursos` (`ID_recursos`),
  CONSTRAINT `tarefas_ibfk_1` FOREIGN KEY (`ID_recursos`) REFERENCES `recursos` (`ID_recursos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefas`
--

LOCK TABLES `tarefas` WRITE;
/*!40000 ALTER TABLE `tarefas` DISABLE KEYS */;
INSERT INTO `tarefas` VALUES (1,'Configuração Servidor','Configurar ambiente de produção','2024-10-01','2024-10-05','Concluído','Ryan Robert',3),(2,'Análise de Requisitos','Reunir e documentar requisitos','2024-10-02','2024-10-10','Em andamento','Renan',2),(3,'Desenvolvimento Backend','Criar APIs REST','2024-10-03','2024-10-20','Em andamento','Jéssica',1),(4,'Testes de Qualidade','Executar testes unitários e de integração','2024-10-15','2024-10-25','Pendente','Matheus Calasãs',1),(5,'Configuração Banco de Dados','Preparar banco para uso em produção','2024-10-05','2024-10-07','Concluído','João Pedro',5),(6,'Treinamento Equipe','Treinar equipe no uso do sistema','2024-10-20','2024-10-30','Pendente','Eric',6);
/*!40000 ALTER TABLE `tarefas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-31 12:51:59
