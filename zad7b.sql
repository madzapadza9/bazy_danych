
 --1. Napisz procedur� wypisuj�c� do konsoli ci�g Fibonacciego. Procedura musi przyjmowa� jako 
--argument wej�ciowy liczb� n. Generowanie ci�gu Fibonacciego musi zosta� 
--zaimplementowane jako osobna funkcja, wywo�ywana przez procedur�.

CREATE FUNCTION Fn_Fibb(@n int)
RETURNS @numbers TABLE(number int)
AS
BEGIN
	DECLARE @num1 INT = 0,@num2 INT =1,@i INT=0,@temp INT
	INSERT INTO @numbers VALUES(@num1),(@num2)
	WHILE (@i<=@n-2)
	BEGIN 
		INSERT INTO @numbers VALUES(@num2+@num1)
		SET @temp = @num2
		SET @num2 = @num2 + @num1
		SET @num1 = @temp
		SET @i += 1
	END	
	RETURN 
END
DROP FUNCTION Fn_Fibb;

CREATE PROCEDURE proc_fibb
@nr INT
AS
BEGIN
Select * from Fn_Fibb(@nr) 
END;

EXEC proc_fibb 8


DROP PROCEDURE proc_fibb;



--2. Napisz trigger DML, kt�ry po wprowadzeniu danych do tabeli Persons zmodyfikuje nazwisko tak, aby by�o napisane du�ymi literami.

CREATE TRIGGER
uppercase
ON Person.Person
AFTER 
INSERT,UPDATE
AS
BEGIN
UPDATE Person.Person SET LastName= UPPER(LastName)
END;

DROP TRIGGER Person.uppercase

SELECT*FROM Person.Person

UPDATE Person.Person
SET FirstName='Bob'
WHERE BusinessEntityID=1
			


	

--3. Przygotuj trigger �taxRateMonitoring�, kt�ry wy�wietli komunikat o b��dzie, je�eli nast�pi zmiana warto�ci w polu �TaxRate� o wi�cej ni� 30%.

CREATE TRIGGER 
taxRateMonitoring
ON Sales.SalesTaxRate
INSTEAD OF UPDATE 
AS 
BEGIN
DECLARE @old_tax int, @new_tax int;
SET @old_tax = (SELECT TaxRate 
				FROM deleted) 
SET @new_tax = (SELECT TaxRate 
				FROM inserted)
	
		IF @new_tax > 1.3*@old_tax 
			print '*B��D* Nowa warto�� przekracza dopuszczalne progi'
		ELSE
			UPDATE Sales.SalesTaxRate
			SET TaxRate = @new_tax
			WHERE SalesTaxRateID =
						( SELECT SalesTaxRateID
						  FROM inserted)

		END;

		
DROP TRIGGER Sales.taxRateMonitoring

SELECT*FROM Sales.SalesTaxRate

UPDATE Sales.SalesTaxRate
SET TaxRate=30.00
WHERE SalesTaxRateID=1


