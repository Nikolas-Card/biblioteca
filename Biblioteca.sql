CREATE DATABASE Biblioteca;
-- -----------------------------------------------------
-- Usando o Banco
-- -----------------------------------------------------
USE Biblioteca;

-- -----------------------------------------------------
-- Tabela tbl_categoria
-- -----------------------------------------------------
CREATE TABLE tbl_categoria (
	codigo_categoria INT NOT NULL AUTO_INCREMENT,
	nome_categoria VARCHAR(45) NOT NULL,
	PRIMARY KEY (codigo_categoria)
);

-- -----------------------------------------------------
-- Tabela tbl_Editora
-- -----------------------------------------------------
CREATE TABLE tbl_Editora (
	codigo_editora INT NOT NULL AUTO_INCREMENT,
	nome_editora VARCHAR(100) NOT NULL,
	cnpj VARCHAR(45) NOT NULL,
	email VARCHAR(100) NOT NULL,
	PRIMARY KEY (codigo_editora)
  );

-- -----------------------------------------------------
-- Tabela tbl_Livros
-- -----------------------------------------------------
CREATE TABLE tbl_Livros (
	codigo_livro INT NOT NULL AUTO_INCREMENT,
	nome_livro VARCHAR(45) NOT NULL,
	data_publicacao DATE NOT NULL,
	paginas INT NOT NULL,
	valor_unitario DECIMAL(6,2) NOT NULL,
	FK_Categoria INT NOT NULL,
	FK_Editora INT,
	PRIMARY KEY (codigo_livro),
	FOREIGN KEY (FK_Categoria) REFERENCES tbl_Categoria (codigo_categoria),
	FOREIGN KEY (FK_Editora) REFERENCES tbl_Editora (codigo_editora)
);

-- -----------------------------------------------------
-- Tabela tbl_Autor
-- -----------------------------------------------------
CREATE TABLE tbl_Autor (
	codigo_autor INT NOT NULL AUTO_INCREMENT,
	nome_autor VARCHAR(45) NOT NULL,
	nasc_autor DATE NOT NULL,
	nacionalidade VARCHAR(45) NOT NULL,
	PRIMARY KEY (codigo_autor)
);

-- -----------------------------------------------------
-- Tabela tbl_Cliente
-- -----------------------------------------------------
CREATE TABLE tbl_Cliente (
	codigo_cliente INT NOT NULL AUTO_INCREMENT,
	nome_cliente VARCHAR(45) NOT NULL,
	cpf_cliente VARCHAR(45) NOT NULL,
	nasc_cliente DATE NOT NULL,
	email VARCHAR(45) NOT NULL,
	PRIMARY KEY (codigo_cliente)
);

-- -----------------------------------------------------
-- Tabela tbl_bibliotecaria
-- -----------------------------------------------------
CREATE TABLE tbl_bibliotecario (
	codigo_bibliotecario INT NOT NULL AUTO_INCREMENT,
	nome_bibliotecario VARCHAR(45) NOT NULL,
	nasc_bibliotecario DATE NOT NULL,
	telefone VARCHAR(45) NOT NULL,
    FK_Biblio_responsavel INT,
	PRIMARY KEY (codigo_bibliotecario),
    FOREIGN KEY (FK_Biblio_responsavel) REFERENCES tbl_bibliotecario (codigo_bibliotecario)
  );

-- -----------------------------------------------------
-- Tabela Autor_Livro
-- -----------------------------------------------------
CREATE TABLE Autor_Livro (
	FK_Autor INT NOT NULL,
	FK_Livro INT NOT NULL,
	PRIMARY KEY (FK_Autor, FK_Livro),
	FOREIGN KEY (FK_Autor) REFERENCES tbl_Autor (codigo_autor),
	FOREIGN KEY (FK_Livro) REFERENCES tbl_Livros (codigo_livro)
);

