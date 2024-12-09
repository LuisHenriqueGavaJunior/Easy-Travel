CREATE DATABASE EasyTravelDB;
GO
USE EasyTravelDB;

CREATE TABLE Empresas (
	EmpresaID INT IDENTITY(1,1) PRIMARY KEY,
	NomeCurto VARCHAR(20) NOT NULL,
	NomeCompleto VARCHAR(40)
);

CREATE TABLE Usuarios (
    UsuarioID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Senha VARCHAR(20) NOT NULL,
	Empresa INT,
    RE VARCHAR(20) UNIQUE,
    NivelUsuario VARCHAR(20) NOT NULL, 

	FOREIGN KEY (Empresa) REFERENCES Empresas(EmpresaID)
);

CREATE TABLE GrupoDespesa (
    GrupoID INT IDENTITY(1,1) PRIMARY KEY,
    Descricao VARCHAR(20) NOT NULL
);

CREATE TABLE TipoDespesa (
    TipoID INT IDENTITY(1,1) PRIMARY KEY,
	GrupoDespesaID INT,
    Descricao VARCHAR(20) NOT NULL,
	FOREIGN KEY (GrupoDespesaID) REFERENCES GrupoDespesa(GrupoID)
);

CREATE TABLE Viagens (
    ViagemID INT IDENTITY(1,1) PRIMARY KEY,
    Descricao VARCHAR(30) NOT NULL,
    UsuarioID INT NOT NULL,
	EmpresaID INT NOT NULL,
	SaldoInicial DECIMAL (8, 2) NOT NULL,
	SaldoAtual DECIMAL (8, 2) NOT NULL,
	DataInicio DATE NOT NULL,
	DataFim DATE NOT NULL,
	Status VARCHAR(20) NOT NULL,

	FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
	FOREIGN KEY (EmpresaID) REFERENCES Empresas(EmpresaID)
);

CREATE TABLE Despesas (
    DespesaID INT IDENTITY(1,1) PRIMARY KEY,
    ViagemID INT NOT NULL,
    Descricao VARCHAR(30),
    GrupoDespesaID INT,
    TipoDespesaID INT,
    Valor DECIMAL(8, 2) NOT NULL,
    DataDespesa DATE NOT NULL,
    ImagemURL VARCHAR(255),
    Observacao VARCHAR(200),
    DataRegistro DATETIME DEFAULT GETDATE() NOT NULL,
	Aprovada BIT DEFAULT 0 NOT NULL,

    FOREIGN KEY (ViagemID) REFERENCES Viagens(ViagemID),
    FOREIGN KEY (GrupoDespesaID) REFERENCES GrupoDespesa(GrupoID),
    FOREIGN KEY (TipoDespesaID) REFERENCES TipoDespesa(TipoID)
);

INSERT INTO Empresas (NomeCurto, NomeCompleto)
VALUES 
    ('Mc Donalds', 'McDonalds Corporation'),
    ('Easy Travel', 'Easy Travel Company'),
    ('EXP', 'Exp Dom Enterprise');

INSERT INTO Usuarios(Nome, Senha, Empresa, RE, NivelUsuario)
VALUES 
    ('Juninho Silva', 'EstCro22', 1, '70425', 'Operador'),
    ('Saraiva Sírio', '11MenMo24', 1, '05328', 'Operador'),
    ('Elias Elizeu', 'Brn2Be', 3, '38340', 'Liberador'),
	('Jeremias', 'Brn2Be', 2, '86910', 'Aprovador');

INSERT INTO GrupoDespesa (Descricao)
VALUES 
    ('Transporte'),
	('Alimentação'),
	('Hospedagem');

INSERT INTO TipoDespesa(GrupoDespesaID, Descricao)
VALUES 
    (1, 'Ônibus'),
	(1, 'Uber'),
	(1, 'Pedágio'),
	(2, 'Almoço'),
	(2, 'Café da manhã'),
	(3, 'Hotel'),
	(3, 'Pousada');

INSERT INTO Viagens (Descricao, UsuarioID, EmpresaID, SaldoInicial, SaldoAtual, DataInicio, DataFim, Status)
VALUES 
    ('Viagem à Pompeia', 1, 2, 3000.00, 2108.70, '2024-10-29', '2024-11-01', 'Finalizado'),
	('Viagem a Games Con', 2, 2, 4500.00, 4500.00, '2024-12-01', '2024-12-05', 'Liberado'),
	('Viagem ao MC Donalds', 1, 2, 6000.99, 4500.10, '2024-11-23', '2024-12-05', 'Em andamento');

INSERT INTO Despesas (ViagemID, Descricao, GrupoDespesaID, TipoDespesaID, Valor, DataDespesa, ImagemURL, Observacao, Aprovada)
VALUES 
    (1, 'Passagem de ônibus', 1, 1, 40.00, '2024-10-29', 'aHR0cDovLzEyNy4wLjAuMTo1NTAwL0Zyb250ZW5kL2Fzc2V0cy9Ob3RhRmlzY2FsLnBuZw==', '', 0),
	(1, 'Almoço no Shopping', 2, 4, 35.00, '2024-10-29', 'aHR0cDovLzEyNy4wLjAuMTo1NTAwL0Zyb250ZW5kL2Fzc2V0cy9ub3RhMS5wbmc=', '', 0),
	(1, 'Hotel Santa Mônica', 3, 6, 80.00, '2024-10-29', 'aHR0cDovLzEyNy4wLjAuMTorDSIDOIjiiuadsiduIDS123y5wbmc=', '2 dias', 0);