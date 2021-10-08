create database PizzeriaAcademyProva

create table Pizza (
	IdPizza INT IDENTITY(1,1),
	Nome VARCHAR(30) NOT NULL unique,
	Prezzo decimal(18,2) NOT NULL,
	constraint CHK_Prezzo CHECK (Prezzo>0),
	CONSTRAINT PK_Pizza PRIMARY KEY (IdPizza)
	);

create table Ingrediente (
	IdIngrediente INT IDENTITY(1,1),
	Nome VARCHAR(30) NOT NULL,
	Costo decimal(18,2) NOT NULL,
	ScorteInMagazzino int NOT NULL,
	constraint CHK_CostoIngrediente CHECK (Costo>0),
	constraint CHK_ScortaIngrediente CHECK (ScorteInMagazzino>=0),
	CONSTRAINT PK_Ingrediente PRIMARY KEY (IdIngrediente)
	);


	create table PizzaIngrediente (
	IdPizza  INT FOREIGN KEY REFERENCES Pizza(IdPizza) NOT NULL,
	IdIngrediente INT FOREIGN KEY REFERENCES Ingrediente(IdIngrediente) NOT NULL,
	
	CONSTRAINT PK_PizzaIngrediente PRIMARY KEY (IdPizza, IdIngrediente)
	);




	--inserimento dati

	--pizza


