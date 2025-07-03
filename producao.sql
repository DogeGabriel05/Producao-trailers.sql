DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Trailer;
DROP TABLE IF EXISTS Producao;
DROP TABLE IF EXISTS LocalEntrega;
DROP TABLE IF EXISTS Entrega;

-- Criação das tabelas usadas
CREATE TABLE Cliente (
  id_cliente INTEGER PRIMARY KEY,
  nome TEXT,
  email TEXT,
  telefone TEXT
);

CREATE TABLE Trailer (
  id_trailer INTEGER PRIMARY KEY,
  tipo TEXT,
  preco_base REAL
);

CREATE TABLE Producao (
  id_producao INTEGER PRIMARY KEY,
  id_cliente INTEGER,
  id_trailer INTEGER,
  data_pedido TEXT,
  data_entrega TEXT,
  status TEXT,
  preco_final REAL,
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
  FOREIGN KEY (id_trailer) REFERENCES Trailer(id_trailer)
);

CREATE TABLE LocalEntrega (
  id_local INTEGER PRIMARY KEY,
  cidade TEXT,
  estado TEXT,
  endereco TEXT
);

CREATE TABLE Entrega (
  id_entrega INTEGER PRIMARY KEY,
  id_producao INTEGER,
  id_local INTEGER,
  FOREIGN KEY (id_producao) REFERENCES Producao(id_producao),
  FOREIGN KEY (id_local) REFERENCES LocalEntrega(id_local)
);

-- Dados de cada cliente = (ID, Nome, E-mail, Telefone)
INSERT INTO Cliente VALUES (1, 'Samuel Porter', 'sambridges@gmail.com', '11123456789');
INSERT INTO Cliente VALUES (2, 'Arthur Morgan', 'tuberculose@gmail.com', '22123456789');
INSERT INTO Cliente VALUES (3, 'Gustavo Lima', 'tcherere@gmail.com', '33123456789');
INSERT INTO Cliente VALUES (4, 'Michele Bolsonaro', 'michele22@gmail.com', '44123456789');

-- Dados do trailer = (ID, Tipo, Valor base)
INSERT INTO Trailer VALUES (1, 'Pequeno', 10000.00);
INSERT INTO Trailer VALUES (2, 'Medio', 15000.00);
INSERT INTO Trailer VALUES (3, 'Grande', 20000.00);
INSERT INTO Trailer VALUES (4, 'Custom', NULL);

-- Dados da produção de cada trailer = (ID da produção, ID do cliente, ID do tipo, Status, Valor final)
INSERT INTO Producao VALUES (1, 1, 1, '14-05-2025', '23-05-2025', 'Finalizado', '10000');
INSERT INTO Producao VALUES (2, 2, 2, '19-05-2025', '30-05-2025', 'Finalizado', '15000');
INSERT INTO Producao VALUES (3, 3, 3, '09-06-2025', '24-06-2025', 'Finalizado', '20000');
INSERT INTO Producao VALUES (4, 4, 4, '27-06-2025', '07-07-2025', 'Em produção', '22000');

-- Dados do endereço da entrega = (ID do local, Cidade, Estado, Endereço)
INSERT INTO LocalEntrega VALUES (1, 'Joinville', 'SC', 'Rua Dona Francisca, 1957');
INSERT INTO LocalEntrega VALUES (2, 'Joinville', 'SC', 'Av. José Vieira, 753');
INSERT INTO LocalEntrega VALUES (3, 'Itajaí', 'SC', 'Rua José Pereira Liberato, 2952');
INSERT INTO LocalEntrega VALUES (4, 'Garuva', 'SC', 'Av. Celso Ramos, 76');

-- Dados finais da entrega do trailer = (ID da entrega, ID da produção, ID do local de entrega)
INSERT INTO Entrega VALUES (1, 1, 1);
INSERT INTO Entrega VALUES (2, 2, 2);
INSERT INTO Entrega VALUES (3, 3, 3);
INSERT INTO Entrega VALUES (4, 4, 4);

-- Ver todos os dados de cada tabela
SELECT * FROM Cliente;

SELECT * FROM Trailer;	

SELECT * FROM Producao;

SELECT * FROM LocalEntrega;

SELECT * FROM Entrega;