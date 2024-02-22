CREATE DATABASE lms;
USE lms;
-- DROP DATABASE lms;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------- --


-- Tabela Usuario
CREATE TABLE IF NOT EXISTS usuario(
	id INT NOT NULL AUTO_INCREMENT,
	login VARCHAR(30) NOT NULL,
	senha VARCHAR(100) NOT NULL,
	data_expiracao DATE NOT NULL DEFAULT '1900-01-01',
    
    -- CONSTRAINTS
    CONSTRAINT PK_usuario PRIMARY KEY(id),
    CONSTRAINT UQ_login UNIQUE(login)
);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------- --


-- Tabela Coordenador
CREATE TABLE IF NOT EXISTS coordenador(
    id SMALLINT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    celular CHAR(13) NOT NULL,
    
    -- CONSTRAINTS
    CONSTRAINT PK_coordenador PRIMARY KEY(id),
    CONSTRAINT UQ_coordenador_email UNIQUE(email),
    CONSTRAINT UQ_coordenador_celular UNIQUE(celular),
    CONSTRAINT FK_id_usuario_coordenador FOREIGN KEY(id_usuario) REFERENCES usuario(id)
);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------- --


-- Tabela Aluno
CREATE TABLE IF NOT EXISTS aluno(
    id INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    celular CHAR(13) NOT NULL,
    ra CHAR(7) NOT NULL,
    foto VARCHAR(255) DEFAULT NULL,
    
    -- CONSTRAINTS
    CONSTRAINT PK_aluno PRIMARY KEY(id),
    CONSTRAINT UQ_aluno_email UNIQUE(email),
    CONSTRAINT UQ_aluno_celular UNIQUE(celular),
    CONSTRAINT UQ_aluno_ra UNIQUE(ra),
    CONSTRAINT FK_id_usuario_aluno FOREIGN KEY(id_usuario) REFERENCES usuario(id)
);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------- --


-- Tabela Professor
CREATE TABLE IF NOT EXISTS professor(
    id SMALLINT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    celular VARCHAR(100) NOT NULL,
    apelido VARCHAR(50) NOT NULL,
    
    -- CONSTRAINTS
    CONSTRAINT PK_professor PRIMARY KEY(id),
    CONSTRAINT UQ_professor_email UNIQUE(email),
    CONSTRAINT UQ_professor_celular UNIQUE(celular),
    CONSTRAINT FK_id_usuario_professor FOREIGN KEY(id_usuario) REFERENCES usuario(id)
);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------- --


-- Tabela Disciplina
CREATE TABLE IF NOT EXISTS disciplina(
    id SMALLINT NOT NULL AUTO_INCREMENT,
    id_coordenador SMALLINT NOT NULL,
    nome VARCHAR(100) NOT NULL,
	`data` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `status` ENUM('Aberta','Fechada') NOT NULL DEFAULT 'Aberta',
    plano_ensino VARCHAR(1000) NOT NULL,
    carga_horaria TINYINT NOT NULL,
    competencias VARCHAR(1000) NOT NULL,
    habilidades VARCHAR(1000) NOT NULL,
    ementa VARCHAR(1000) NOT NULL,
    conteudo_programatico VARCHAR(1000) NOT NULL,
    bibliografia_basica VARCHAR(500) NOT NULL,
    bibliografia_complementar VARCHAR(1000) DEFAULT NULL,
    percentual_pratico TINYINT NOT NULL,
    percentual_teorico TINYINT NOT NULL,
    
    -- CONSTRAINTS
    CONSTRAINT PK_disciplina PRIMARY KEY(id),
    CONSTRAINT UQ_disciplina_nome UNIQUE(nome),
    CONSTRAINT FK_id_coordenador_disciplina FOREIGN KEY(id_coordenador) REFERENCES coordenador(id),
    CONSTRAINT CK_disciplina_carga_horaria CHECK (carga_horaria IN (40, 80)),
    CONSTRAINT CK_disciplina_percentual_pratico CHECK (percentual_pratico BETWEEN 0 AND 100),
    CONSTRAINT CK_disciplina_percentual_teorico CHECK (percentual_teorico BETWEEN 0 AND 100),
    CONSTRAINT CK_disciplina_percentual_total CHECK ((percentual_teorico + percentual_pratico) = 100)
);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------- --