INSERT INTO Pizza VALUES ('Margherita', 5.00);
INSERT INTO Pizza VALUES ('Bufala', 7.00);
INSERT INTO Pizza VALUES ('Diavola', 6.00);
INSERT INTO Pizza VALUES ('QuattroStagioni', 6.50);
INSERT INTO Pizza VALUES ('Porcini', 7.00);
INSERT INTO Pizza VALUES ('Dionisio', 8.00);
INSERT INTO Pizza VALUES ('Ortolana', 8.00);
INSERT INTO Pizza VALUES ('Patate e Salsiccia', 6.00);
INSERT INTO Pizza VALUES ('Pomodorini', 6.00);
INSERT INTO Pizza VALUES ('Quattro Formaggi', 7.50);
INSERT INTO Pizza VALUES ('Caprese', 7.50);
INSERT INTO Pizza VALUES ('Zeus', 7.50);


	-- ingrediente

	INSERT INTO Ingrediente VALUES ('Pomodoro', 1.00, 10);
	INSERT INTO Ingrediente VALUES ('Mozzarella', 1.00, 10);
	INSERT INTO Ingrediente VALUES ('Mozzarella Bufala', 1.00, 10);
	INSERT INTO Ingrediente VALUES ('Salame', 1.00, 10);
	INSERT INTO Ingrediente VALUES ('Funghi', 1.00, 10);
	INSERT INTO Ingrediente VALUES ('Carciofi', 1.00, 10);
	INSERT INTO Ingrediente VALUES ('Cotto', 1.00, 10);
	INSERT INTO Ingrediente VALUES ('Olive', 1.00, 10);
	INSERT INTO Ingrediente VALUES ('Funghi Porcini', 1.00, 10);
	INSERT INTO Ingrediente VALUES ('Rucola', 1.00, 10);
	INSERT INTO Ingrediente VALUES ('Grana', 1.00, 10);
	INSERT INTO Ingrediente VALUES ('Stracchino', 1.00, 10);
	INSERT INTO Ingrediente VALUES ('Speak', 1.00, 10);
	INSERT INTO Ingrediente VALUES ('verdura di stagione', 1.00, 3);
	INSERT INTO Ingrediente VALUES ('Patate', 1.00, 5);
	INSERT INTO Ingrediente VALUES ('Salsiccia', 1.00, 10);
	INSERT INTO Ingrediente VALUES ('Pomodorini', 1.00, 10);
	INSERT INTO Ingrediente VALUES ('Ricotta', 1.00, 10);
	INSERT INTO Ingrediente VALUES ('Gorgonzola', 1.00, 10);
	INSERT INTO Ingrediente VALUES ('Provola', 1.00, 8);
	INSERT INTO Ingrediente VALUES ('Basilico', 1.00, 10);
	INSERT INTO Ingrediente VALUES ('Bresaola', 1.00, 15);
	INSERT INTO Ingrediente VALUES ('Pomodoro Fresco', 1.00, 11);
	
	--PIZZAINGREDIENTE
	INSERT INTO PizzaIngrediente VALUES (1,1);
	INSERT INTO PizzaIngrediente VALUES (1,2);-- margherita
	INSERT INTO PizzaIngrediente VALUES (2,1);
	INSERT INTO PizzaIngrediente VALUES (2,3);--bufala
	INSERT INTO PizzaIngrediente VALUES (3,1);
	INSERT INTO PizzaIngrediente VALUES (3,2);
	INSERT INTO PizzaIngrediente VALUES (3,4);-- diavola
	INSERT INTO PizzaIngrediente VALUES (4,1);
	INSERT INTO PizzaIngrediente VALUES (4,2);
	INSERT INTO PizzaIngrediente VALUES (4,5);
	INSERT INTO PizzaIngrediente VALUES (4,6);
	INSERT INTO PizzaIngrediente VALUES (4,7);
	INSERT INTO PizzaIngrediente VALUES (4,8);--quaddto stagioni
	INSERT INTO PizzaIngrediente VALUES (5,1);
	INSERT INTO PizzaIngrediente VALUES (5,2);
	INSERT INTO PizzaIngrediente VALUES (5,9);--porcini
	INSERT INTO PizzaIngrediente VALUES (6,1);
	INSERT INTO PizzaIngrediente VALUES (6,2);
	INSERT INTO PizzaIngrediente VALUES (6,12);
	INSERT INTO PizzaIngrediente VALUES (6,13);
	INSERT INTO PizzaIngrediente VALUES (6,10);
	INSERT INTO PizzaIngrediente VALUES (6,11);--dioniso
	INSERT INTO PizzaIngrediente VALUES (7,1);
	INSERT INTO PizzaIngrediente VALUES (7,2);
	INSERT INTO PizzaIngrediente VALUES (7,14);--ortolana
	INSERT INTO PizzaIngrediente VALUES (8,2);
	INSERT INTO PizzaIngrediente VALUES (8,15);
	INSERT INTO PizzaIngrediente VALUES (8,16);--pat sals
	INSERT INTO PizzaIngrediente VALUES (9,2);
	INSERT INTO PizzaIngrediente VALUES (9,17);
	INSERT INTO PizzaIngrediente VALUES (9,18);--pomodorini
	INSERT INTO PizzaIngrediente VALUES (10,2);
	INSERT INTO PizzaIngrediente VALUES (10,20);
	INSERT INTO PizzaIngrediente VALUES (10,19);
	INSERT INTO PizzaIngrediente VALUES (10,11);--4formaggi
	INSERT INTO PizzaIngrediente VALUES (11,2);
	INSERT INTO PizzaIngrediente VALUES (11,23);
	INSERT INTO PizzaIngrediente VALUES (11,21);--caprese
	INSERT INTO PizzaIngrediente VALUES (12,2);
	INSERT INTO PizzaIngrediente VALUES (12,22);
	INSERT INTO PizzaIngrediente VALUES (12,10);

	



--QUERY


--1) ESTRAZIONE PIZZE>6 EURO

select *
from Pizza p
where p.Prezzo>6.00


--2)pizze piu costose
select * 
from Pizza p
where p.Prezzo=(select MAX(p.Prezzo) from Pizza p)

--3) pizze bianche
select distinct p.Nome, p.Prezzo
from Pizza p join PizzaIngrediente ping on p.IdPizza= ping.IdPizza
join Ingrediente i on i.IdIngrediente=ping.IdIngrediente
where i.Nome<>'Pomodoro'

	--4 pizze che contengono funghi
	

