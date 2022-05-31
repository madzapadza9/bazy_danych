--1. Wykorzystuj¹c wyra¿enie CTE zbuduj zapytanie, które znajdzie informacje na temat stawki 
--pracownika oraz jego danych, a nastêpnie zapisze je do tabeli tymczasowej 
--TempEmployeeInfo. Rozwi¹¿ w oparciu o AdventureWorks.


SELECT *
FROM HumanResources.EmployeePayHistory; --stawka

SELECT *
FROM Person.Person; --imie nazwisko id

WITH Dane_pracownika (ID, Imiê, Nazwisko)
AS
(
	SELECT	BusinessEntityID AS ID, FirstName AS Imiê, LastName AS Nazwisko
	FROM Person.Person 
),

Wynagrodzenie_pracownika (Id, Wynagrodzenie)
AS
(
	SELECT BusinessEntityID AS Id, Rate AS Wynagrodzenie
	FROM HumanResources.EmployeePayHistory 
		
)
INSERT INTO #TempEmployeeInfo
SELECT Dane_pracownika.ID, Imiê, Nazwisko, Wynagrodzenie
FROM Dane_pracownika
JOIN Wynagrodzenie_pracownika ON  Wynagrodzenie_pracownika.Id = Dane_pracownika.ID;


CREATE TABLE #TempEmployeeInfo
(	ID INT NOT NULL,
	Imiê nvarchar(50) NOT NULL,
	Nazwisko nvarchar(50) NOT NULL,
	Wynagrodzenie  money NOT NULL,	
);

Drop table #TempEmployeeInfo

SELECT *
FROM #TempEmployeeInfo;



--2. Uzyskaj informacje na temat przychodów ze sprzeda¿y wed³ug firmy i kontaktu (za pomoc¹ 
--CTE i bazy AdventureWorksL). Wynik powinien wygl¹daæ nastêpuj¹co:
SELECT *
FROM SalesLT.SalesOrderHeader --przychodySELECT *
FROM SalesLT.Customer; --kontaktyWITH Przychody( ID, Przychód)AS(	SELECT CustomerID AS ID, TotalDue AS Przychód
	FROM SalesLT.SalesOrderHeader 
),Kontakty (Kontakt, Id)AS(
    SELECT CompanyName AS Kontakt, CustomerID AS Id
    FROM SalesLT.Customer )SELECT Kontakt, Przychód
FROM Przychody 
JOIN Kontakty ON Kontakty.Id = Przychody.ID
ORDER BY Kontakt;

--3. Napisz zapytanie, które zwróci wartoœæ sprzeda¿y dla poszczególnych kategorii produktów.
--Wykorzystaj CTE i bazê AdventureWorksLT.

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

Wartoœæ (ProductID, wartosc)
AS
(
	SELECT ProductID, LineTotal AS wartosc
	FROM SalesLT.SalesOrderDetail 
)
SELECT Nazwa, SUM(wartosc) AS suma
FROM Produkty_nazwy
JOIN Produkty_klucze ON Produkty_klucze.ProductCategoryID = Produkty_nazwy.ProductCategoryID
JOIN Wartoœæ ON Wartoœæ.ProductID = Produkty_klucze.ProductID
GROUP BY Nazwa;