-- -----------------------------------------------------
-- Tabela tbl_Emprestimo
-- -----------------------------------------------------
CREATE TABLE tbl_Emprestimo (
	codigo_emprestimo INT NOT NULL AUTO_INCREMENT,
	retirada DATETIME,
	devolucao DATETIME,
	FK_Bibliotecario INT NOT NULL,
	FK_Cliente INT NOT NULL,
	PRIMARY KEY (codigo_emprestimo),
	FOREIGN KEY (FK_Bibliotecario) REFERENCES tbl_bibliotecario (codigo_bibliotecario),
	FOREIGN KEY (FK_Cliente) REFERENCES tbl_Cliente (codigo_cliente)
);

-- -----------------------------------------------------
-- Tabela Livro_Emprestimo
-- -----------------------------------------------------
CREATE TABLE Livro_Emprestimo (
	FK_Livro INT NOT NULL,
	FK_Emprestimo INT NOT NULL,
	PRIMARY KEY (FK_Livro, FK_Emprestimo),
	FOREIGN KEY (FK_Livro) REFERENCES tbl_Livros (codigo_livro),
	FOREIGN KEY (FK_Emprestimo) REFERENCES tbl_Emprestimo (codigo_emprestimo)
);

######################## INSERÇÕES ################################
-- -----------------------------------------------------
-- Insert's tbl_Categoria
-- -----------------------------------------------------
INSERT INTO tbl_categoria (nome_categoria) VALUES
	('Aventura'),
	('AutoAjuda'),
	('Cientificos'),
	('Contos'),
	('Cronicas'),
	('Didaticos'),
	('fantasia'),
	('Ficção'),
	('Horror'),
	('Juvenil'),
	('Ação'),
	('Drama'),
	('Jogos'),
	('Poesia'),
	('Politica'),
	('Romance');

-- -----------------------------------------------------
-- Insert's tbl_Editora
-- -----------------------------------------------------
INSERT INTO tbl_Editora (nome_editora, cnpj, email) VALUES
	('Pearson','15.987.654/0001-65','pearson@pearson.com'),
	('Grupo Planeta','87.548.804/0874-95','planeta@planeta.com'),
	('Informa','05.982.601/00845-55','informa@informa.com'),
	('Grupo Santillana','20.652.058/1054-52','santillana@santillana.com'),
	('Somos Educação','15.416.608/0505-65','somosedu@somosedu.com'),
	('Media Participations','99.954.544/0070-85','mediaparticipations@mediaparticipations.com'),
	('Sanoma','15.987.654/0010-96','sanoma@sanoma.com'),
	('Editora FTD','16.977.685/0501-65','ftd@ftd.com'),
	('Quarto','84.554.564/0718','quarto@quarto.com'),
	('Editora Abril','15.951.908/0008-96','editoraabril@editoraabril.com'),
	('Companhia das Letras','54.584.210/0056-65','cialetras@cialetras.com'),
	('Editora Globo','04.564.584/0050-44','globo@globo.com'),
	('Editora Três','18.595.048/0048-41','tres@tres.com'),
	('Livraria Saraiva','54.584.041/0987-79','saraiva@saraiva.com');

-- -----------------------------------------------------
-- Insert's tbl_Autor
-- -----------------------------------------------------
INSERT INTO tbl_Autor (nome_autor, nasc_autor, nacionalidade) VALUES 
	('Leon Tolstói','1828/09/09','Russia'),
	('William Shakespeare','1564/04/26','Inglaterra'),
	('Machado de Assis','1839/06/21','Brasil'),
	('Aluísio de Azevedo','1857/04/14','Brasil'),
	('José de Alencar','1829/05/01','Brasil'),
	('Paulo Coelho','1947/08/24','Brasil'),
	('Clarice Lispector','1920/12/10','Ucrania'),
	('Carlos Drummond de Andrade','1902/10/31','Brasil'),
	('Stephan King','1947/09/21','Estados Unidos'),
	('JK Rowling','1965/07/31','Inglaterra'),
	('Charles Bukowski','1920/08/16','Alemanha'),
	('Guiumaraes Rosa','1908/06/27','Brasil'),
	('Monteiro Lobato','1882/04/18','Brasil'),
	('Miguel de Cervantes','1547/09/29','Espanha'),
	('Alexandre Dumas','1802/07/24','Franca'),
	('J.R.R. Tolkien','1892/01/03','Africa do Sul');

