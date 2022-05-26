
 --1. Napisz procedurê wypisuj¹c¹ do konsoli ci¹g Fibonacciego. Procedura musi przyjmowaæ jako 
--argument wejœciowy liczbê n. Generowanie ci¹gu Fibonacciego musi zostaæ 
--zaimplementowane jako osobna funkcja, wywo³ywana przez procedurê.

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



--2. Napisz trigger DML, który po wprowadzeniu danych do tabeli Persons zmodyfikuje nazwisko tak, aby by³o napisane du¿ymi literami.

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
			


	

--3. Przygotuj trigger ‘taxRateMonitoring’, który wyœwietli komunikat o b³êdzie, je¿eli nast¹pi zmiana wartoœci w polu ‘TaxRate’ o wiêcej ni¿ 30%.

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
			print '*B£¥D* Nowa wartoœæ przekracza dopuszczalne progi'
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