-- Tabela Curso
CREATE TABLE IF NOT EXISTS curso(
	id SMALLINT AUTO_INCREMENT,
    nome VARCHAR(50),
    
    -- Constraints
    CONSTRAINT PK_curso PRIMARY KEY(id),
    CONSTRAINT UQ_curso_nome UNIQUE(nome)
);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------- --


-- Tabela Disciplina Ofertada
CREATE TABLE IF NOT EXISTS disciplina_ofertada(
    id int NOT NULL AUTO_INCREMENT,
    id_coordenador SMALLINT NOT NULL,
    id_disciplina SMALLINT NOT NULL,
    id_curso SMALLINT NOT NULL,
    id_professor SMALLINT,
    data_inicio_matricula DATE,
    data_fim_matricula DATE,
    ano SMALLINT NOT NULL,
    semestre TINYINT NOT NULL,
    turma CHAR(1) NOT NULL,
    metodologia VARCHAR(1000),
    recursos VARCHAR(1000),
    criterio_avaliacao VARCHAR(100),
    plano_aulas VARCHAR(1000),
    
    -- CONSTRAINTS
    CONSTRAINT PK_disciplina_ofertada PRIMARY KEY(id),
    CONSTRAINT UQ_disciplina_ofertada UNIQUE (id_disciplina, id_curso, ano, semestre, turma),
    CONSTRAINT FK_disciplina_ofertada_id_coordenador FOREIGN KEY (id_coordenador) REFERENCES coordenador(id),
    CONSTRAINT FK_disciplina_ofertada_id_curso FOREIGN KEY (id_curso) REFERENCES curso(id),
    CONSTRAINT FK_disciplina_ofertada_id_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina(id),
    CONSTRAINT FK_disciplina_ofertada_id_professor FOREIGN KEY (id_professor) REFERENCES professor(id),
    CONSTRAINT CK_disciplina_ofertada_ano CHECK (ano BETWEEN 1900 AND 2100),
    CONSTRAINT CK_disciplina_ofertada_semestre CHECK (semestre IN (1, 2)),
    CONSTRAINT CK_disciplina_ofertada_turma CHECK (turma BETWEEN 'A' AND 'Z')
);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------- --


-- Tabela Solitacao Matricula
CREATE TABLE IF NOT EXISTS solicitacao_matricula(
	id INT NOT NULL AUTO_INCREMENT,
	id_aluno INT NOT NULL,
	id_coordenador SMALLINT NOT NULL,
	id_disciplina_ofertada INT NOT NULL,
	data_solicitacao DATE NOT NULL,
	`status` ENUM('Solicitada', 'Aprovada', 'Rejeitada', 'Cancelada') NOT NULL DEFAULT 'Solicitada',
	PRIMARY KEY (`id`),
	CONSTRAINT `FK_solicitacao_matricula_aluno` FOREIGN KEY(id_aluno) REFERENCES aluno(id),
	CONSTRAINT `FK_solicitacao_matricula_coordenador` FOREIGN KEY(id_coordenador) REFERENCES coordenador(id),
	CONSTRAINT `FK_solicitacao_matricula_disciplina_ofertada` FOREIGN KEY(id_disciplina_ofertada) REFERENCES disciplina_ofertada(id)
);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------- --


-- Tabela Atividade
CREATE TABLE IF NOT EXISTS `atividade` (
	id INT NOT NULL AUTO_INCREMENT,
	id_professor SMALLINT NOT NULL,
	titulo VARCHAR(50) NOT NULL,
	descricao VARCHAR(1000) DEFAULT NULL,
	tipo ENUM('Resposta Aberta', 'Teste') NOT NULL,
	extras VARCHAR(255) DEFAULT NULL,

	-- CONSTRAINTS
	CONSTRAINT PK_atividade PRIMARY KEY (id),
	CONSTRAINT UQ_atividade_titulo UNIQUE (titulo),
	CONSTRAINT FK_id_professor_atividade FOREIGN KEY (id_professor) REFERENCES professor(id)
);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------- --


