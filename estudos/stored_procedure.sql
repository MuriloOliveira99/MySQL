-- Exemplo 1. Crie uma procedure que atualize o preço de um curso com um nvoo preço.ALTER
-- sua procedure deve ser capaz de pesquisar o ID do curso de acordo com o parâmetro.

DELIMITER $$
CREATE PROCEDURE sp_atualiza_duracao(nova_duracao INT, curso_id INT)
BEGIN
    -- atualizando curso
    UPDATE 
        cursos 
    SET 
        duracao = nova_duracao
    WHERE id = curso_id;
    
    -- mensagem
    SELECT 'Duracao atualizada com sucesso!';
    
END $$
DELIMITER ;

call sp_atualiza_duracao(330, 1);
-- ----------------------------------------------------------------------------------------------

-- EX2.: Crie uma procedure capaz de receber 2 parametros: ID e desconto
-- Com a informação de ID, ela deve aplicar o desconto para o curso de ID informado.
-- além disso, sua procedure deve retornar as seguintes mensagens:
-- Desconto de ___ aplicado com sucesso
-- Curso: _____; preço antigo = ____; preço novo = _______
-- 'Codigo finalizado com sucesso'

DELIMITER $$
CREATE PROCEDURE sp_desconto(id_curso INT, desconto DECIMAL(10, 2))
BEGIN
	DECLARE preco_desconto DECIMAL(10, 2);
    DECLARE nome_curso VARCHAR(50);
    DECLARE preco_antigo DECIMAL(10, 2);
    
    SET preco_antigo = (SELECT preco FROM cursos WHERE id = id_curso);
    SET preco_desconto = (SELECT preco FROM cursos WHERE id = id_curso) * (1 - desconto);
    SET nome_curso = (SELECT nome FROM cursos WHERE id = id_curso);
    
    UPDATE cursos
    SET preco = preco_desconto
    WHERE id = id_curso;
    
    SELECT CONCAT('Desconto de ', desconto, ' aplicado com sucesso!');
    SELECT CONCAT('Curso: ', nome_curso, '; Preço antigo R$', preco_antigo, '; Preço Novo = R$', preco_desconto);
		
END $$
DELIMITER ;


call sp_desconto(1, 0.5);
select * from cursos



















/*
use teste
-- SET SQL_SAFE_UPDATES = 0;
-- Criação da tabela de cursos
CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    duracao INT NOT NULL
);

-- Criação da tabela de alunos
CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

INSERT INTO cursos (nome, duracao) VALUES ('Curso A', 120);
INSERT INTO cursos (nome, duracao) VALUES ('Curso B', 90);
INSERT INTO cursos (nome, duracao) VALUES ('Curso C', 45);
INSERT INTO cursos (nome, duracao) VALUES ('Curso D', 60);
INSERT INTO cursos (nome, duracao) VALUES ('Curso E', 75);

-- Inserindo alunos
INSERT INTO alunos (nome, email, curso_id) VALUES ('Aluno 1', 'aluno1@email.com', 1);
INSERT INTO alunos (nome, email, curso_id) VALUES ('Aluno 2', 'aluno2@email.com', 2);
INSERT INTO alunos (nome, email, curso_id) VALUES ('Aluno 3', 'aluno3@email.com', 3);
INSERT INTO alunos (nome, email, curso_id) VALUES ('Aluno 4', 'aluno4@email.com', 1);
INSERT INTO alunos (nome, email, curso_id) VALUES ('Aluno 5', 'aluno5@email.com', 2);
INSERT INTO alunos (nome, email, curso_id) VALUES ('Aluno 6', 'aluno6@email.com', 3);
INSERT INTO alunos (nome, email, curso_id) VALUES ('Aluno 7', 'aluno7@email.com', 4);
INSERT INTO alunos (nome, email, curso_id) VALUES ('Aluno 8', 'aluno8@email.com', 4);
INSERT INTO alunos (nome, email, curso_id) VALUES ('Aluno 9', 'aluno9@email.com', 5);
INSERT INTO alunos (nome, email, curso_id) VALUES ('Aluno 10', 'aluno10@email.com', 5);
*/