-- -----------------------------------------------------
-- Insert's tbl_Livro
-- -----------------------------------------------------
INSERT INTO tbl_Livros (nome_livro, data_publicacao, paginas, valor_unitario, FK_Categoria, FK_Editora) VALUES
	('Guerra e Paz', '1869/08/15', 1225, 50.99, 16, 1),
	('Anna Karenina', '1877/02/01', 864, 75.90, 16, 5),
	('Ressurreição', '1899/09/15', 483, 17.50, 16, 2),
	('Hamlet', '1520/09/02', 912, 47.00, 1, 9),
	('A tempestade', '1821/11/11', 225, 50.99, 6, 7),
	('A Megera Domada', '1951/12/01', 1225, 55.25, 8, 9),
	('Dom Quixote', '1612/12/08', 481, 29.75, 6, 5),
	('O Conde de Monte Cristo', '1820/09/06', 157, 103.88, 4, 1),
	('Um Conto de Duas Cidades', '1859/07/21', 510, 89.30, 8, 1),
	('O Pequeno Príncipe', '1943/01/15', 801, 101.99, 7, 2),
	('O Senhor dos Anéis', '1954/09/20', 320, 150.99, 12, 4),
	('Harry Potter e a Pedra Filosofal', '1997/10/31', 1510, 45.00, 10, 9),
	('O Caso dos Dez Negrinhos', '1939/12/12', 285, 27.90, 11, 8),
	('O Sonho da Câmara Vermelha', '1754/07/28', 280, 28.70, 5, 7),
	('O Leão, a Feiticeira e o Guarda-Roupa', '1950/03/03', 704, 90.15, 2, 6),
	('Ela, a Feiticeira', '1887/07/04', 708, 89.99, 2, 2),
	('O alquimista', '1988/08/02', 158, 15.00, 8, 1),
	('O Pequeno Príncipe', '1943/02/10', 300, 29.99, 9, 1),
	('O Hobbit', '1937/10/12', 225, 52.99, 4, 8),
	('O Código Da Vinci', '2003/12/08', 1025, 85.00, 7, 7),
	('Harry Potter e as Relíquias da Morte', '2007/10/17', 1225, 90.75, 9, 6),
	('Lolita', '1955/08/09', 1300, 102.00, 2, 4),
	('Meu Filho, Meu Tesouro', '1946/09/04', 751, 51.99, 8, 5),
	('O Nome da Rosa', '1980/03/07', 348, 89.99, 5, 7),
	('A Menina e o Porquinho', '1952/04/10', 512, 70.99, 1, 8),
	('As Pontes de Madison', '1992/10/05', 141, 40.45, 12, 10),
	('Cinquenta Tons de Cinza', '2011/05/22', 587, 54.10, 14, 11),
	('O Mundo de Sofia', '1991/05/15', 515, 99.45, 12, 2),
	('O Jardim dos Esquecidos', '1979/12/21', 241, 52.99, 7, 3),
	('Anjos e Demônios', '2000/10/01', 211, 21.99, 9, 4),
	('Grande Sertão: Veredas', '1956/12/24', 629, 51.20, 2, 1),
	('O Cortiço', '1890/04/11', 813, 100.45, 1, 10),
	('Dom Casmurro', '1899/11/04', 521, 150.99, 6, 9),
	('A Aliciadora Feliz', '1971/04/18', 255, 14.21, 8, 7),
	('Memórias Póstumas de Brás Cubas', '1881/02/15', 615, 89.40, 8,8),
	('Capitães da Areia', '1912/04/05', 239, 65.29, 6,2),
	('Iracema', '1865/12/04', 225, 84.12, 7,2),
	('Quem Mexeu no Meu Queijo?', '1998/04/18', 1225, 90.99, 3, 4),
	('Quincas Borba', '1891/07/18', 812, 55.99, 3,5),
	('Sítio do Picapau Amarelo', '1947/01/25', 307, 85.15, 7,5),
	('Os Pilares da Terra', '1989/08/16', 125, 85.99, 9, 5);

