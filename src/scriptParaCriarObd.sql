-- Criando o BD
CREATE DATABASE universidade;

-- Usando o BD
USE universidade;

-- Criação da tabela Cursos
CREATE TABLE Cursos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50),
    Duracao_Horas INT,
    Nivel VARCHAR(20)
);

-- Criação da tabela Alunos
CREATE TABLE Alunos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50),
    Idade INT,
    ID_Curso INT,
    FOREIGN KEY (ID_Curso) REFERENCES Cursos(ID)
);

-- Inserindo dados na tabela Cursos
INSERT INTO Cursos (Nome, Duracao_Horas, Nivel) VALUES
('ADS', 3000, 'Superior'),
('Redes de Computadores', 80, 'Técnico');

-- Inserindo dados na tabela Alunos
INSERT INTO Alunos (Nome, Idade, ID_Curso) VALUES
('Alice', 22, 1),
('Bob', 25, NULL),
('Carol', 28, 1),
('David', 20, NULL);

-- Selecionando tudo da tabela Cursos
SELECT * FROM Cursos;

-- Selecionando tudo da tabela Alunos
SELECT * FROM Alunos;

-- LEFT JOIN (JUNTE-SE À ESQUERDA):
SELECT Alunos.*, Cursos.Nome AS Nome_Curso
FROM Alunos
LEFT JOIN Cursos ON Alunos.ID_Curso = Cursos.ID;

-- RIGHT JOIN (JUNTE-SE À DIREITA):
SELECT Alunos.*, Cursos.Nome AS Nome_Curso
FROM Alunos
RIGHT JOIN Cursos ON Alunos.ID_Curso = Cursos.ID;

-- INNER JOIN (JUNÇÃO INTERNA):
SELECT Alunos.*, Cursos.Nome AS Nome_Curso
FROM Alunos
INNER JOIN Cursos ON Alunos.ID_Curso = Cursos.ID;

-- FULL JOIN (JUNÇÃO COMPLETA):
SELECT Alunos.*, Cursos.*
FROM Alunos
FULL JOIN Cursos ON Alunos.ID_Curso = Cursos.ID;