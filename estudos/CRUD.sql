##############################
-- C -> Create
-- R -> Read
-- U -> Update
-- D -> Delete
##############################

-- CRIAR BANCO DE DADOS
CREATE DATABASE IF NOT EXISTS db_teste;

-- Deletar um banco de dados
DROP DATABASE db_teste;

-- Listar todos os bancos de dados.
SHOW DATABASES;

-- Entrar em um banco de dados.
USE db_teste;

-- Descobrir em qual banco de dados vocÊ está conectado.
SELECT DATABASE();

-- CRIAR TABELAS NO BANCO DE DADOS
-- Definindo as colunas e
-- Definindo o tipo de dados
CREATE TABLE IF NOT EXISTS tbl_aluno(
	id INT,
    nome VARCHAR(50),
    email VARCHAR(50),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS tbl_curso(
	id INT,
    nome VARCHAR(50),
    preco DECIMAL(10, 2), -- 00000000,00
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS tbl_matricula(
	id INT,
    id_aluno INT,
    id_curso INT,
    data_cadastro DATE,
    
    -- CONSTRAINTS
    PRIMARY KEY(id),
    FOREIGN KEY(id_aluno) REFERENCES tbl_aluno(id),
    FOREIGN KEY(id_curso) REFERENCES tbl_curso(id)
);

-- INSERIR DADOS NAS TABELAS DO BANCO DE DADOS
-- Tabela de Alunos
INSERT INTO 
	tbl_aluno
VALUES
	(1, 'Murilo', 'murilo@gmail.com'),
    (2, 'Maria', 'maria@gmail.com'),
    (3, 'Mayara', 'mayara@gmail.com'),
    (4, 'João', 'joao@gmail.com');

-- Tabela de Cursos
INSERT INTO 
	tbl_curso 
VALUES
	(1, 'Python', 1000.00),
	(2, 'SQL', 700.00),
	(3, 'Spark', 500.00),
	(4, 'Linux', 300.00);
    
-- Tabela de Matrículas
INSERT INTO
	tbl_matricula
VALUES
	(1, 1, 1, '2024/01/05'),
    (2, 1, 2, '2024/02/10'),
    (3, 2, 3, '2024/02/13'),
    (4, 3, 1, '2024/01/30'),
    (5, 4, 3, '2023/11/27'),
    (6, 4, 3, '2023/12/20');

-- ATUALIZAR REGISTRO
-- alterando o preço do curso de id = 1
UPDATE tbl_curso
SET preco = 1200
WHERE id = 1;

-- DELETAR REGISTRO DA TABELA
DELETE FROM 
	tbl_matricula
WHERE
	id = 6;
 
-- DELETAR UMA TABELA DO BANCO DE DADOS
-- DROP TABLE -> Deleta todas as linhas da tabela e a própria tabela.
-- TRUNCATE TABLE -> Deleta todos os registros da tabela de uma vez, mas mantém a existência da tabela
TRUNCATE TABLE tbl_matricula;
DROP TABLE tbl_matricula;

SELECT * from tbl_curso;
SELECT * from tbl_matricula;