select p.Nome
from Pizza p join PizzaIngrediente ping on p.IdPizza= ping.IdPizza
join Ingrediente i on i.IdIngrediente=ping.IdIngrediente
where i.Nome='Funghi'OR i.Nome='Funghi Porcini'




-- PROCEDURE

--1 INSERIMENTO PIZZA

create procedure InserisciPizza
@nome nvarchar(30),
@prezzo decimal (18,2)
as
begin try
if @prezzo >0
SET @prezzo= null;

insert into Pizza values(@nome, @prezzo)

end try

begin catch
select ERROR_MESSAGE();

END CATCH
go

--execute InserisciPizza 'ConFunghi', -10



-- 2.assegnazione ingrediente a pizza

create procedure InserisciIngredienteAPizza
 
  @nomePizza varchar (30),
  @nomeIngrediente varchar (30)
  

  as
  begin
  BEGIN TRY
  declare @ID_Ingrediente int
  SELECT @ID_Ingrediente= IdIngrediente
  FROM Ingrediente
  WHERE Nome= @nomeIngrediente

  declare @ID_Pizza int
  SELECT @ID_Pizza= IdPizza
  FROM Pizza 
  where Nome=@nomePizza
 
 insert into PizzaIngrediente values (@ID_Pizza,@ID_Ingrediente) 
 end try

 begin catch
 select ERROR_MESSAGE()
	END CATCH

	end
  --execute InserisciIngredienteAPizza (1,22);





  --4 ELIMINA INGREDIENTE DA PIZZA

  create procedure DeleteIngredienteDaPizza
  @nomePizza varchar (30),
  @nomeIngrediente varchar (30)
  as

  begin 

  declare @ID_Pizza int

  select @ID_Pizza=IdPizza
  from Pizza
  where Nome= @nomePizza


  declare @ID_Ingrediente int

  select @ID_Ingrediente= IdIngrediente
  from Ingrediente
  where Nome= @nomeIngrediente

  delete from PizzaIngrediente where IdIngrediente in (
select i.IdIngrediente
from Ingrediente i join PizzaIngrediente ping on i.IdIngrediente=ping.IdIngrediente
where i.IdIngrediente=@ID_Ingrediente)



delete from PizzaiNGREDIENTE where IdPizza IN (select ping.IdPizza
from PizzaIngrediente ping JOIN Pizza p ON ping.IdPizza=p.IdPizza
where p.IdPizza=@ID_Pizza)
end


--execute DeleteIngredienteDaPizza 'pomodoro';




--view

CREATE VIEW MenuPizzeria
as
select p.Nome, p.Prezzo, i.Nome --dovrei fare una lista di ingredienti separata da ,
FROM Pizza p join PizzaIngrediente ping on p.IdPizza=ping.IdPizza
join Ingrediente i on ping.IdIngrediente=i.IdIngrediente


--select * from MenuPizzeria

	
	
--FUNZIONI

--1 LISTINO PIZZE

	create function ListinoPizze ()
returns table

AS


return
select p.Nome as [Nome Pizza], p.Prezzo as [Prezzo Pizza]
from Pizza p
--where p.Nome=@nomePizza AND  p.Prezzo=@prezzoPizza
	
select * from dbo.ListinoPizze();	
	

	--2 listinopizze con paramentro

	create function ListinoPizzeConIngr(@nomeIngrediente varchar(30))
returns table

AS
return
select p.Nome as [Nome Pizza], p.Prezzo as [Prezzo Pizza]
from Pizza p JOIN PizzaIngrediente ping ON p.IdPizza=ping.IdPizza
JOIN Ingrediente i on i.IdIngrediente=ping.IdIngrediente
where i.Nome=@nomeIngrediente

select * from dbo.ListinoPizzeConIngr('Pomodoro');	






	
	select *FROM Pizza
	select *FROM Ingrediente