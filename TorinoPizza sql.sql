CREATE DATABASE TorinoPizza;

USE TorinoPizza;

CREATE TABLE Postnummer (
	Postnr char(4) PRIMARY KEY,
    Bynavn varchar(255)
);

CREATE TABLE Kundeoplysninger(
	KundeID int AUTO_INCREMENT PRIMARY KEY,
    Navn varchar(255),
    Adresse varchar(255),
    Postnummer char(4),
    Telefonnummer char(8),
    Mailadresse varchar(255),
    FOREIGN KEY (Postnummer) REFERENCES Postnummer(Postnr)
);

CREATE TABLE ordreregistrering(
	OrdrerID int AUTO_INCREMENT PRIMARY KEY,
    KundeID int,
    Ordrertidspunkt datetime,
    Totalpris double,
    FOREIGN KEY (KundeID) REFERENCES Kundeoplysninger(KundeID)
);

CREATE TABLE Menu(
	VareID int AUTO_INCREMENT PRIMARY KEY,
    Navn varchar(255),
    Beskrivelse varchar(255),
    Pris double
);

CREATE TABLE Ordrervarer(
	OrdrervarerID int AUTO_INCREMENT PRIMARY KEY,
    OrdrerID int,
    MenuID int,
    Kvantitet int,
    Tilpasning varchar(255),
    LinjePris double,
    FOREIGN KEY (OrdrerID) REFERENCES ordreregistrering(OrdrerID),
    FOREIGN KEY (MenuID) REFERENCES Menu(VareID)
);

