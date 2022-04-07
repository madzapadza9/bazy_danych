--1.Utworz nowa baze danych nazywaj¹c j¹ "firma"
CREATE DATABASE firma;

-- 2.Dodaj do niej schemat o nazwie "rozliczenia"
CREATE SCHEMA rozliczenia;

--3. Dodaj do schematu "rozliczenia" cztery tabele:
CREATE TABLE rozliczenia.pracownicy
(
id_pracownika INT PRIMARY KEY NOT NULL,
imie VARCHAR(50) NOT NULL,
nazwisko VARCHAR(50) NOT NULL,
adres VARCHAR(50),
telefon VARCHAR(14) 
);

CREATE TABLE rozliczenia.godziny
(
id_godziny CHAR(3) PRIMARY KEY NOT NULL,
data_ DATE NOT NULL,
liczba_godzin INT ,
id_pracownika INT  NOT NULL
);
CREATE TABLE rozliczenia.pensje
(
id_pensji INT PRIMARY KEY NOT NULL,
stanowisko VARCHAR(20) NOT NULL,
kwota  FLOAT NOT NULL,
id_premii CHAR(3)
);

CREATE TABLE rozliczenia.premie
(
id_premii CHAR(3) PRIMARY KEY NOT NULL,
rodzaj VARCHAR(20) NOT NULL,
kwota  FLOAT NOT NULL
);

ALTER TABLE rozliczenia.godziny ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);

ALTER TABLE rozliczenia.premie ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);

--4.Wype³nij kazda tabele 10 rekordami

INSERT INTO rozliczenia.pracownicy VALUES ('10' , 'Dalia', 'Nowak', 'Wolna 3 Kraków', '333 000 102');
INSERT INTO rozliczenia.pracownicy VALUES ('11' , 'Wojciech', 'H³asko', 'Prosta 345 Siedlce', '333 242 102');
INSERT INTO rozliczenia.pracownicy VALUES ('12' , 'Stefan', 'Moniak ', 'M³yñska 34 Kraków', '676 787 102');
INSERT INTO rozliczenia.pracownicy VALUES ('13' , 'Alicja', 'Walendzia', 'Akacjowa 3 Katowice', '111 222 002');
INSERT INTO rozliczenia.pracownicy VALUES ('14' , 'Anton', 'Wolsk', 'Wolska 89 Gdañsk', '787 345 013');
INSERT INTO rozliczenia.pracownicy VALUES ('15' , 'Robert', 'Moñski', 'Krucza 12 Gdañsk ', '787 345 016');
INSERT INTO rozliczenia.pracownicy VALUES ('16' , 'Helena', 'Helena', 'Rzeczna 44 Kraków', '232 777 901');
INSERT INTO rozliczenia.pracownicy VALUES ('17' , 'Rafa³', 'Czarnkowska', 'Boczna 23/91','232 777 904');
INSERT INTO rozliczenia.pracownicy VALUES ('18' , ' Nina', 'Górka', 'Trakt 10 Do³owe', '232 777 907');
INSERT INTO rozliczenia.pracownicy VALUES ('19' , 'Aleksandra', 'Sokó³', 'Akacjowa 6  Katowice', '564 345 307');


INSERT INTO rozliczenia.godziny VALUES ('H01' , '2021-12-12', '183', '19');
INSERT INTO rozliczenia.godziny VALUES ('H02' , '2021-12-12', '190', '10');
INSERT INTO rozliczenia.godziny VALUES ('H03' , '2021-12-12', '210', '11');
INSERT INTO rozliczenia.godziny VALUES ('H04' , '2021-12-12', '150', '17');
INSERT INTO rozliczenia.godziny VALUES ('H05' , '2021-12-12','170', '16');
INSERT INTO rozliczenia.godziny VALUES ('H06' , '2021-12-12', '198', '15');
INSERT INTO rozliczenia.godziny VALUES ('H07' , '2021-12-12', '155', '18');
INSERT INTO rozliczenia.godziny VALUES ('H08' , '2021-12-12', '164', '12');
INSERT INTO rozliczenia.godziny VALUES ('H09' , '2021-12-12', '187', '14');
INSERT INTO rozliczenia.godziny VALUES ('H10' , '2021-12-12', '167', '13');

INSERT INTO rozliczenia.premie VALUES ('P01' , 'regulaminowa', '100');
INSERT INTO rozliczenia.premie VALUES ('P02' , 'uznaniowa', '200');
INSERT INTO rozliczenia.premie VALUES ('P03' , 'œwi¹teczna', '300');
INSERT INTO rozliczenia.premie VALUES ('P04' , 'urodzinowa', '400');

INSERT INTO rozliczenia.pensje VALUES ('100' , 'Dyrektor Naczelny', '12000','P03');
INSERT INTO rozliczenia.pensje VALUES ('101' , 'G³ówny Technolog', '8000', 'P03' );
INSERT INTO rozliczenia.pensje VALUES ('102' , 'Sprzedawca', '4000','P03' );
INSERT INTO rozliczenia.pensje VALUES ('103' , 'Sprzedawca', '4000', 'P03');
INSERT INTO rozliczenia.pensje VALUES ('104' , 'Sprzedawca', '4000','P03' );
INSERT INTO rozliczenia.pensje VALUES ('105' , 'Dyrektor Marketingu', '6000', 'P03');
INSERT INTO rozliczenia.pensje VALUES ('106' , 'Dyrektor Informatyki', '8000', 'P03');
INSERT INTO rozliczenia.pensje VALUES ('107' , 'Asystent', '3500','P03');
INSERT INTO rozliczenia.pensje VALUES ('108' , 'Analityk Finansowy', '5000','P03' );
INSERT INTO rozliczenia.pensje VALUES ('109' , 'G³ówny Ksiêgowy', '5000', 'P03');


--5. Za pomoca zapytania w sql wyœwietl nazwiska pracowników i ich adresy.

SELECT nazwisko, adres FROM rozliczenia.pracownicy;


--6.Napisz zapytanie które przekonwertuje datê w tabeli godziny tak aby wyswietlana by³a informacja jaki to dzien tygodnia i jaki meisiac

SELECT DATEPART(MONTH, data_) AS 'miesiac', DATEPART(DAY, data_) AS 'dzien' FROM rozliczenia.godziny;

SELECT * FROM rozliczenia.pensje;

--7. W tabeli pensje zmien nazwe atrybutu kwota na kwota brutto oraz dodaj nowy o nazwie kwota_netto. Oblicz kwote netto i zaktualizuj wartosci w tabeli.

EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto';
ALTER TABLE rozliczenia.pensje ADD kwota_netto  AS (kwota_brutto*0.77) PERSISTED;
SELECT * FROM rozliczenia.pensje;

