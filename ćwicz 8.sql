--1. Wykorzystuj�c wyra�enie CTE zbuduj zapytanie, kt�re znajdzie informacje na temat stawki 
--pracownika oraz jego danych, a nast�pnie zapisze je do tabeli tymczasowej 
--TempEmployeeInfo. Rozwi�� w oparciu o AdventureWorks.


SELECT *
FROM HumanResources.EmployeePayHistory; --stawka

SELECT *
FROM Person.Person; --imie nazwisko id

WITH Dane_pracownika (ID, Imi�, Nazwisko)
AS
(
	SELECT	BusinessEntityID AS ID, FirstName AS Imi�, LastName AS Nazwisko
	FROM Person.Person 
),

Wynagrodzenie_pracownika (Id, Wynagrodzenie)
AS
(
	SELECT BusinessEntityID AS Id, Rate AS Wynagrodzenie
	FROM HumanResources.EmployeePayHistory 
		
)
INSERT INTO #TempEmployeeInfo
SELECT Dane_pracownika.ID, Imi�, Nazwisko, Wynagrodzenie
FROM Dane_pracownika
JOIN Wynagrodzenie_pracownika ON  Wynagrodzenie_pracownika.Id = Dane_pracownika.ID;


CREATE TABLE #TempEmployeeInfo
(	ID INT NOT NULL,
	Imi� nvarchar(50) NOT NULL,
	Nazwisko nvarchar(50) NOT NULL,
	Wynagrodzenie  money NOT NULL,	
);

Drop table #TempEmployeeInfo

SELECT *
FROM #TempEmployeeInfo;



--2. Uzyskaj informacje na temat przychod�w ze sprzeda�y wed�ug firmy i kontaktu (za pomoc� 
--CTE i bazy AdventureWorksL). Wynik powinien wygl�da� nast�puj�co:
SELECT *
FROM SalesLT.SalesOrderHeader --przychodySELECT *
FROM SalesLT.Customer; --kontaktyWITH Przychody( ID, Przych�d)AS(	SELECT CustomerID AS ID, TotalDue AS Przych�d
	FROM SalesLT.SalesOrderHeader 
),Kontakty (Kontakt, Id)AS(
    SELECT CompanyName AS Kontakt, CustomerID AS Id
    FROM SalesLT.Customer )SELECT Kontakt, Przych�d
FROM Przychody 
JOIN Kontakty ON Kontakty.Id = Przychody.ID
ORDER BY Kontakt;

--3. Napisz zapytanie, kt�re zwr�ci warto�� sprzeda�y dla poszczeg�lnych kategorii produkt�w.
--Wykorzystaj CTE i baz� AdventureWorksLT.

SELECT *
FROM SalesLT.Product --ProductCategoryId , ProductIDSELECT *FROM SalesLT.ProductCategory; -- Name, ProductCategoryIDSELECT *
FROM SalesLT.SalesOrderDetail; --SalesId , LineTotal

WITH Produkty_klucze (ProductCategoryID, ProductID)
AS
(
	SELECT ProductCategoryID , ProductID
	FROM SalesLT.Product 
),
Produkty_nazwy (ProductCategoryID, Nazwa)
AS 
(
	SELECT ProductCategoryID, Name AS Nazwa
	FROM SalesLT.ProductCategory 
),

Warto�� (ProductID, wartosc)
AS
(
	SELECT ProductID, LineTotal AS wartosc
	FROM SalesLT.SalesOrderDetail 
)
SELECT Nazwa, SUM(wartosc) AS suma
FROM Produkty_nazwy
JOIN Produkty_klucze ON Produkty_klucze.ProductCategoryID = Produkty_nazwy.ProductCategoryID
JOIN Warto�� ON Warto��.ProductID = Produkty_klucze.ProductID
GROUP BY Nazwa;