-- -----------------------------------------------------
-- Insert's tbl_Cliente
-- -----------------------------------------------------
INSERT INTO tbl_Cliente (nome_cliente, cpf_cliente, nasc_cliente, email) VALUES 
	('João da Silva','78381786155','1980/01/01', 'joao@dasilva.com'),
	('Frederico José','67775470231','1981/12/24','fred@jose.com'),
	('Alberto Santos','84214853574','1991/03/20','alberto@santos.com'),
	('Renata Alonso','72123271809','1986/07/18','renata@alonso.com'),
	('Paulo da Silva','65601538368','1988/09/10','paulo@dasilva.com'),
	('Hermelino Costa','46212433041','1993/10/09','hermelino@costa.com'),
	('Claudensio Pereira','18217425115','2004/12/30','claudensio@pereira.com'),
	('Maximiliano Alegre','29310165717','1985/12/25','maximiliano@alegre.com'),
	('Fabiola Nunes','69357114688','1997/09/04','fabiola@nunes.com'),
	('Pedro Souza','69357114682','2002/04/11','pedro@souza.com'),
	('Ellen Bernard','63315637127','2000/05/22','ellen@bernard.com'),
	('Ulisses Costa','55336792842','1996/10/06','ulisses@costa.com'),
	('Felipe Silva','55861699990','1980/11/11','felipe@silva.com'),
	('Veronica Santos','18642784903','1981/10/26','vernica@santos.com'),
	('Mikaely Costa','37768351764','1993/10/17','mikaely@costa.com'),
	('Almir Leon','37768351767','2004/12/30','almir@leon.com'),
	('Franklin Senna','38579791918','1987/10/12','franklin@senna.com'),
	('Carlos Nunes','21404485001','1991/03/20','carlos@nunes.com'),
	('Carlos Adao','58212236118','1991/03/20','carlos@adao.com');

-- -----------------------------------------------------
-- Insert's tbl_bibliotecaria
-- -----------------------------------------------------
INSERT INTO tbl_bibliotecario (nome_bibliotecario, nasc_bibliotecario, telefone, FK_Biblio_responsavel) VALUES 
	('Marcos','1980/07/12', '11 4517-1554',null),
    ('Cristiano','1980/07/12', '11 5485-4155',1),
    ('Luís','1993/10/17', '11 4002-8922',1),
    ('Aline','1980/07/12', '11 5481-5563',1),
    ('Diego','1980/07/12', '11 98154-8451',1),
    ('Francisco','1980/07/12', '11 98765-4321',2),
    ('Pamela','1995/11/04', '11 96841-5525',3),
    ('Rodrigo','1993/05/07', '11 4584-8950',null),
    ('Fabiana','1988/12/15', '11 95281-5443',3),
    ('Allan','1980/02/01', '11 98564-8041',1),
    ('Cristiane','1990/09/18', '11 95255-0481',3);
    
-- -----------------------------------------------------
-- Insert's Autor_Livro
-- -----------------------------------------------------
INSERT INTO Autor_Livro VALUES 
	(13,1),
	(1,1),
	(2,1),
	(14,1),
	(13,2),
	(10,3),
	(12,5),
	(12,6),
	(7,7),
	(8,8),
	(14,8),
	(1,8),
	(8,12),
	(16,9),
	(13,10),
	(3,10),
	(15,11),
	(1,12),
	(4,12),
	(12,14),
	(7,14),
	(12,15),
	(13,16),
	(16,16),
	(1,17),
	(9,19),
	(4,19),
	(7,20),
	(3,21),
	(1,21),
	(7,21),
	(16,21),
	(2,21),
	(3,22),
	(14,23),
	(15,23),
	(12,23),
	(9,23),
	(10,24),
	(2,24),
	(1,25),
	(7,26),
	(3,26),
	(8,26),
	(7,27),
	(15,29),
	(11,29),
	(5,29),
	(16,30),
	(14,34),
	(1,34),
	(7,35),
	(9,36),
	(13,37),
	(6,37),
	(10,38),
	(6,38),
	(10,39),
	(16,39),
	(8,41);

