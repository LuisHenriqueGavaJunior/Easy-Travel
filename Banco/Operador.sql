USE EasyTravel;

SELECT 
    V.ViagemID,
    V.UsuarioID,
    U.Nome AS NomeUsuario,
    V.Descricao,
    V.SaldoAtual,
    V.DataFim,
    V.Status
FROM Viagens V
JOIN Usuarios U ON V.UsuarioID = U.UsuarioID
WHERE V.UsuarioID = 1;



SELECT 
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
JOIN Empresas E ON V.EmpresaID = E.EmpresaID
WHERE V.UsuarioID = 1;
SELECT 
	D.ViagemID,
	D.Descricao,
	D.GrupoDespesaID,
	D.TipoDespesaID,
	D.Valor,
	G.Descricao AS GrupoDespesa,
	T.Descricao AS TipoDespesa
FROM Despesas D
JOIN Viagens V ON D.ViagemID = V.ViagemID
JOIN GrupoDespesa G ON GrupoID = D.GrupoDespesaID
JOIN TipoDespesa T ON TipoID = D.TipoDespesaID
WHERE V.ViagemID = 1



INSERT INTO Despesas (ViagemID, Descricao, GrupoDespesaID, TipoDespesaID, Valor, DataDespesa, ImagemURL, Observacao, Aprovada)
VALUES (1, 'Coxinha de carne', 1, 2, 15.50, '2024-12-02', 'aHR0cDovLzEyNy4wLjAuMTo1NTAwL0Zyb250ZW5kL2Fzc2V0cy91YmVyLnBuZw==', 'Viagem curta', 1);


UPDATE Despesas SET 
    Descricao = 'Corrida ao parque', 
    Valor = 50.00, 
    Observacao = 'Viagem de uber direta para o evento'
WHERE DespesaID = 4; 


DELETE FROM Despesas
WHERE DespesaID = 4;



UPDATE Viagens
SET Status = 'Finalizado'
WHERE ViagemID = 3;