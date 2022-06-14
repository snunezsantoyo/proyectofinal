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

INSERT INTO Classification (Clasificacion) VALUES ('Resistencias');
INSERT INTO Classification (Clasificacion) VALUES ('Diodos');
INSERT INTO Classification (Clasificacion) VALUES ('Compuertas');
INSERT INTO Classification (Clasificacion) VALUES ('Capacitores');
INSERT INTO Classification (Clasificacion) VALUES ('Otros');

INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(1, './img/Fotos/producto1.jpg', 'Resistencia 1k ohm', 'Resistencia 1/4W', '1.00', '10', 1, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(2, './img/Fotos/producto2.jpg', 'Resistencia 100 ohm', 'Resistencia 1/4W', '1.00', '15', 1, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(1, './img/Fotos/producto3.jpg', 'Protoboard', 'Protoboard Steren', '80.00', '5', 5, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(1, './img/Fotos/producto4.jpg', 'Led azul', 'Led azul ultrabrillante marca x', '3.00', '5', 2, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(1, './img/Fotos/producto5.jpg', 'Led rojo', 'Led rojo marca x', '3.00', '5', 2, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(2, './img/Fotos/producto6.jpg', 'Capacitor 100 uF', 'Capacitor a 50V', '3.00', '5', 4, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(2, './img/Fotos/producto7.jpg', 'Capacitor 1nF', 'Capacitor ceramico', '3.00', '5', 4, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(1, './img/Fotos/producto8.jpg', 'Resistencia 100k ohm', 'Resistencia 1/4W', '1.50', '10', 1, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(2, './img/Fotos/producto9.jpg', 'Compuerta AND', 'Compuerta logica SN74LS08N', '15.00', '7', 3, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(1, './img/Fotos/producto10.jpg', 'Compuerta OR', 'Compuerta logica SN74LS32N', '10.00', '57', 3, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(1, './img/Fotos/producto11.jpg', 'Cables jumper', '10 jumpers macho-hembra', '5.00', '10', 5, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(1, './img/Fotos/producto12.jpg', 'Led verde', 'Led verde marca x', '3.00', '15', 2, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(2, './img/Fotos/producto13.jpg', 'Capacitor 100 uF', 'Capacitor a 16V', '3.00', '8', 4, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(2, './img/Fotos/producto14.jpg', 'Led blanco', 'Led ultrabrillante', '3.00', '15', 2, 1);
INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
(1, './img/Fotos/producto15.jpg', 'Resistencia 550 ohm', 'Resistencia 1/4W', '1.00', '10', 1, 1);

/*INSERT INTO State (Description) VALUES ('En camino');
INSERT INTO State (Description) VALUES ('Entregado');
INSERT INTO State (Description) VALUES ('Perdido');
INSERT INTO State (Description) VALUES ('Cancelado');

INSERT INTO Sell_Buy(Product_ID, State_ID, UserInfo_ID, DateStart, kindPay) VALUES 
(1, 1, 1, '2019-09-19 09:27:55', 'Efectivo');*/