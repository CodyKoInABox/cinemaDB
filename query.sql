

--@block
SELECT * FROM filme;

--@block EXERCICIO 1
SELECT tituloP AS Titulo, duracao AS Duracao
FROM filme;

--@block
SELECT * from ator;

--@block EXERCICIO 2
SELECT cod_ator AS Codigo, nome AS Nome
FROM ator
WHERE idade >= 35 AND idade <=40;

--@block EXERCICIO 3
SELECT DISTINCT nacionalidade AS Nacionalidade
FROM ator;

--@block EXERCICIO 4
SELECT nome AS Nome, idade AS Idade, nacionalidade AS Nacionalidade
FROM ator;

--@block
SELECT * from elenco;

--@block EXERCICIO 5
SELECT tituloO AS Nome FROM filme f INNER JOIN elenco e
ON f.cod_filme = e.cod_filme
INNER JOIN ator a
ON e.cod_ator = a.cod_ator
WHERE a.nome = "jim carrey";
