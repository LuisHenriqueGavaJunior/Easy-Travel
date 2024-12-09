USE EasyTravelTESTE1;

SELECT DISTINCT
    V.ViagemID,
    V.UsuarioID,
    U.Nome AS NomeUsuario,
    E.NomeCurto AS Empresa,
    V.Descricao,
    V.SaldoInicial,
    V.SaldoAtual,
    V.DataInicio,
    V.DataFim,
    V.Status
FROM Viagens V
JOIN Usuarios U ON V.UsuarioID = U.UsuarioID
JOIN Empresas E ON V.EmpresaID = E.EmpresaID;



--Empresas
SELECT 
    NomeCurto,
    NomeCompleto
FROM Empresas;


INSERT INTO Empresas (NomeCurto, NomeCompleto)
VALUES ('Uber', 'Uber Technologies, Inc.');

INSERT INTO Empresas (NomeCurto, NomeCompleto)
VALUES ('Google', 'Google LLC');


UPDATE Empresas
SET NomeCompleto = 'Uber Technologies, Inc. - Mobility'
WHERE EmpresaID = 4;


DELETE FROM Empresas
WHERE EmpresaID = 5;



--Usuários
SELECT 
    U.Nome AS NomeUsuario,
    U.NivelUsuario AS Funcao,
    E.NomeCurto AS Empresa
FROM Usuarios U
JOIN Empresas E ON U.Empresa = E.EmpresaID;


INSERT INTO Usuarios (Nome, Senha, Empresa, RE, NivelUsuario)
VALUES ('Levi', 'Senha123', 1, '98765', 'Operador');

INSERT INTO Usuarios (Nome, Senha, Empresa, RE, NivelUsuario)
VALUES ('Marçal pescador', 'Senha456', 2, '54321', 'Liberador');


UPDATE Usuarios
SET NivelUsuario = 'Aprovador'
WHERE UsuarioID = 6;


DELETE FROM Usuarios
WHERE UsuarioID = 5;



--Grupo Despesa
SELECT 
    Descricao
FROM GrupoDespesa;


INSERT INTO GrupoDespesa (Descricao)
VALUES ('Comunicação');

INSERT INTO GrupoDespesa (Descricao)
VALUES ('Vestuário');


UPDATE GrupoDespesa
SET Descricao = 'Comunicação'
WHERE GrupoID = 4;


DELETE FROM GrupoDespesa
WHERE GrupoID = 5;



--Tipo Despesa
SELECT 
    T.TipoID AS TipoID,
    G.Descricao AS GrupoDespesa,
    T.Descricao AS TipoDespesa
FROM GrupoDespesa G
JOIN TipoDespesa T ON G.GrupoID = T.GrupoDespesaID
WHERE G.GrupoID = 1;


INSERT INTO TipoDespesa (GrupoDespesaID, Descricao)
VALUES (4, 'Telefonia');

INSERT INTO TipoDespesa (GrupoDespesaID, Descricao)
VALUES (4, 'Internet');


UPDATE TipoDespesa
SET Descricao = 'Serviços Telefônicos'
WHERE TipoID = 8;


DELETE FROM TipoDespesa
WHERE TipoID = 9;