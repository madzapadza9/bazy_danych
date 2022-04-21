--1.Utworz nowa baze danych nazywaj¹c j¹ "firma"
CREATE DATABASE firma;

-- 2.Dodaj do niej schemat o nazwie "ksiegowosc"
CREATE SCHEMA ksiegowosc;

--3. Dodaj do schematu "ksiegowosc" cztery tabele:
CREATE TABLE ksiegowosc.pracownicy
(
id_pracownika INT PRIMARY KEY NOT NULL,
imie NVARCHAR(50) NOT NULL,
nazwisko NVARCHAR(50) NOT NULL,
adres NVARCHAR(50),
telefon VARCHAR(14) 
);

CREATE TABLE ksiegowosc.godziny
(
id_godziny CHAR(3) PRIMARY KEY NOT NULL,
data_ DATE NOT NULL,
liczba_godzin INT NOT NULL,
id_pracownika INT FOREIGN KEY REFERENCES ksiegowosc.pracownicy(id_pracownika) NOT NULL
);


CREATE TABLE ksiegowosc.pensja
(
id_pensji INT PRIMARY KEY NOT NULL,
stanowisko VARCHAR(20) NOT NULL,
kwota  FLOAT NOT NULL,
);

CREATE TABLE ksiegowosc.premia
(
id_premii CHAR(3) PRIMARY KEY NOT NULL,
rodzaj VARCHAR(20) NOT NULL,
kwota  FLOAT NOT NULL
);

CREATE TABLE ksiegowosc.wynagrodzenie
(
id_wynagrodzenia CHAR(4) PRIMARY KEY NOT NULL,
data_ DATE NOT NULL,
id_pracownika INT FOREIGN KEY REFERENCES ksiegowosc.pracownicy(id_pracownika) NOT NULL,
id_godziny CHAR(3) FOREIGN KEY REFERENCES ksiegowosc.godziny(id_godziny) NOT NULL,
id_pensji INT FOREIGN KEY REFERENCES ksiegowosc.pensja(id_pensji) NOT NULL,
id_premii CHAR(3) FOREIGN KEY REFERENCES ksiegowosc.premia(id_premii)

);


--4.Wype³nij kazda tabele 10 rekordami

INSERT INTO ksiegowosc.pracownicy VALUES (10 , 'Dalia', 'Nowak', 'Wolna 3 Kraków', '333 000 102');
INSERT INTO ksiegowosc.pracownicy VALUES (11 , 'Wojciech', 'H³asko', 'Prosta 345 Siedlce', '333 242 102');
INSERT INTO ksiegowosc.pracownicy VALUES (12 , 'Stefan', 'Moniak ', 'M³yñska 34 Kraków', '676 787 102');
INSERT INTO ksiegowosc.pracownicy VALUES (13 , 'Alicja', 'Walendzia', 'Akacjowa 3 Katowice', '111 222 002');
INSERT INTO ksiegowosc.pracownicy VALUES (14 , 'Anton', 'Wolsk', 'Wolska 89 Gdañsk', '787 345 013');
INSERT INTO ksiegowosc.pracownicy VALUES (15 , 'Robert', 'Moñski', 'Krucza 12 Gdañsk ', '787 345 016');
INSERT INTO ksiegowosc.pracownicy VALUES (16 , 'Helena', 'Helena', 'Rzeczna 44 Kraków', '232 777 901');
INSERT INTO ksiegowosc.pracownicy VALUES (17 , 'Rafa³', 'Czarnkowska', 'Boczna 23/91','232 777 904');
INSERT INTO ksiegowosc.pracownicy VALUES (18 , ' Nina', 'Górka', 'Trakt 10 Do³owe', '232 777 907');
INSERT INTO ksiegowosc.pracownicy VALUES (19 , 'Aleksandra', 'Sokó³', 'Akacjowa 6  Katowice', '564 345 307');

	SELECT * FROM ksiegowosc.pracownicy;


INSERT INTO ksiegowosc.godziny VALUES ('H01' , '2021-12-12', 183, 19);
INSERT INTO ksiegowosc.godziny VALUES ('H02' , '2021-12-12', 190, 10);
INSERT INTO ksiegowosc.godziny VALUES ('H03' , '2021-12-12', 210, 11);
INSERT INTO ksiegowosc.godziny VALUES ('H04' , '2021-12-12', 150, 17);
INSERT INTO ksiegowosc.godziny VALUES ('H05' , '2021-12-12', 170, 16);
INSERT INTO ksiegowosc.godziny VALUES ('H06' , '2021-12-12', 198, 15);
INSERT INTO ksiegowosc.godziny VALUES ('H07' , '2021-12-12', 155, 18);
INSERT INTO ksiegowosc.godziny VALUES ('H08' , '2021-12-12', 164, 12);
INSERT INTO ksiegowosc.godziny VALUES ('H09' , '2021-12-12', 187, 14);
INSERT INTO ksiegowosc.godziny VALUES ('H10' , '2021-12-12', 167, 13);

	SELECT * FROM ksiegowosc.godziny;

