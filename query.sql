--@block
SELECT * FROM filme;

--@block
SELECT * FROM elenco;

--@block
SELECT * FROM ator;

--@block
SELECT * FROM cinema;

--@block
SELECT * FROM sessao;

--@block EXERCICIO 1
SELECT tituloP AS Titulo, duracao AS Duracao
FROM filme;


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

--@block EXERCICIO 5
SELECT tituloO AS Nome FROM filme f INNER JOIN elenco e
ON f.cod_filme = e.cod_filme
INNER JOIN ator a
ON e.cod_ator = a.cod_ator
WHERE a.nome = "jim carrey";

--@block EXERCICIO 6
SELECT nome AS Nome
FROM ator a
LEFT JOIN elenco e
ON a.cod_ator = e.cod_ator
WHERE e.cod_ator IS NULL;

--@block Query para que o exericio 6 retorne algo (por padrao nesse banco todos os atores participam de algum filme)
INSERT INTO ator VALUES(
    12,
    61, 
    "thomas cruise",
    "americano"
);

--@block EXERCICIO 7
SELECT f.cod_filme AS Codigo, f.tituloP AS Nome
FROM filme f
INNER JOIN elenco e
ON f.cod_filme = e.cod_filme
LEFT JOIN ator a 
ON e.cod_ator = a.cod_ator
WHERE a.nome != "tom hanks";

--@block EXERCICIO 8
SELECT COUNT(e.cod_ator) AS Qtd_Filmes
FROM elenco e
INNER JOIN ator a
ON e.cod_ator = a.cod_ator
WHERE a.nome = "george clooney";

--@block EXERCICIO 9
SELECT a.nome AS Nome
FROM ator a
INNER JOIN elenco e
ON a.cod_ator = e.cod_ator
INNER JOIN filme f
ON f.cod_filme = e.cod_filme
WHERE f.tituloP = "onze homens e um segredo";

--@block EXERCICIO 10
SELECT SUM(f.duracao) AS Soma_Duracao
FROM filme f
INNER JOIN elenco e
ON f.cod_filme = e.cod_filme
INNER JOIN ator a
ON e.cod_ator = a.cod_ator
WHERE a.nome = "angelina jolie";

--@block EXERCICIO 11
SELECT f.tituloO AS Nome
FROM filme f
INNER JOIN elenco e
ON f.cod_filme = e.cod_filme
INNER JOIN ator a
ON e.cod_ator = a.cod_ator
WHERE a.nome = "brad pitt"
AND f.pais_origem = "estados unidos";

--@block EXERCICIO 12
SELECT c.nome AS Nome, TIME(s.dthr) AS Horario
FROM cinema c
INNER JOIN sessao s
ON c.cod_cinema = s.cinema
INNER JOIN elenco e
ON s.filme = e.cod_filme
INNER JOIN ator a
ON e.cod_ator = a.cod_ator
WHERE a.nome = "lazaro ramos";