-- Tabela Atividade Vinculada
CREATE TABLE IF NOT EXISTS atividade_vinculada(
	id INT NOT NULL AUTO_INCREMENT,
	id_atividade INT NOT NULL,
	id_professor SMALLINT NOT NULL,
	id_disciplina_ofertada INT NOT NULL,
	rotulo CHAR(3) NOT NULL,
	`status` ENUM('Disponibilizada', 'Aberta', 'Fechada', 'Encerrada', 'Prorrogada') NOT NULL,
	data_inicio_respostas DATETIME NOT NULL,
	data_fim_respostas DATETIME NOT NULL,

	-- CONSTRAINTS
	CONSTRAINT PK_atividade_vinculada PRIMARY KEY (id),
	CONSTRAINT UQ_rotulo_id_atividade_id_disciplina_ofertada UNIQUE (rotulo, id_atividade, id_disciplina_ofertada),
	CONSTRAINT FK_id_atividade_atividade_vinculada FOREIGN KEY (id_atividade) REFERENCES atividade (id),
	CONSTRAINT FK_id_professor_atividade_vinculada FOREIGN KEY (id_professor) REFERENCES professor (id),
	CONSTRAINT FK_id_disciplina_ofertada_atividade_vinculada FOREIGN KEY (id_disciplina_ofertada) REFERENCES disciplina_ofertada (id)
);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------- --


-- Tabela Entrega
CREATE TABLE IF NOT EXISTS entrega (
  id INT NOT NULL AUTO_INCREMENT,
  id_aluno INT NOT NULL,
  id_atividade_vinculada INT NOT NULL,
  titulo VARCHAR(100) NOT NULL,
  resposta VARCHAR(3000) NOT NULL,
  data_entrega DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status ENUM('Entregue','Corrigido') NOT NULL DEFAULT 'Entregue',
  id_professor SMALLINT DEFAULT NULL,
  nota DECIMAL(4,2) DEFAULT NULL,
  data_avaliacao DATETIME DEFAULT NULL,
  obs VARCHAR(1000) DEFAULT NULL,

  -- Constraints
  CONSTRAINT PK_entrega PRIMARY KEY (id),
  CONSTRAINT UQ_entrega_id_aluno_id_atividade_vinculada UNIQUE (id_aluno, id_atividade_vinculada),
  CONSTRAINT FK_entrega_id_atividade_vinculada FOREIGN KEY (id_atividade_vinculada) REFERENCES atividade_vinculada (id),
  CONSTRAINT FK_entrega_id_professor FOREIGN KEY (id_professor) REFERENCES professor (id)
);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------- --


-- Tabela Mensagem
CREATE TABLE IF NOT EXISTS mensagem (
	id INT NOT NULL AUTO_INCREMENT,
	id_aluno INT NOT NULL,
	id_professor SMALLINT NOT NULL,
	assunto VARCHAR(100) NOT NULL,
	referencia VARCHAR(100) NOT NULL,
	conteudo VARCHAR(100) NOT NULL,
	`status` ENUM('Enviado', 'Lido', 'Respondido') NOT NULL DEFAULT 'Enviado',
	data_envio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	data_resposta DATETIME DEFAULT NULL,
	resposta VARCHAR(1000) DEFAULT NULL,

	-- Constraints
	CONSTRAINT PK_mensagem PRIMARY KEY (id),
	CONSTRAINT FK_id_aluno_mensagem FOREIGN KEY (id_aluno) REFERENCES aluno (id),
	CONSTRAINT FK_id_professor_mensagem FOREIGN KEY (id_professor) REFERENCES professor (id)
);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------- --