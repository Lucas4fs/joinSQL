<p align="center">
    <img src="imagens\capaDoProjeto.jpg">
    <br>
    <h1 align="center">
    🔎 CONSULTAS SQL COM "JOIN" 🔎
    </h1>
</p>
<br>
<h2>
    📜  SCRIPT COMPLETO DO PROJETO NO LINK ABAIXO
</h2>

```
https://github.com/Lucas4fs/joinSQL/blob/main/src/scriptParaCriarObd.sql
``` 

<h3>
    :pushpin: Intuito do Projeto
</h3>

<p>
    O intuito desse projeto é explicar a diferença entre os tipos de "JOIN" que existem no SQL.<br>
    Sabemos que "JOIN" significa JUNTAR e serve para realizer querys que fazem referência a mais de uma tabela, mas existem vários tipos de junções que podem ser feitas e nesse projeto iremos abordar algumas destas junções.
</p>

<h3>
    :pushpin: Entendendo o Básico
</h3>

<p>
    Sabendo que temos um BD com duas tabelas, a tabela "Cursos" e a tabela "Alunos", vamos realizar uma consulta comum para saber quais dados existem dentro dessas tabelas:
</p>

```sql
SELECT * FROM Cursos;

--RESULTADO DA CONSULTA:

+----+------------------------+--------------+---------+
| ID | Nome                   | Duracao_Horas| Nivel   |
+----+------------------------+--------------+---------+
| 1  | ADS                    | 3000         | Superior|
| 2  | Redes de Computadores  | 80           | Técnico |
+----+------------------------+--------------+---------+
```

```sql
SELECT * FROM Alunos;

--RESULTADO DA CONSULTA:

+----+-------+------+----------+
| ID | Nome  | Idade| ID_Curso |
+----+-------+------+----------+
| 1  | Alice | 22   | 1        |
| 2  | Bob   | 25   | NULL     |
| 3  | Carol | 28   | 1        |
| 4  | David | 20   | NULL     |
+----+-------+------+----------+
```

<p>
    Repare que a coluna "ID_Curso" dentro da tabela "Alunos" é uma FOREIGN KEY(chave estrangeira) que faz referência a coluna "ID" da tabela "Cursos".<br>
    Agora vamos elaborar uma consulta que faz uma junção, trazendo dados das duas tabelas, mas antes observe a ilustração para saber algumas das possíveis junções que podem ser feitas:
</p>

<p>
    <img src = "imagens\tiposDeJOIN.png">
</p>

<h3>
    :pushpin: Colocando em Prática
</h3>

<h4>
    :pushpin: LEFT JOIN (JUNTE-SE À ESQUERDA):
</h4>

<p>
    <img src="imagens\leftJoin.png">
</p>

```sql
SELECT Alunos.*, Cursos.Nome AS Nome_Curso
FROM Alunos
LEFT JOIN Cursos ON Alunos.ID_Curso = Cursos.ID;

--RESULTADO DA CONSULTA:

+----+-------+------+----------+------------------------+
| ID | Nome  | Idade| ID_Curso | Nome_Curso             |
+----+-------+------+----------+------------------------+
| 1  | Alice | 22   | 1        | ADS                    |
| 2  | Bob   | 25   | NULL     | NULL                   |
| 3  | Carol | 28   | 1        | ADS                    |
| 4  | David | 20   | NULL     | NULL                   |
+----+-------+------+----------+------------------------+
```

<p>
O LEFT JOIN da preferência para a tabela que está a esquerda do JOIN, retorna todos os registros da tabela "Alunos" mesmo que as exigências do SELECT não sejam cumpridas em relação a tabela que está a direita do JOIN, ou seja, trazer todos os dados da tabela da esquerda em qualquer circunstância e trazer os dados da tabela da direita caso a mesma cumpra com as exigências do SELECT.
</p>

<h4>
    :pushpin: RIGHT JOIN (JUNTE-SE À DIREITA):
</h4>

<p>
    <img src="imagens\rightJoin.png">
</p>

```sql
SELECT Alunos.*, Cursos.Nome AS Nome_Curso
FROM Alunos
RIGHT JOIN Cursos ON Alunos.ID_Curso = Cursos.ID;

--RESULTADO DA CONSULTA:

+----+-------+------+----------+------------------------+
| ID | Nome  | Idade| ID_Curso | Nome_Curso             |
+----+-------+------+----------+------------------------+
| 1  | Alice | 22   | 1        | ADS                    |
| 3  | Carol | 28   | 1        | ADS                    |
|NULL| NULL  | NULL | NULL     | Redes de Computadores  |
+----+-------+------+----------+------------------------+
```

<p>
O RIGHT JOIN da preferência para a tabela que está a direita do JOIN, retorna todos os registros da tabela "Cursos" mesmo que as exigências do SELECT não sejam cumpridas em relação a tabela que está a esquerda do JOIN, ou seja, trazer todos os dados da tabela da direita em qualquer circunstância e trazer os dados da tabela da esquerda caso a mesma cumpra com as exigências do SELECT.
</p>

<h4>
    :pushpin: INNER JOIN (JUNÇÃO INTERNA):
</h4>

<p>
    <img src="imagens\innerJoin.png">
</p>

```sql
SELECT Alunos.*, Cursos.Nome AS Nome_Curso
FROM Alunos
INNER JOIN Cursos ON Alunos.ID_Curso = Cursos.ID;

--RESULTADO DA CONSULTA:

+----+-------+------+----------+------------------------+
| ID | Nome  | Idade| ID_Curso | Nome_Curso             |
+----+-------+------+----------+------------------------+
| 1  | Alice | 22   | 1        | ADS                    |
| 3  | Carol | 28   | 1        | ADS                    |
+----+-------+------+----------+------------------------+
```
<p>
Nesse caso nenhuma tabela é priorizada quando se trata da exibição de dados, ou seja, trazer todos os dados das duas tabelas dês de que as duas tabelas atendam as exigências do SELECT.
</p>

<h4>
    :pushpin: FULL JOIN (JUNÇÃO COMPLETA):
</h4>

<p>
    <img src="imagens\fullJoin.png">
</p>

```sql
SELECT Alunos.*, Cursos.*
FROM Alunos
FULL JOIN Cursos ON Alunos.ID_Curso = Cursos.ID;

--RESULTADO DA CONSULTA:

ID             | 1        | 3        | 2                     | 4        |
Nome           | Alice    | Carol    | Bob      			 | David    |
Idade          | 22       | 28       | 25       			 | 20       |
ID_Curso       | 1        | 1        | NULL     			 | NULL     |
ID             | 1        | 1        | 2        			 | NULL     |
Nome           | ADS      | ADS      | Redes de Computadores | NULL     |
Duracao_Horas  | 3000     | 3000     | 80       			 | NULL     |
Nivel          | Superior | Superior | Técnico  	   		 | NULL     |
```


<p>
Nesse caso as duas tabelas são priorizadas quando se trata da exibição dos dados, ou seja, trazer todos os dados das duas tabelas mesmo que as exigências do SELECT sejam atendidas ou não e ondem não houver correspondência de dados o valor "NULL" será retornado.
</p>
