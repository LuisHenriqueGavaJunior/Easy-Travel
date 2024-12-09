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
	T.Descricao AS TipoDespesa,
	D.Aprovada
FROM Despesas D
JOIN Viagens V ON D.ViagemID = V.ViagemID
JOIN GrupoDespesa G ON GrupoID = D.GrupoDespesaID
JOIN TipoDespesa T ON TipoID = D.TipoDespesaID
WHERE V.ViagemID = 1



UPDATE Despesas
SET Aprovada = 1
WHERE DespesaID IN (1, 3);



UPDATE Viagens
SET Status = 'Aprovado'
WHERE ViagemID = 3;