INSERT INTO ksiegowosc.pensja VALUES (100 , 'Dyrektor Naczelny', '12000');
INSERT INTO ksiegowosc.pensja VALUES (101 , 'G³ówny Technolog', '8000');
INSERT INTO ksiegowosc.pensja VALUES (102 , 'Sprzedawca', '4000');
INSERT INTO ksiegowosc.pensja VALUES (103 , 'Sprzedawca', '4000');
INSERT INTO ksiegowosc.pensja VALUES (104 , 'Sprzedawca', '4000');
INSERT INTO ksiegowosc.pensja VALUES (105 , 'Dyrektor Marketingu', '6000');
INSERT INTO ksiegowosc.pensja VALUES (106 , 'Informatyk', '8000');
INSERT INTO ksiegowosc.pensja VALUES (107 , 'Asystent', '3500');
INSERT INTO ksiegowosc.pensja VALUES (108 , 'Analityk Finansowy', '5000');
INSERT INTO ksiegowosc.pensja VALUES (109 , 'G³ówny Ksiêgowy', '5000');

	SELECT * FROM ksiegowosc.pensja;


INSERT INTO ksiegowosc.premia VALUES ('P01' , 'regulaminowa', '100');
INSERT INTO ksiegowosc.premia VALUES ('P02' , 'uznaniowa', '200');
INSERT INTO ksiegowosc.premia VALUES ('P03' , 'œwi¹teczna', '300');
INSERT INTO ksiegowosc.premia VALUES ('P04' , 'urodzinowa', '400');

	SELECT * FROM ksiegowosc.premia;

INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WY01' , '2021-12-12', 19 ,'H01' , 109 , 'P02');
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WY02' , '2021-12-12', 10 ,'H02' , 107 , NULL);
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WY03' , '2021-12-12', 11 ,'H03' , 105, 'P01');
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WY04' , '2021-12-12', 17 ,'H04'  , 103 , 'P02');
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WY05' , '2021-12-12', 16 ,'H05' , 101, NULL);
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WY06' , '2021-12-12', 15 ,'H06' , 102, NULL );
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WY07' , '2021-12-12', 18 ,'H07' , 104 , 'P04');
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WY08' , '2021-12-12', 12 ,'H08', 106 , 'P01');
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WY09' , '2021-12-12', 14 ,'H09' , 108 , NULL);
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WY10' , '2021-12-12', 13 ,'H10' , 100 , 'P04');


	SELECT * FROM ksiegowosc.wynagrodzenie;

