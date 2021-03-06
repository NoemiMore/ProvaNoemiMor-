USE [master]
GO
/****** Object:  Database [PizzeriaAcademyProva]    Script Date: 08/10/2021 15:13:42 ******/
CREATE DATABASE [PizzeriaAcademyProva]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PizzeriaAcademyProva', FILENAME = N'C:\Users\noemi.more\PizzeriaAcademyProva.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PizzeriaAcademyProva_log', FILENAME = N'C:\Users\noemi.more\PizzeriaAcademyProva_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PizzeriaAcademyProva] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PizzeriaAcademyProva].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PizzeriaAcademyProva] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET ARITHABORT OFF 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET  MULTI_USER 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PizzeriaAcademyProva] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PizzeriaAcademyProva] SET QUERY_STORE = OFF
GO
USE [PizzeriaAcademyProva]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [PizzeriaAcademyProva]
GO
/****** Object:  Table [dbo].[Pizza]    Script Date: 08/10/2021 15:13:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pizza](
	[IdPizza] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](30) NOT NULL,
	[Prezzo] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Pizza] PRIMARY KEY CLUSTERED 
(
	[IdPizza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[ListinoPizze]    Script Date: 08/10/2021 15:13:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create function [dbo].[ListinoPizze] ()
returns table

AS


return
select p.Nome as [Nome Pizza], p.Prezzo as [Prezzo Pizza]
from Pizza p
GO
/****** Object:  Table [dbo].[Ingrediente]    Script Date: 08/10/2021 15:13:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingrediente](
	[IdIngrediente] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](30) NOT NULL,
	[Costo] [decimal](18, 2) NOT NULL,
	[ScorteInMagazzino] [int] NOT NULL,
 CONSTRAINT [PK_Ingrediente] PRIMARY KEY CLUSTERED 
(
	[IdIngrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PizzaIngrediente]    Script Date: 08/10/2021 15:13:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PizzaIngrediente](
	[IdPizza] [int] NOT NULL,
	[IdIngrediente] [int] NOT NULL,
 CONSTRAINT [PK_PizzaIngrediente] PRIMARY KEY CLUSTERED 
(
	[IdPizza] ASC,
	[IdIngrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[ListinoPizzeConIngr]    Script Date: 08/10/2021 15:13:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[ListinoPizzeConIngr](@nomeIngrediente varchar(30))
returns table

AS
return
select p.Nome as [Nome Pizza], p.Prezzo as [Prezzo Pizza]
from Pizza p JOIN PizzaIngrediente ping ON p.IdPizza=ping.IdPizza
JOIN Ingrediente i on i.IdIngrediente=ping.IdIngrediente
where i.Nome=@nomeIngrediente
GO
SET IDENTITY_INSERT [dbo].[Ingrediente] ON 

INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (1, N'Pomodoro', CAST(1.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (2, N'Mozzarella', CAST(1.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (3, N'Mozzarella Bufala', CAST(1.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (4, N'Salame', CAST(1.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (5, N'Funghi', CAST(1.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (6, N'Carciofi', CAST(1.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (7, N'Cotto', CAST(1.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (8, N'Olive', CAST(1.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (9, N'Funghi Porcini', CAST(1.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (10, N'Rucola', CAST(1.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (11, N'Grana', CAST(1.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (12, N'Stracchino', CAST(1.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (13, N'Speak', CAST(1.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (14, N'verdura di stagione', CAST(1.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (15, N'Patate', CAST(1.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (16, N'Salsiccia', CAST(1.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (17, N'Pomodorini', CAST(1.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (18, N'Ricotta', CAST(1.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (19, N'Gorgonzola', CAST(1.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (20, N'Provola', CAST(1.00 AS Decimal(18, 2)), 8)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (21, N'Basilico', CAST(1.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (22, N'Bresaola', CAST(1.00 AS Decimal(18, 2)), 15)
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nome], [Costo], [ScorteInMagazzino]) VALUES (23, N'Pomodoro Fresco', CAST(1.00 AS Decimal(18, 2)), 11)
SET IDENTITY_INSERT [dbo].[Ingrediente] OFF
GO
SET IDENTITY_INSERT [dbo].[Pizza] ON 

INSERT [dbo].[Pizza] ([IdPizza], [Nome], [Prezzo]) VALUES (1, N'Margherita', CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[Pizza] ([IdPizza], [Nome], [Prezzo]) VALUES (2, N'Bufala', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[Pizza] ([IdPizza], [Nome], [Prezzo]) VALUES (3, N'Diavola', CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Pizza] ([IdPizza], [Nome], [Prezzo]) VALUES (4, N'QuattroStagioni', CAST(6.50 AS Decimal(18, 2)))
INSERT [dbo].[Pizza] ([IdPizza], [Nome], [Prezzo]) VALUES (5, N'Porcini', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[Pizza] ([IdPizza], [Nome], [Prezzo]) VALUES (6, N'Dionisio', CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[Pizza] ([IdPizza], [Nome], [Prezzo]) VALUES (7, N'Ortolana', CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[Pizza] ([IdPizza], [Nome], [Prezzo]) VALUES (8, N'Patate e Salsiccia', CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Pizza] ([IdPizza], [Nome], [Prezzo]) VALUES (9, N'Pomodorini', CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Pizza] ([IdPizza], [Nome], [Prezzo]) VALUES (10, N'Quattro Formaggi', CAST(7.50 AS Decimal(18, 2)))
INSERT [dbo].[Pizza] ([IdPizza], [Nome], [Prezzo]) VALUES (11, N'Caprese', CAST(7.50 AS Decimal(18, 2)))
INSERT [dbo].[Pizza] ([IdPizza], [Nome], [Prezzo]) VALUES (12, N'Zeus', CAST(7.50 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Pizza] OFF
GO
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (1, 1)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (1, 2)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (2, 1)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (2, 3)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (3, 1)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (3, 2)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (3, 4)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (4, 1)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (4, 2)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (4, 5)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (4, 6)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (4, 7)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (4, 8)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (5, 1)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (5, 2)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (5, 9)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (6, 1)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (6, 2)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (6, 10)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (6, 11)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (6, 12)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (6, 13)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (7, 1)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (7, 2)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (7, 14)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (8, 2)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (8, 15)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (8, 16)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (9, 2)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (9, 17)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (9, 18)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (10, 2)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (10, 11)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (10, 19)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (10, 20)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (11, 2)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (11, 21)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (11, 23)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (12, 2)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (12, 10)
INSERT [dbo].[PizzaIngrediente] ([IdPizza], [IdIngrediente]) VALUES (12, 22)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Pizza__7D8FE3B2DEE544E0]    Script Date: 08/10/2021 15:13:42 ******/
ALTER TABLE [dbo].[Pizza] ADD UNIQUE NONCLUSTERED 
(
	[Nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PizzaIngrediente]  WITH CHECK ADD FOREIGN KEY([IdIngrediente])
REFERENCES [dbo].[Ingrediente] ([IdIngrediente])
GO
ALTER TABLE [dbo].[PizzaIngrediente]  WITH CHECK ADD FOREIGN KEY([IdPizza])
REFERENCES [dbo].[Pizza] ([IdPizza])
GO
ALTER TABLE [dbo].[Ingrediente]  WITH CHECK ADD  CONSTRAINT [CHK_CostoIngrediente] CHECK  (([Costo]>(0)))
GO
ALTER TABLE [dbo].[Ingrediente] CHECK CONSTRAINT [CHK_CostoIngrediente]
GO
ALTER TABLE [dbo].[Ingrediente]  WITH CHECK ADD  CONSTRAINT [CHK_ScortaIngrediente] CHECK  (([ScorteInMagazzino]>=(0)))
GO
ALTER TABLE [dbo].[Ingrediente] CHECK CONSTRAINT [CHK_ScortaIngrediente]
GO
ALTER TABLE [dbo].[Pizza]  WITH CHECK ADD  CONSTRAINT [CHK_Prezzo] CHECK  (([Prezzo]>(0)))
GO
ALTER TABLE [dbo].[Pizza] CHECK CONSTRAINT [CHK_Prezzo]
GO
/****** Object:  StoredProcedure [dbo].[DeleteIngredienteDaPizza]    Script Date: 08/10/2021 15:13:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteIngredienteDaPizza]
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
GO
/****** Object:  StoredProcedure [dbo].[InserisciIngredienteAPizza]    Script Date: 08/10/2021 15:13:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InserisciIngredienteAPizza]
 
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
GO
/****** Object:  StoredProcedure [dbo].[InserisciPizza]    Script Date: 08/10/2021 15:13:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InserisciPizza]
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
GO
USE [master]
GO
ALTER DATABASE [PizzeriaAcademyProva] SET  READ_WRITE 
GO
