CREATE TABLE clientes(
	id INT IDENTITY(1,1) PRIMARY KEY,
	nome VARCHAR(200) NOT NULL,
	sexo CHAR(1) NOT NULL
);

CREATE TABLE calulares(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_cliente INT NOT NULL,
	valor DECIMAL(20,2),
	ativo BIT DEFAULT 1,
	FOREIGN KEY(id_cliente) REFERENCES clientes(id)
);

CREATE TABLE emails(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_cliente INT NOT NULL,
	valor DECIMAL(20,2) NOT NULL,
	ativo BIT DEFAULT 1,
	FOREIGN KEY(id_cliente) REFERENCES clientes(id)
);

CREATE TABLE contas_a_pagar(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_cliente INT NOT NULL,
	valor REAL,
	data_vencimento DATE,
	valor_pago REAL DEFAULT 0,
	status VARCHAR(100) DEFAULT 'pagar',
	ativo BIT DEFAULT 1, 
	FOREIGN KEY(id_cliente) REFERENCES clientes(id)
);

CREATE TABLE contas_a_receber(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_cliente INT NOT NULL,

	FOREIGN KEY(id_cliente) REFERENCES clientes(id)
);