-- -----------------------------------------------------
-- Tabela tbl_Emprestimo
-- -----------------------------------------------------
INSERT INTO tbl_Emprestimo (retirada, devolucao, FK_Bibliotecario, FK_Cliente) VALUES 
	('2014-10-28 22:28:13', '2018-03-30 19:51:52', 9, 16),
	('2016-06-27 21:35:26', '2017-05-18 15:05:17', 7, 7),
	('2014-03-03 23:29:33', '2017-09-17 09:24:28', 8, 1),
	('2014-07-23 03:41:54', '2015-06-25 04:00:46', 6, 2),
	('2014-12-30 06:51:20', '2018-06-16 22:34:26', 9, 3),
	('2018-06-02 04:56:21', '2018-07-26 09:23:11', 7, 15),
	('2015-07-09 03:10:01', '2015-08-27 23:53:18', 3, 2),
	('2015-11-05 16:21:54', '2018-10-20 19:06:00', 1, 17),
	('2016-11-08 15:27:07', '2019-03-08 02:31:21', 3, 16),
	('2016-05-07 08:39:04', '2016-07-05 19:15:16', 1, 18),
	('2015-01-18 23:44:27', '2015-12-05 02:07:43', 11, 19),
	('2017-04-10 00:00:03', '2017-05-10 22:47:58', 9, 18),
	('2014-11-08 09:14:16', '2017-06-24 11:53:33', 1, 9),
	('2017-09-11 02:30:05', '2017-09-24 03:11:57', 6, 6),
	('2019-02-13 19:15:04', '2019-03-13 12:40:04', 10, 12),
	('2017-05-24 08:58:49', '2017-06-21 03:12:41', 2, 10),
	('2018-07-25 01:21:16', '2018-08-04 03:21:26', 10, 2),
	('2014-05-30 09:58:18', '2016-03-09 07:43:05', 4, 11),
	('2016-09-20 23:48:04', '2017-05-20 05:01:01', 4, 1),
	('2014-05-01 15:48:10', '2017-12-07 01:26:41', 11, 8),
	('2017-04-26 14:05:48', '2017-06-02 11:44:50', 5, 15),
	('2016-02-10 03:12:18', '2016-05-12 17:44:31', 3, 10),
	('2014-09-19 20:27:16', '2019-02-07 12:05:44', 5, 3),
	('2014-11-03 00:59:30', '2014-11-10 18:27:43', 9, 19),
	('2014-01-05 23:23:06', '2018-02-11 23:15:59', 6, 4),
	('2015-02-05 15:58:50', '2015-12-02 12:35:10', 8, 5),
	('2014-03-24 07:55:23', '2018-12-02 23:47:28', 6, 5),
	('2014-05-01 23:15:14', '2017-06-17 01:06:01', 10, 1),
	('2014-05-08 01:29:04', '2017-02-05 01:09:07', 7, 12),
	('2016-11-24 04:08:00', '2017-08-21 17:26:26', 8, 11),
	('2018-12-31 22:32:01', '2019-05-10 02:24:54', 10, 5),
	('2018-10-30 17:40:13', '2019-05-11 02:24:54', 1, 16),
	('2015-09-06 18:25:50', '2015-10-24 21:20:24', 10, 10),
	('2017-07-08 03:02:00', '2019-04-09 18:44:02', 6, 3),
	('2015-09-04 00:12:10', '2017-08-28 07:30:48', 4, 17),
	('2015-04-07 21:52:40', '2018-07-08 11:58:34', 4, 12),
	('2018-05-24 22:35:38', '2018-10-09 17:48:54', 10, 18),
	('2016-01-22 19:36:14', '2016-03-24 09:09:15', 4, 17),
	('2019-02-25 17:33:56', '2019-03-09 08:55:00', 1, 9),
	('2016-04-23 18:02:50', '2016-10-29 09:28:41', 10, 17),
	('2015-07-27 01:54:45', '2019-01-10 02:24:54', 1, 7),
	('2017-12-14 11:57:33', '2017-12-27 20:37:15', 2, 3),
	('2016-03-14 06:48:03', '2016-12-11 05:18:53', 5, 8),
	('2017-11-05 08:29:20', '2017-12-26 03:56:09', 11, 6),
	('2015-04-18 07:25:44', '2018-06-11 09:33:47', 3, 7),
	('2017-10-31 23:07:26', '2017-12-16 12:34:12', 8, 6),
	('2017-01-20 21:36:02', '2017-02-08 05:52:38', 6, 10),
	('2018-12-11 00:33:15', '2018-12-29 13:34:13', 1, 3),
	('2016-09-20 16:23:06', '2016-10-20 06:43:46', 9, 5),
	('2015-07-29 22:48:14', '2016-12-13 20:18:50', 3, 11),
	('2016-02-18 21:24:00', '2018-06-01 07:25:44', 7, 2),
	('2018-03-16 05:15:53', '2018-10-11 02:39:13', 6, 8),
	('2015-05-15 12:20:56', '2019-05-03 12:20:47', 2, 13),
	('2015-05-24 12:26:47', '2016-12-29 17:45:16', 4, 7),
	('2016-11-26 19:32:11', '2017-02-18 20:14:56', 10, 15),
	('2016-10-23 18:39:14', '2016-11-10 20:42:15', 7, 4),
	('2015-11-07 12:04:42', '2015-11-14 15:39:19', 10, 2),
	('2016-07-02 16:41:03', '2017-05-07 08:25:33', 7, 1),
	('2018-08-15 09:58:28', '2018-08-17 03:08:27', 9, 6),
	('2015-01-21 01:01:43', '2016-09-19 10:33:24', 2, 10),
	('2014-11-19 10:16:15', '2017-01-09 14:05:04', 2, 5),
	('2015-02-11 11:22:21', '2015-09-09 16:03:39', 3, 19),
	('2016-07-01 11:09:48', '2017-03-15 16:23:16', 1, 1),
	('2016-12-16 12:05:21', '2016-12-22 03:59:59', 4, 7),
	('2016-03-14 00:19:54', '2017-11-22 10:38:31', 3, 4),
	('2014-12-04 01:25:19', '2018-03-12 16:39:57', 1, 8),
	('2017-05-15 08:44:17', '2017-06-15 20:28:13', 4, 12),
	('2014-08-04 14:18:37', '2014-09-07 06:47:40', 1, 16),
	('2018-10-12 19:10:05', '2018-10-13 22:42:09', 1, 15),
	('2018-11-24 09:07:54', '2018-12-09 23:29:05', 7, 9),
	('2018-03-10 19:29:17', '2018-12-22 23:29:05', 11, 14),
	('2019-02-25 13:40:54', '2019-05-04 02:24:54', 8, 12),
	('2018-04-27 01:45:42', '2017-09-11 05:24:47', 10, 11),
	('2016-04-30 04:10:28', '2017-11-18 02:25:00', 10, 3),
	('2018-08-30 11:03:06', '2018-09-24 18:35:44', 2, 15),
	('2014-03-13 17:18:58', '2018-01-05 16:26:58', 4, 8),
	('2016-05-28 18:28:43', '2017-04-10 00:29:12', 3, 10),
	('2016-12-26 18:34:57', '2016-12-03 21:33:01', 4, 11),
	('2019-03-13 11:38:05', '2019-05-23 18:56:30', 11, 15);

