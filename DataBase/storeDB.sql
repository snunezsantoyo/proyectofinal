drop database if exists store;
create database store CHARACTER SET utf8 COLLATE utf8_general_ci;

use store;

create table UserInfo(
	UserInfo_ID int not null auto_increment primary key,
	Name varchar(30) not null, LastName varchar(20) not null, LastName_2 varchar(20),
	PhoneNumber varchar(12), Age DATE not null);


create table UserLog (
	UserLog_ID int not null auto_increment primary key, UserInfo_ID int not null,
	Email varchar(35), Password varchar(15) not null, Username varchar(15) not null,
	constraint fkUserInfo foreign key (UserInfo_ID) REFERENCES UserInfo(UserInfo_ID)
	);

create table Classification (
	Classification_ID int not null auto_increment primary key,
	Clasificacion varchar(25) not null
);


create table Products (
	Product_ID int not null auto_increment primary key,
	UserInfo_ID int not null,Photo varchar(30), 
	ProductName varchar(25) not null,
	Description varchar(100), value decimal(9,2) not null, 
	Stock int not null, Classification_ID int not null, estatus int not null, 
	constraint fkUserInfoP foreign key (UserInfo_ID) REFERENCES UserInfo(UserInfo_ID),
	constraint fkClassification foreign key (Classification_ID) REFERENCES Classification(Classification_ID)
);


/*create table State (
	State_ID int not null auto_increment primary key,
	Description varchar(15) not null
);


create table Sell_Buy (
	Sell_Buy int not null auto_increment primary key, 
	Product_ID int not null, State_ID int not null,
	UserInfo_ID int not null,
	DateStart DATETIME not null, DateEnd DATETIME, 
	kindPay varchar(10) not null,
	constraint fkState foreign key (State_ID) REFERENCES State(State_ID),
	constraint fkProduct foreign key (Product_ID) REFERENCES Products(Product_ID),
	constraint fkUserInfoS foreign key (UserInfo_ID) REFERENCES UserInfo(UserInfo_ID)
);*/

INSERT INTO UserInfo (Name, LastName, LastName_2, PhoneNumber, Age) VALUES ('Jaqueline', 'Rivera', 'Medina', '4451203245', '1999-07-11'); 
INSERT INTO UserInfo (Name, LastName, LastName_2, PhoneNumber, Age) VALUES ('Enrique', 'Cisneros', 'Vidal', '4661203450', '1998-12-12'); 

INSERT INTO UserLog (UserInfo_ID, Email, Password, Username) VALUES (1,'j.riveramedina@ugto.mx', 'secret1', 'Jackie');
INSERT INTO UserLog (UserInfo_ID, Email, Password, Username) VALUES (2,'e.cisnerosvidal@ugto.mx', 'secret2', 'Enrique');

INSERT INTO Classification (Clasificacion) VALUES ('Termoformado');
INSERT INTO Classification (Clasificacion) VALUES ('Temporada');
INSERT INTO Classification (Clasificacion) VALUES ('Abecedario');
INSERT INTO Classification (Clasificacion) VALUES ('Personajes');
INSERT INTO Classification (Clasificacion) VALUES ('Otros');

INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(1, './img/Fotos/producto1.jpeg', 'Animales zoologico', 'Animales zoologico termoformado 5 piezas', '1.00', '10', 1, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(2, './img/Fotos/producto2.jpeg', 'Animales granja', 'Animales de granja termoformado 5 piezas', '1.00', '15', 1, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(1, './img/Fotos/producto3.jpeg', 'gafet', 'paquete gafet masculino termoformado 5 piezas', '30.00', '50', 1, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(1, './img/Fotos/producto4.jpeg', 'Unicornio', 'Unicornio termoformado 5 piezas', '30.00', '100', 1, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(1, './img/Fotos/producto5.jpeg', 'Arbol navidad', 'paquete arbol de navidad 5 piezas', '25.00', '5', 2, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(2, './img/Fotos/producto6.jpeg', 'Campanas navidad', 'paquete campanas navidad 5 piezas', '25.00', '5', 2, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(2, './img/Fotos/producto7.jpeg', 'Nochebuena', 'paquete nochebuenas 5 piezas', '25.00', '5', 2, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(1, './img/Fotos/producto8.jpeg', 'Esferas navidad', 'paquete esferas diamantado 10 piezas', '40.00', '10', 2, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(2, './img/Fotos/producto9.jpeg', 'Numeros', 'paquete de numeros grueso', '40.00', '7', 3, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(1, './img/Fotos/producto10.jpeg', 'Abecedario', 'Abecedario grande', '10.00', '57', 3, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(1, './img/Fotos/producto11.jpeg', 'Mickey mouse', 'paquete mickey mouse 10 piezas', '35.00', '100', 4, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(1, './img/Fotos/producto12.jpeg', 'Luigi', 'paquete luigi 10 piezas', '25.00', '15', 4, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(2, './img/Fotos/producto13.jpeg', 'Minnie mouse', 'paquete minnie mouse 10 piezas', '35.00', '50', 4, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(2, './img/Fotos/producto14.jpeg', 'Dia del maestro', 'Figura dia del maestro 1 pieza', '5.00', '200', 5, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(1, './img/Fotos/producto15.jpeg', 'Dia del trabajo', 'paquete figura dia del trabajo 5 piezas', '30.00', '10', 5, 1);

/*INSERT INTO State (Description) VALUES ('En camino');
INSERT INTO State (Description) VALUES ('Entregado');
INSERT INTO State (Description) VALUES ('Perdido');
INSERT INTO State (Description) VALUES ('Cancelado');

INSERT INTO Sell_Buy(Product_ID, State_ID, UserInfo_ID, DateStart, kindPay) VALUES 
(1, 1, 1, '2019-09-19 09:27:55', 'Efectivo');*/