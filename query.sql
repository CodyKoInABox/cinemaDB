SHOW TABLES

-- @BLOCK
SELECT * FROM ator

-- @BLOCK
SELECT * FROM filme

-- @BLOCK
SELECT * FROM elenco

-- @BLOCK
SELECT tituloP AS Titulo, duracao AS Duracao
FROM filme

-- @BLOCK
SELECT cod_ator AS Codigo, nome AS Nome
FROM ator AS a
WHERE a.idade > 35 && a.idade < 40

-- @BLOCK
SELECT DISTINCT nacionalidade AS Nacionalidade
FROM ator

-- @BLOCK
SELECT
nome AS Nome,
nacionalidade AS Nacionalidade,
idade AS Idade
FROM ator

-- @BLOCK
SELECT tituloO AS Titulo
FROM filme AS f INNER JOIN elenco AS e
ON f.cod_filme = e.cod_filme