-- -----------------------------------------------------
-- Tabela Livro_Emprestimo
-- -----------------------------------------------------

INSERT INTO Livro_Emprestimo VALUES
	(7, 1 ),
	(26, 1 ),
	(37, 1 ),
	(34, 2 ),
	(26, 2 ),
	(6, 3 ),
	(29, 4 ),
	(10, 4 ),
	(36, 4 ),
	(22, 5 ),
	(36, 5 ),
	(11, 6 ),
	(6, 7 ),
	(1, 8 ),
	(3,	8 ),
	(35, 8 ),
	(29, 9 ),
	(1, 9 ),
	(40, 10 ),
	(9, 11 ),
	(6, 11 ),
	(31, 11 ),
	(20, 12 ),
	(1, 13 ),
	(20, 14 ),
	(40, 14),
	(35, 15),
	(21, 16),
	(9, 17),
	(3, 17),
	(34, 18),
	(16, 18),
	(28, 18),
	(30, 19),
	(9, 19),
	(13, 19),
	(36, 20),
	(38, 20),
	(22, 20),
	(31, 20),
	(18, 21),
	(17, 21),
	(41, 21),
	(24, 21),
	(29, 22),
	(30, 22),
	(17, 29),
	(17, 22),
	(1, 23),
	(16, 23),
	(25, 23),
	(6, 24),
	(5, 25),
	(4, 25),
	(7, 25),
	(25, 26),
	(2, 26),
	(41, 26),
	(4, 27),
	(11, 27),
	(2, 28),
	(38, 28),
	(26, 29),
	(30, 30),
	(27, 30),
	(35, 30),
	(1, 31),
	(21, 32),
	(31	,32),
	(23, 32),
	(10, 33),
	(8, 34),
	(40, 34),
	(10, 34),
	(31, 35),
	(28, 35),
	(40, 35),
	(6, 35),
	(3, 36),
	(40, 36),
	(21, 36),
	(27, 37),
	(5, 37),
	(26, 38),
	(31, 38),
	(11, 38),
	(9, 39),
	(32, 39),
	(10, 39),
	(13, 40),
	(1, 40),
	(12, 40),
	(10, 40),
	(27, 41),
	(41, 41),
	(36, 42),
	(20, 42),
	(1, 42),
	(16, 43),
	(9, 43),
	(24, 44),
	(25, 44),
	(16, 45),
	(22, 45),
	(35, 45),
	(6, 45),
	(9, 45),
	(33, 45),
	(11, 46),
	(15, 46),
	(32, 46),
	(32, 47),
	(38, 47),
	(36, 47),
	(16, 48),
	(27, 48),
	(5, 48),
	(25, 49),
	(17, 49),
	(15, 49),
	(38, 49),
	(18, 49),
	(26, 50),
	(7, 51),
	(4, 51),
	(26, 51),
	(2, 52),
	(23, 53),
	(26, 54),
	(17, 54),
	(32, 55),
	(9, 55),
	(1, 55),
	(7,	55),
	(31, 56),
	(35, 57),
	(12, 57),
	(39, 58),
	(27, 58),
	(23, 59),
	(8, 59),
	(17, 59),
	(13, 59),
	(4, 59),
	(11, 59),
	(29, 59),
	(30, 59),
	(16, 59),
	(13, 60),
	(6, 60),
	(30, 60),
	(9, 60),
	(24, 60),
	(14, 61),
	(16, 61),
	(27, 61),
	(39, 61),
	(17, 62),
	(9,	62),
	(24, 63),
	(33, 63),
	(40, 63),
	(32, 63),
	(30, 63),
	(6,	64),
	(21, 64),
	(27, 64),
	(18, 64),
	(18, 65),
	(3,	65),
	(40, 65),
	(26, 66),
	(29, 67),
	(11, 68),
	(30, 69),
	(40, 69),
	(28, 69),
	(18, 70),
	(14, 70),
	(11, 71),
	(24, 72),
	(3,	72),
	(20, 73),
	(7,	73),
	(16, 74),
	(35, 74),
	(33, 74),
	(14, 74),
	(10, 75),
	(1,	75),
	(37, 75),
	(2,	75),
	(41, 76),
	(28, 76),
	(35, 76),
	(5,	77),
	(8,	78),
	(21, 78),
	(22, 78),
	(25, 79);
    
