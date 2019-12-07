/********************************************************************/
/* Exemplo de importação utilizando o SGBD MySQL 5.x */
/* Criar pasta “Consumidor” no disco C:, baixar os arquivos csv do
site Consumidor.gov.br, Menu Indicadores - Dados Abertos, e
descompactar na respectiva pasta. URL do menu dados abertos:
<https://www.consumidor.gov.br/pages/dadosabertos/externo/> */
/* Criar o banco de dados consumidor */
CREATE SCHEMA `consumidor`;
/* Criar a tabela consumidor para receber os dados do arquivo csv */
USE `consumidor`;
CREATE TABLE `consumidor`.`consumidor` (
`Gestor` VARCHAR (150) NOT NULL,
`CanaldeOrigem` VARCHAR (30) NOT NULL,
`Regiao` CHAR (2) NOT NULL,
`UF` CHAR (2) NOT NULL,
`Cidade` VARCHAR (100) NOT NULL,
`Sexo` CHAR (1) NOT NULL,
`FaixaEtaria` VARCHAR (30) NOT NULL,
`AnoAbertura` INT (11) NOT NULL,
`MesAbertura` INT (11) NOT NULL,
`DataAbertura` CHAR (10) NOT NULL,
`HoraAbertura` CHAR (8) NOT NULL,
`DataResposta` VARCHAR (10) NULL,
`HoraResposta` CHAR (8) NULL,
`DataAnálise` VARCHAR (10) NULL,
`HoraAnálise` CHAR (8) NULL,
`DataRecusa` VARCHAR (10) NULL,
`HoraRecusa` CHAR (8) NULL,
`DataFinalizacao` VARCHAR (10) NOT NULL,
`HoraFinalizacao` CHAR (8) NOT NULL,
`PrazoResposta` CHAR (10) NOT NULL,
`PrazoAnaliseGestor` CHAR (2) NULL,
`TempoResposta` CHAR (2) NULL,
`NomeFantasia` VARCHAR (100) NOT NULL,
`SegmentoMercado` VARCHAR (100) NOT NULL,
`Area` VARCHAR (250) NOT NULL,
`Assunto` VARCHAR (250) NOT NULL,
`GrupoProblema` VARCHAR (250) NOT NULL,
`Problema` VARCHAR (150) NOT NULL,
`ComoComprouContratou` VARCHAR (100) NOT NULL,
`ProcurouEmpresa` CHAR (1) NOT NULL,
`Respondida` CHAR (1) NOT NULL,
`Situacao` VARCHAR (100) NOT NULL,
`AvaliacaoReclamacao` VARCHAR (50) NOT NULL,
`NotaConsumidor` CHAR (1) NULL,
`AnalisedaRecusa` VARCHAR (12) NOT NULL,
`EdicaodeConteudo` CHAR (1) NOT NULL,
`InteracaodoGestor` CHAR (1) NOT NULL,
`Total` INT (1) NOT NULL);
/* Verificar charset e collate do banco de dados consumidor */
show variables like 'character_set_database';
show variables like 'collation_database';
/* Caso o CHARSET (character_set_database) do banco de dados
consumidor não seja Latin1 e o COLLATE (collation_database) não seja
latin1_swedish_ci, executar o seguinte script */
ALTER DATABASE `consumidor` CHARSET = Latin1 COLLATE = latin1_swedish_ci;
/* Importar os dados do arquivo csv de maio de 2014 a partir da pasta
“Consumidor” localizada no disco C: , sendo que o resultado do script
abaixo não deverá apresentar avisos ou erros */
LOAD DATA LOCAL INFILE 'C:\\Consumidor\\2014-05.csv'
INTO TABLE `consumidor`.`consumidor`
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
/* Consultar 10 registros importados */
SELECT * FROM `consumidor`.`consumidor` LIMIT 100;
/*****************************************************************/