-- A) Wyœwietl tylko id pracownika oraz jego nazwisko.		SELECT id_pracownika, nazwisko 		FROM ksiegowosc.pracownicy;--B) Wyœwietl id pracowników, których p³aca jest wiêksza ni¿ 1000.				SELECT id_pracownika 		FROM ksiegowosc.wynagrodzenie		WHERE ksiegowosc.wynagrodzenie.id_pensji IN 		(			SELECT id_pensji 			FROM ksiegowosc.pensja			WHERE kwota>6000		);				SELECT id_pracownika 		FROM ksiegowosc.wynagrodzenie		INNER JOIN ksiegowosc.pensja		ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji		WHERE kwota>6000;--C)  Wyœwietl id pracowników nieposiadaj¹cych premii, których p³aca jest wiêksza ni¿ 2000. 				SELECT id_pracownika 		FROM ksiegowosc.wynagrodzenie		WHERE ksiegowosc.wynagrodzenie.id_pensji IN 			(				SELECT id_pensji 				FROM ksiegowosc.pensja				WHERE kwota>6000			) 			AND ksiegowosc.wynagrodzenie.id_premii IS NULL ;				SELECT id_pracownika 		FROM ksiegowosc.wynagrodzenie		INNER JOIN ksiegowosc.pensja			ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji		WHERE ksiegowosc.pensja.kwota>6000 AND ksiegowosc.wynagrodzenie.id_premii IS NULL;--D)  Wyœwietl pracowników, których pierwsza litera imienia zaczyna siê na literê ‘J’.	SELECT imie 	FROM ksiegowosc.pracownicy	WHERE ((ksiegowosc.pracownicy.imie) LIKE 'A%');--E)  Wyœwietl pracowników, których nazwisko zawiera literê ‘n’ oraz imiê koñczy siê na literê ‘a’.	SELECT * FROM ksiegowosc.pracownicy 	WHERE ksiegowosc.pracownicy.imie LIKE '%a' AND ksiegowosc.pracownicy.imie LIKE '%n%';		SELECT * FROM ksiegowosc.pracownicy 	WHERE ksiegowosc.pracownicy.imie LIKE '%n%a';--F)   Wyœwietl imiê i nazwisko pracowników oraz liczbê ich nadgodzin, przyjmuj¹c, i¿ standardowy czas pracy to 160 h miesiêcznie. 	
	
	SELECT imie,nazwisko, nadgodziny = ksiegowosc.godziny.liczba_godzin-160
	FROM Ksiegowosc.Pracownicy
	INNER JOIN ksiegowosc.wynagrodzenie		ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika	INNER JOIN ksiegowosc.godziny		ON ksiegowosc.wynagrodzenie.id_godziny = ksiegowosc.godziny.id_godziny;	WHERE ksiegowosc.godziny.liczba_godzin > 160;--G)  Wyœwietl imiê i nazwisko pracowników, których pensja zawiera siê w przedziale 1500 – 3000 PLN.		SELECT imie,nazwisko	FROM ksiegowosc.pracownicy	WHERE ksiegowosc.pracownicy.id_pracownika IN 	(		SELECT id_pracownika 		FROM ksiegowosc.wynagrodzenie		WHERE ksiegowosc.wynagrodzenie.id_pensji IN 		(			SELECT id_pensji			FROM ksiegowosc.pensja			WHERE ksiegowosc.pensja.kwota BETWEEN 4500 AND 5000		)	);		SELECT imie,nazwisko	FROM ksiegowosc.pracownicy	INNER JOIN ksiegowosc.wynagrodzenie		ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika	INNER JOIN ksiegowosc.pensja		ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji	WHERE ksiegowosc.pensja.kwota BETWEEN 4500 AND 5000;--H)  Wyœwietl imiê i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali premii.			SELECT imie,nazwisko		FROM ksiegowosc.pracownicy		WHERE ksiegowosc.pracownicy.id_pracownika IN 		(			SELECT id_pracownika 			FROM ksiegowosc.wynagrodzenie			WHERE ksiegowosc.wynagrodzenie.id_godziny IN 			(				SELECT id_godziny				FROM ksiegowosc.godziny				WHERE ksiegowosc.godziny.liczba_godzin > 160			)						AND ksiegowosc.wynagrodzenie.id_premii IS NULL		);			SELECT imie,nazwisko		FROM ksiegowosc.pracownicy		INNER JOIN ksiegowosc.wynagrodzenie			ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika		INNER JOIN ksiegowosc.godziny			ON ksiegowosc.wynagrodzenie.id_godziny = ksiegowosc.godziny.id_godziny		WHERE ksiegowosc.godziny.liczba_godzin > 160 AND ksiegowosc.wynagrodzenie.id_premii IS NULL;--I) Uszereguj pracowników wed³ug pensji.			SELECT ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, ksiegowosc.pensja.kwota		FROM ksiegowosc.pracownicy		INNER JOIN ksiegowosc.wynagrodzenie			ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika		INNER JOIN ksiegowosc.pensja			ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji		ORDER BY ksiegowosc.pensja.kwota ;--J) Uszereguj pracowników wed³ug pensji i premii malej¹co.			SELECT ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, ksiegowosc.pensja.kwota, ksiegowosc.premia.kwota		FROM ksiegowosc.pracownicy		INNER JOIN ksiegowosc.wynagrodzenie			ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika		INNER JOIN ksiegowosc.pensja			ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji		LEFT JOIN ksiegowosc.premia			ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii		ORDER BY ksiegowosc.pensja.kwota DESC, ksiegowosc.premia.kwota  DESC;--K) Zlicz i pogrupuj pracowników wed³ug pola ‘stanowisko’.		SELECT COUNT(stanowisko) AS ilosc, stanowisko		FROM ksiegowosc.pensja		GROUP BY ksiegowosc.pensja.stanowisko;--L)  Policz œredni¹, minimaln¹ i maksymaln¹ p³acê dla stanowiska ‘kierownik’ (je¿eli takiego nie masz, to przyjmij dowolne inne).		SELECT MIN(kwota) AS minimalna, MAX(kwota) AS maksymalna, AVG(kwota) AS srednia		FROM ksiegowosc.pensja		WHERE stanowisko = 'Sprzedawca';--M) Policz sumê wszystkich wynagrodzeñ.		SELECT SUM(kwota) AS suma		FROM ksiegowosc.pensja;	--F)  Policz sumê wynagrodzeñ w ramach danego stanowiska.		SELECT SUM(kwota) AS suma , stanowisko		FROM ksiegowosc.pensja		GROUP BY ksiegowosc.pensja.stanowisko;--G) Wyznacz liczbê premii przyznanych dla pracowników danego stanowiska.		SELECT COUNT(ksiegowosc.premia.id_premii) AS ilosc, stanowisko		FROM ksiegowosc.pensja		INNER JOIN ksiegowosc.wynagrodzenie				ON ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji		INNER JOIN ksiegowosc.premia				ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii		GROUP BY ksiegowosc.pensja.stanowisko;--H) Usuñ wszystkich pracowników maj¹cych pensjê mniejsz¹ ni¿ 1200 z³.			DELETE FROM ksiegowosc.wynagrodzenie		WHERE ksiegowosc.wynagrodzenie.id_pensji IN 		(			SELECT id_pensji 			FROM ksiegowosc.pensja			WHERE kwota<1200		);	