#=====================================================================================================================
#ATIVIDADE

#1-UTILIZANDO O RECURSO "IN", SELECIONAR TODAS AS INFORMACOES DOS AUTORES "JK ROWLING" E "STEPHAN KING":
select * from tbl_Autor where nome_autor in('JK Rowling', 'Stephan King');

#2-UTILIZANDO O RECURSO "IN", SELECIONAR O NOME, AS PAGINAS E A CATEGORIA DE TODOS OS LIVROS DAS CATEGORIAS
	# "CONTOS", "POESIA" E "AVENTURA":
select nome_livro, paginas, nome_categoria from tbl_Livros join tbl_categoria on codigo_categoria = FK_Categoria 
	where nome_categoria in('Contos', 'Poesia', 'Aventura');
    
#3-EXIBIR QUAL CATEGORIA DE LIVROS, NAO TEM NENHUM LIVRO VINICULADO A ELA:
select nome_categoria from tbl_categoria 
	where codigo_categoria not in(select FK_categoria from tbl_livros);

#4-Exibir o nome dos livros cadastrados, juntamente com suas categorias e nome das editoras que o produziram:
select nome_livro, nome_categoria, nome_editora from tbl_Livros 
	join tbl_categoria on codigo_categoria = FK_Categoria
    join tbl_Editora on codigo_editora=FK_Editora;
    
