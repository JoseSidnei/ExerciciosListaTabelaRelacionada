DROP TABLE celulares;
DROP TABLE emails;
DROP TABLE contas_a_pagar;
DROP TABLE contas_a_receber;
DROP TABLE clientes;

CREATE TABLE clientes(
	id INT IDENTITY(1,1) PRIMARY KEY,
	nome VARCHAR(200) NOT NULL,
	sexo CHAR(1) NOT NULL
);

CREATE TABLE celulares(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_cliente INT NOT NULL,
	valor VARCHAR(100),
	ativo BIT DEFAULT 1,
	FOREIGN KEY(id_cliente) REFERENCES clientes(id)
);

CREATE TABLE emails(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_cliente INT NOT NULL,
	valor VARCHAR(250) NOT NULL,
	ativo BIT DEFAULT 1,
	FOREIGN KEY(id_cliente) REFERENCES clientes(id)
);

CREATE TABLE contas_a_pagar(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_cliente INT NOT NULL,
	valor REAL,
	data_vencimento DATE,
	valor_pago REAL DEFAULT 0,
	status_pagar VARCHAR(100) DEFAULT 'pagar',
	ativo BIT DEFAULT 1, 
	FOREIGN KEY(id_cliente) REFERENCES clientes(id)
);

CREATE TABLE contas_a_receber(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_cliente INT NOT NULL,
	valor_receber REAL NOT NULL,
	data_para_pagamentos DATE NOT NULL,
	valor_recebido REAL DEFAULT 0,
	data_recebimento DATE,
	status_receber VARCHAR(100) DEFAULT 'receber',
	FOREIGN KEY(id_cliente) REFERENCES clientes(id)
);

INSERT INTO clientes(nome, sexo) VALUES
('Germana', 'F'),
('Salvador', 'M'),
('Úrsula', 'F'),
('Aluísio', 'M');

INSERT INTO celulares(id_cliente, valor) VALUES
(1, '(79) 99973-5114'),
(2, '(27) 98390-6475'),
(1, '(55) 98587-4266'),
(4, '(14) 98387-5333'),
(3, '(92) 98983-2809'),
(4, '(55) 98616-2303');

INSERT INTO emails(id_cliente, valor) VALUES
(2, 'bernardodiegoalves-77@vianetfone.com.br'),
(1, 'a68341ef3b@emailna.life'),
(3, 'zpgkmkem@boximail.com'),
(1, 'ger@bol.com'),
(2, 'gabrieldiegofernandodarocha_@uoul.com'),
(3, 'iancauearaujo_@10clic.com.br'),
(1, 'germana@gmail.com'),
(2, 'salvador@hotmail.com');

INSERT INTO contas_a_pagar(id_cliente,  data_vencimento, valor) VALUES
(1, '2018-06-15', 500.00),
(2, '2017-06-29', 320.50),
(3, '2018-06-07', 450.00),
(4, '2018-08-27', 1300.00),
(4, '2018-10-10', 777.00),
(3, '2018-10-14', 8001.00),
(2, '2018-11-25', 232.12),
(3, '2018-09-13', 104.23),
(1, '2018-07-17', 65.00),
(4, '2018-10-06', 98.83),
(2, '2018-12-12', 12.17),
(2, '2018-12-23', 6.25);

   
INSERT INTO contas_a_receber (id_cliente, data_para_pagamentos, valor_receber) VALUES
(3, '2018-12-08', 78.97),
(2, '2018-11-24', 700.00),
(1, '2018-10-09', 45.87),
(1, '2019-01-04', 39.50),
(4, '2018-11-30', 123.45),
(3, '2018-09-07', 987.65),
(2, '2018-07-06', 456.00);

-- E-mails
SELECT clientes.nome 'Cliente', emails.valor 'E-mail' FROM emails
JOIN clientes ON(clientes.id = emails.id_cliente);

SELECT clientes.nome 'Cliente', emails.valor 'E-mail' FROM emails
JOIN clientes ON(clientes.id = emails.id_cliente)
ORDER BY clientes.nome, emails.valor;

/*SELECT clientes.nome 'Cliente', emails.valor 'E-mail' FROM emails
JOIN clientes ON(clientes.id = emails.id_cliente)
 WHERE LEN(emails.valor) = (SELECT MAX(LEN(emails.valor)));  Tem que fazer ainda */
 
 -- Celulares
 
 SELECT clientes.nome 'Cliente', celulares.valor 'Celular' FROM celulares
 JOIN clientes ON(clientes.id = celulares.id_cliente);

 SELECT clientes.nome 'Cliente', celulares.valor 'Celular' FROM celulares
 JOIN  clientes ON(clientes.id = celulares.id_cliente)
 WHERE ativo = 1;

 -- Contas a Pagar

/* UPDATE contas_a_pagar SET valor_pago = 100.00, status_pagar = 'Pago'
WHERE id_cliente = (SELECT id FROM clientes WHERE nome LIKE 'Salvador%'); */

/* UPDATE contas_a_pagar SET valor_pago = 700.00, status_pagar = 'Pago'
WHERE id_cliente = (SELECT id FROM clientes WHERE nome LIKE 'Salvador%' AND valor = 700.00); */



SELECT * FROM contas_a_pagar;
 