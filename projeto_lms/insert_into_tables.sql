USE lms;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------- --


-- Tabela Usuário
INSERT INTO 
	usuario (login, senha, data_expiracao) 
VALUES
	('joao123', SHA2('senha123', 256), DEFAULT),
	('maria456', SHA2('senhasegura', 256), '2024-02-28'),
	('carlos789', SHA2('minhasenha', 256), '2024-02-25'),
	('ana321', SHA2('senha12345', 256), DEFAULT),
	('pedro654', SHA2('senha123456', 256), '2024-02-20'),
	('juliana987', SHA2('senhasecreta', 256), '2024-02-22'),
	('rafael111', SHA2('minhasenhasegura', 256), DEFAULT),
	('sandra222', SHA2('outrasenha', 256), '2024-03-10'),
	('lucas333', SHA2('senhadificil', 256), DEFAULT),
	('carolina444', SHA2('senha123456789', 256), '2024-02-18'),
	('fernando555', SHA2('senhacomplexa', 256), '2024-02-23'),
	('patricia666', SHA2('outrasenha123', 256), '2024-02-19'),
	('gabriel777', SHA2('senhasegurissima', 256), DEFAULT),
	('marcos888', SHA2('senhasecreta123', 256), DEFAULT),
	('sabrina999', SHA2('senhademaisumavez', 256), '2024-03-02'),
	('jose101', SHA2('outrachave', 256), '2024-03-03'),
	('ana102', SHA2('senhadupla', 256), '2024-03-04'),
	('rodrigo103', SHA2('senhaespecial', 256), '2024-03-07'),
	('elisa104', SHA2('outrasenhasegura', 256), DEFAULT),
	('leonardo105', SHA2('senhaultimate', 256), '2024-03-09');


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------- --


-- Tabela Coordenador
INSERT INTO 
	coordenador (id_usuario, nome, email, celular) 
VALUES
	(1, 'João Silva', 'joao.silva@outlook.com', '11 98765-4321'),
	(2, 'Maria Oliveira', 'maria.oliveira@gmail.com', '11 88888-7777'),
	(3, 'Carlos Santos', 'carlos.santos@hotmail.com', '11 77777-6666'),
	(4, 'Ana Souza', 'ana.souza@outlook.com', '11 66666-5555'),
	(5, 'Pedro Pereira', 'pedro.pereira@gmail.com', '11 55555-4444'),
	(6, 'Juliana Lima', 'juliana.lima@hotmail.com', '11 44444-3333'),
	(7, 'Rafael Costa', 'rafael.costa@outlook.com', '11 33333-2222'),
	(8, 'Sandra Almeida', 'sandra.almeida@gmail.com', '11 22222-1111'),
	(9, 'Lucas Martins', 'lucas.martins@hotmail.com', '11 11111-0000'),
	(10, 'Carolina Barbosa', 'carolina.barbosa@gmail.com', '11 99999-8888');


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------- --


-- Tabela Aluno
INSERT INTO 
	aluno (id_usuario, nome, email, celular, ra, foto) 
VALUES
	(11, 'Luciana Silva', 'luciana.silva@gmail.com', '11 12345-6789', '2023101', 'luciana.jpg'),
	(12, 'Gabriel Oliveira', 'gabriel.oliveira@hotmail.com', '11 98765-4321', '2023102', 'gabriel.jpg'),
	(13, 'Carla Santos', 'carla.santos@outlook.com', '11 87654-3210', '2023103', 'carla.jpg'),
	(14, 'Pedro Souza', 'pedro.souza@gmail.com', '11 23456-7890', '2023104', 'pedro.jpg'),
	(15, 'Mariana Pereira', 'mariana.pereira@hotmail.com', '11 65432-1098', '2023105', 'mariana.jpg');


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------- --


-- Tabela Professor
INSERT INTO 
	professor (id_usuario, nome, email, celular, apelido) 
VALUES
	(16, 'Fernanda Silva', 'fernanda.silva@gmail.com', '11 12345-6789', 'Fer'),
	(17, 'Ricardo Oliveira', 'ricardo.oliveira@hotmail.com', '11 98765-4321', 'Rick'),
	(18, 'Camila Santos', 'camila.santos@outlook.com', '11 87654-3210', 'Cami'),
	(19, 'Daniel Souza', 'daniel.souza@gmail.com', '11 23456-7890', 'Dan'),
	(20, 'Isabela Pereira', 'isabela.pereira@hotmail.com', '11 65432-1098', 'Bela');


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------- --