#5-Exibir os autores que produziram livros da categoria de romance e quantos livros cada um produziu 
	#ordenando por quem produziu mais primeiro:
select nome_autor, count(*) qtd_livros from tbl_Autor 
	join Autor_Livro on FK_Autor=codigo_autor 
	join tbl_livros on codigo_livro=FK_Livro  
	join tbl_categoria on codigo_categoria = FK_Categoria 
	where nome_categoria = 'Romance' group by nome_autor order by qtd_livros desc;
    
#6-Exibir os nomes dos autores e o nome dos seus livros.
select nome_autor, nome_livro from tbl_Autor 
	join Autor_Livro on FK_Autor=codigo_autor 
	join tbl_livros on codigo_livro=FK_Livro;
    
#7-Exibir os nomes dos autores e quantos livros cada um produziu em ordem do que tem mais livros para o que tem menos livros:
select nome_autor, count(*) qtd_livros from tbl_Autor join Autor_Livro on FK_Autor=codigo_autor 
	join tbl_livros on codigo_livro=FK_Livro  
	join tbl_categoria on codigo_categoria = FK_Categoria 
	group by nome_autor order by qtd_livros desc;
    
#8-EXIBIR APENAS O NOME, A SUA CATEGORIA E VALOR_UNITARIO PARA TODOS OS LIVROS QUE O VALOR UNITARIO FOR SUPERIOR 
	#A MEDIA DOS PREÇOS. ORDENAR A BUSCA DO MENOR VALOR PARA O MAIOR. 
	# DICA: UTILIZE SUBQUERY E ORDER BY:
select nome_livro, nome_categoria, valor_unitario  from tbl_Livros
	join tbl_categoria on codigo_categoria = FK_Categoria
    where valor_unitario>(select avg(valor_unitario) from tbl_Livros)
    order by valor_unitario;
    
#9-EXIBIR O NOME DO LIVRO, A QUANTIDADE DE PAGINAS E O NOME DA CATEGORIA PARA TODOS OS LIVROS QUE O NUMERO DE PAGINAS SEJA 
	#MENOR QUE A MEDIA DAS PAGINAS. ORDERNAR A BUSCA DO MAIOR PARA O MENOR VALOR DA COLUNA PAGINAS:
select nome_livro, paginas, nome_categoria from tbl_Livros
	join tbl_categoria on codigo_categoria = FK_Categoria
    where paginas<(select avg(paginas) from tbl_Livros)
    order by paginas desc;