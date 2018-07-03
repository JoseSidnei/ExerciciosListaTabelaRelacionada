DROP TABLE contas_a_receber;
DROP TABLE contas_a_pagar;
DROP TABLE emails;
DROP TABLE celulares;
DROP TABLE clientes;

CREATE TABLE clientes(
	id INT IDENTITY(1,1),
	nome TEXT NOT NULL,
	sexo CHAR(1)NOT NULL
);

CREATE TABLE celulares(
	id INT IDENTITY(1,1) NOT NULL,
	id_cliente INT NOT NULL,
	valor TEXT NOT NULL,
	ativo BIT DEFAULT 1
);

CREATE TABLE emails(
	id INT IDENTITY(1,1) NOT NULL,
	id_cliente INT NOT NULL,
	valor TEXT NOT NULL,
	ativo BIT DEFAULT 1,
	FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

CREATE TABLE contas_a_pagar(
	id INT iDENTITY (1,1) NOT NULL,
	id_cliente INT NOT NULL,
	valor REAL NOT NULL,
	data_vencimento DATE NOT NULL,
	valor_pago REAL DEFAULT 0,
	STATUS TEXT DEFAULT 'Pagar',
	ativo BIT DEFAULT 1,
	FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

CREATE TABLE contas_a_receber(
	id INT IDENTITY(1,1) NOT NULL,
	id_cliente INT NOT NULL,
	valor_a_receber REAL,
	data_para_pagamento DATE,
	STATUS TEXT DEFAULT 'Receber',
	ativo BIT DEFAULT 1,
	FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

