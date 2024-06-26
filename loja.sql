CREATE DATABASE loja;
USE loja;

CREATE TABLE estado(
ID INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(50) NOT NULL,
UF VARCHAR(2) NOT NULL
);

CREATE TABLE municipio(
ID INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(80) NOT NULL,
CodIBGE INT,
EstadoID INT,
FOREIGN KEY (EstadoID) REFERENCES estado(ID)
);

CREATE TABLE cliente(
ID INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(80) NOT NULL,
CPF VARCHAR(11) NOT NULL,
Celular VARCHAR(11),
EndLogradouro VARCHAR(100) NOT NULL,
EndNumero INT NOT NULL,
EndCEP CHAR(8),
MunicipioID INT,
FOREIGN KEY (MunicipioID) REFERENCES municipio(ID)
);

CREATE TABLE contaReceber(
ID INT PRIMARY KEY AUTO_INCREMENT,
FaturaVendaID INT,
DataConta DATE NOT NULL,
DataVencimento DATE NOT NULL,
Valor DECIMAL(18,2) NOT NULL,
Situacao ENUM('1','2','3'),
ClienteID INT,
FOREIGN KEY (ClienteID) REFERENCES cliente(ID)
);

INSERT estado VALUES 
(111, "Paraná", "PR"),
(222, "Bahia", "BH"),
(333, "Amazonas", "AM");

INSERT municipio VALUES
(101, "Curitiba", 1101, 111),
(102, "Salvador", 1102, 222),
(103, "Barcelos", 1103, 333);

INSERT cliente VALUES
(1001, "Lucas", 11111111111, 12121212121, "R66", 11, 11111111, 101),
(1002, "Junior", 22222222222, 13131313131, "R77", 22, 22222222, 102),
(1003, "Marcos", 33333333333, 14141414141, "R88", 33, 33333333, 103 );

INSERT contaReceber VALUES
(10001, 110, 20200103, 20210103, 100.00, 1, 1001),
(10002, 220, 20200203, 20210203, 200.00, 2, 1002),
(10003, 330, 20200204, 20210304, 250.00, 3, 1003);


-- Pessoas com situação 1
SELECT contaReceber.ID, cliente.CPF, contaReceber.DataVencimento
FROM contaReceber WHERE Situacao = "1";