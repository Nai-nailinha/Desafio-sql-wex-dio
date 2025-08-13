
-- 1 - Buscar o nome e ano dos filmes
SELECT [Nome], [Ano]
FROM [Filmes].[dbo].[Filmes];

-- 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT nome, ano, duracao
FROM Filmes
ORDER BY ano;

-- 3 - Buscar pelo filme De Volta para o Futuro, trazendo o nome, ano e a duração
SELECT nome, ano, duracao
FROM Filmes
WHERE nome LIKE '%de volta para o futuro%';

-- 4 - Buscar os filmes lançados em 1997
SELECT nome, ano, duracao
FROM Filmes
WHERE ano = 1997;

-- 5 - Buscar os filmes lançados após o ano 2000
SELECT nome, ano, duracao
FROM Filmes
WHERE ano > 2000;

-- 6 - Buscar os filmes com a duração maior que 100 e menor que 150, ordenando pela duração em ordem crescente
SELECT nome, ano, duracao
FROM Filmes
WHERE Duracao BETWEEN 101 AND 149
ORDER BY Duracao ASC;

-- 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela quantidade em ordem decrescente
SELECT Ano, COUNT(*) AS Quantidade
FROM dbo.Filmes
WHERE Ano IS NOT NULL
GROUP BY Ano
ORDER BY Quantidade DESC, Ano ASC;

-- 8 - Buscar os atores do gênero masculino
SELECT id, primeironome, ultimonome, Genero
FROM Atores
WHERE Genero LIKE 'M';

-- 9 - Buscar os atores do gênero feminino, ordenando pelo primeiro nome
SELECT id, primeironome, ultimonome, Genero
FROM Atores
WHERE Genero LIKE 'F'
ORDER BY PrimeiroNome;

-- 10 - Buscar o nome do filme e o gênero
SELECT nome, genero
FROM Filmes
INNER JOIN FilmesGenero ON filmes.Id = FilmesGenero.IdFilme
LEFT JOIN Generos ON Generos.Id = FilmesGenero.IdGenero;

-- 11 - Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT nome, genero
FROM Filmes
INNER JOIN FilmesGenero ON filmes.Id = FilmesGenero.IdFilme
LEFT JOIN Generos ON Generos.Id = FilmesGenero.IdGenero
WHERE Genero LIKE 'Mistério';

-- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT nome, primeironome, ultimonome, papel
FROM Filmes
INNER JOIN ElencoFilme ON filmes.Id = ElencoFilme.IdFilme
LEFT JOIN atores ON Atores.Id = ElencoFilme.IdAtor;
