DROP TABLE carros;
DROP TABLE pessoas;

CREATE TABLE pessoas(
	id INT IDENTITY (1,1),
	nome VARCHAR(100),
	cpf VARCHAR(11),
	PRIMARY KEY (id)

);

CREATE TABLE carros(
	id INT IDENTITY (1,1) PRIMARY KEY,
	id_pessoa INT,
	marca VARCHAR(100) NOT NULL,
	modelo VARCHAR(150) NOT NULL,
	ano_lamcamento INT NOT NULL,
	ano_fabricacao INT NOT NULL,
	motor VARCHAR(150),
	cor VARCHAR(150),
	preco DECIMAL (7,2),
	FOREIGN KEY (id_pessoa) REFERENCES pessoas(id)
);

INSERT INTO pessoas (nome, cpf) VALUES
('Abraão Nobre', '95232829483'),
('Severino Braga', '87677033300'),
('Samuel Faria', '98927203429'),
('Florêncio Robalo', '36263517425');

INSERT INTO carros (id_pessoa, marca, modelo, ano_lamcamento, ano_fabricacao, motor, cor, preco) VALUES
((SELECT id FROM pessoas WHERE nome = 'Abraão Nobre'), 
'Volkswagen', 'Gol', 2010, 2009, '8v Power Flex', 'Vermelho', 18000.00),

((SELECT id FROM pessoas WHERE nome = 'Severino Braga'),
'Fiat', 'Brava', 2000, 1999, 'SX 1.6 16V', 'Cinza', 9000.00),

((SELECT id FROM pessoas WHERE nome = 'Samuel Faria'), 'Renault', 'Clio', 1997, 1996, '1.0 8v', 'Verde', 5500.00),

((SELECT id FROM pessoas WHERE nome = 'Florêncio Robalo'), 'Volkswagen', 'Golf', 1994, 1994, '2.0 120cv', 'Azul', 17000.00);





SELECT * FROM pessoas;
SELECT * FROM carros;

