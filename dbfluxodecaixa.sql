USE [master]
GO
/****** Object:  Database [Fluxocaixa]    Script Date: 22/07/2021 23:14:29 ******/
CREATE DATABASE [Fluxocaixa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fluxocaixa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Fluxocaixa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Fluxocaixa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Fluxocaixa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Fluxocaixa] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fluxocaixa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fluxocaixa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fluxocaixa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fluxocaixa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fluxocaixa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fluxocaixa] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fluxocaixa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Fluxocaixa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fluxocaixa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fluxocaixa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fluxocaixa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fluxocaixa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fluxocaixa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fluxocaixa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fluxocaixa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fluxocaixa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Fluxocaixa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fluxocaixa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fluxocaixa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fluxocaixa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fluxocaixa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fluxocaixa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fluxocaixa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fluxocaixa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Fluxocaixa] SET  MULTI_USER 
GO
ALTER DATABASE [Fluxocaixa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fluxocaixa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fluxocaixa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fluxocaixa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Fluxocaixa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Fluxocaixa] SET QUERY_STORE = OFF
GO
USE [Fluxocaixa]
GO
/****** Object:  Table [dbo].[Aluno]    Script Date: 22/07/2021 23:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aluno](
	[alunoid] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](150) NOT NULL,
	[sexo] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Aluno] PRIMARY KEY CLUSTERED 
(
	[alunoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 22/07/2021 23:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[clienteId] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](300) NULL,
	[cpf] [varchar](11) NOT NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[clienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 22/07/2021 23:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[cursoid] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[cursoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[despesa]    Script Date: 22/07/2021 23:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[despesa](
	[despesaId] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](300) NOT NULL,
 CONSTRAINT [PK_despesa] PRIMARY KEY CLUSTERED 
(
	[despesaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fluxodecaixa]    Script Date: 22/07/2021 23:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fluxodecaixa](
	[fluxodecaixaid] [int] IDENTITY(1,1) NOT NULL,
	[data] [date] NOT NULL,
	[qtd] [float] NOT NULL,
	[valorproduto] [money] NOT NULL,
	[tipodemovimento] [varchar](1) NOT NULL,
	[despesaId] [int] NULL,
	[fornecedorId] [int] NULL,
	[produtoId] [int] NULL,
	[clienteId] [int] NULL,
	[tipodelancamentoId] [int] NOT NULL,
 CONSTRAINT [PK_fluxodecaixa] PRIMARY KEY CLUSTERED 
(
	[fluxodecaixaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fornecedor]    Script Date: 22/07/2021 23:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fornecedor](
	[fornecedorId] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](300) NOT NULL,
 CONSTRAINT [PK_fornecedor] PRIMARY KEY CLUSTERED 
(
	[fornecedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Listapresenca]    Script Date: 22/07/2021 23:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Listapresenca](
	[listadepresencaid] [int] IDENTITY(1,1) NOT NULL,
	[alunoid] [int] NOT NULL,
	[turmaid] [int] NOT NULL,
	[cursoid] [int] NOT NULL,
	[professorid] [int] NOT NULL,
	[presenca] [bit] NOT NULL,
	[data] [date] NOT NULL,
 CONSTRAINT [PK_Listapresenca] PRIMARY KEY CLUSTERED 
(
	[listadepresencaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[produto]    Script Date: 22/07/2021 23:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[produto](
	[produtoId] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](300) NOT NULL,
	[un] [varchar](10) NOT NULL,
 CONSTRAINT [PK_produto] PRIMARY KEY CLUSTERED 
(
	[produtoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Professor]    Script Date: 22/07/2021 23:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professor](
	[professorid] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Professor] PRIMARY KEY CLUSTERED 
(
	[professorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipodelancamento]    Script Date: 22/07/2021 23:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipodelancamento](
	[tipolancamentoId] [int] IDENTITY(1,1) NOT NULL,
	[descrição] [varchar](30) NOT NULL,
 CONSTRAINT [PK_tipodelancamento] PRIMARY KEY CLUSTERED 
(
	[tipolancamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turma]    Script Date: 22/07/2021 23:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turma](
	[turmaid] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Turma] PRIMARY KEY CLUSTERED 
(
	[turmaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 22/07/2021 23:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nomeUsuario] [varchar](100) NOT NULL,
	[senha] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Aluno] ON 

INSERT [dbo].[Aluno] ([alunoid], [nome], [sexo]) VALUES (1, N'Rodrigo dos Santos de Souza', N'M')
INSERT [dbo].[Aluno] ([alunoid], [nome], [sexo]) VALUES (2, N'Silvio Dias Ferreira', N'M')
INSERT [dbo].[Aluno] ([alunoid], [nome], [sexo]) VALUES (3, N'Antônio Anes', N'M')
INSERT [dbo].[Aluno] ([alunoid], [nome], [sexo]) VALUES (4, N'Emily', N'F')
INSERT [dbo].[Aluno] ([alunoid], [nome], [sexo]) VALUES (5, N'Paullo Quadros', N'M')
SET IDENTITY_INSERT [dbo].[Aluno] OFF
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([clienteId], [nome], [cpf]) VALUES (1, N'Joao das Coves', N'04352222100')
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Curso] ON 

INSERT [dbo].[Curso] ([cursoid], [descricao]) VALUES (1, N'Engenharia de Software')
INSERT [dbo].[Curso] ([cursoid], [descricao]) VALUES (2, N'Sistemas de Informação')
SET IDENTITY_INSERT [dbo].[Curso] OFF
GO
SET IDENTITY_INSERT [dbo].[despesa] ON 

INSERT [dbo].[despesa] ([despesaId], [descricao]) VALUES (7, N'Conta de energia')
INSERT [dbo].[despesa] ([despesaId], [descricao]) VALUES (8, N'Conta de água')
INSERT [dbo].[despesa] ([despesaId], [descricao]) VALUES (9, N'Conta de telefone')
INSERT [dbo].[despesa] ([despesaId], [descricao]) VALUES (10, N'Conta de internet')
SET IDENTITY_INSERT [dbo].[despesa] OFF
GO
SET IDENTITY_INSERT [dbo].[fluxodecaixa] ON 

INSERT [dbo].[fluxodecaixa] ([fluxodecaixaid], [data], [qtd], [valorproduto], [tipodemovimento], [despesaId], [fornecedorId], [produtoId], [clienteId], [tipodelancamentoId]) VALUES (1, CAST(N'2021-01-01' AS Date), 1, 1.0000, N'E', NULL, NULL, 7, 1, 1)
SET IDENTITY_INSERT [dbo].[fluxodecaixa] OFF
GO
SET IDENTITY_INSERT [dbo].[fornecedor] ON 

INSERT [dbo].[fornecedor] ([fornecedorId], [nome]) VALUES (1, N'Energisa')
INSERT [dbo].[fornecedor] ([fornecedorId], [nome]) VALUES (2, N'águas guariroba')
INSERT [dbo].[fornecedor] ([fornecedorId], [nome]) VALUES (3, N'Oi')
INSERT [dbo].[fornecedor] ([fornecedorId], [nome]) VALUES (4, N'Claro')
SET IDENTITY_INSERT [dbo].[fornecedor] OFF
GO
SET IDENTITY_INSERT [dbo].[Listapresenca] ON 

INSERT [dbo].[Listapresenca] ([listadepresencaid], [alunoid], [turmaid], [cursoid], [professorid], [presenca], [data]) VALUES (1, 1, 1, 1, 1, 1, CAST(N'2021-06-30' AS Date))
INSERT [dbo].[Listapresenca] ([listadepresencaid], [alunoid], [turmaid], [cursoid], [professorid], [presenca], [data]) VALUES (2, 4, 1, 1, 1, 1, CAST(N'2021-06-30' AS Date))
INSERT [dbo].[Listapresenca] ([listadepresencaid], [alunoid], [turmaid], [cursoid], [professorid], [presenca], [data]) VALUES (3, 5, 1, 1, 1, 1, CAST(N'2021-06-30' AS Date))
INSERT [dbo].[Listapresenca] ([listadepresencaid], [alunoid], [turmaid], [cursoid], [professorid], [presenca], [data]) VALUES (4, 2, 1, 2, 1, 1, CAST(N'2021-06-30' AS Date))
INSERT [dbo].[Listapresenca] ([listadepresencaid], [alunoid], [turmaid], [cursoid], [professorid], [presenca], [data]) VALUES (5, 3, 1, 1, 1, 1, CAST(N'2021-06-30' AS Date))
INSERT [dbo].[Listapresenca] ([listadepresencaid], [alunoid], [turmaid], [cursoid], [professorid], [presenca], [data]) VALUES (6, 1, 1, 1, 1, 1, CAST(N'2021-07-01' AS Date))
INSERT [dbo].[Listapresenca] ([listadepresencaid], [alunoid], [turmaid], [cursoid], [professorid], [presenca], [data]) VALUES (7, 4, 1, 1, 1, 1, CAST(N'2021-07-01' AS Date))
INSERT [dbo].[Listapresenca] ([listadepresencaid], [alunoid], [turmaid], [cursoid], [professorid], [presenca], [data]) VALUES (8, 5, 1, 1, 1, 1, CAST(N'2021-07-01' AS Date))
INSERT [dbo].[Listapresenca] ([listadepresencaid], [alunoid], [turmaid], [cursoid], [professorid], [presenca], [data]) VALUES (9, 2, 1, 1, 1, 1, CAST(N'2021-07-01' AS Date))
INSERT [dbo].[Listapresenca] ([listadepresencaid], [alunoid], [turmaid], [cursoid], [professorid], [presenca], [data]) VALUES (10, 3, 1, 1, 1, 1, CAST(N'2021-07-01' AS Date))
SET IDENTITY_INSERT [dbo].[Listapresenca] OFF
GO
SET IDENTITY_INSERT [dbo].[produto] ON 

INSERT [dbo].[produto] ([produtoId], [descricao], [un]) VALUES (7, N'Bolo fubá', N'un')
INSERT [dbo].[produto] ([produtoId], [descricao], [un]) VALUES (8, N'Torta de maçã', N'un')
INSERT [dbo].[produto] ([produtoId], [descricao], [un]) VALUES (9, N'Bolo de chocolate', N'un')
INSERT [dbo].[produto] ([produtoId], [descricao], [un]) VALUES (10, N'Bolo de Milho', N'un')
INSERT [dbo].[produto] ([produtoId], [descricao], [un]) VALUES (11, N'pão de queijo', N'un')
INSERT [dbo].[produto] ([produtoId], [descricao], [un]) VALUES (12, N'Bolo fubá', N'un')
SET IDENTITY_INSERT [dbo].[produto] OFF
GO
SET IDENTITY_INSERT [dbo].[Professor] ON 

INSERT [dbo].[Professor] ([professorid], [nome]) VALUES (1, N'WMaldonado')
SET IDENTITY_INSERT [dbo].[Professor] OFF
GO
SET IDENTITY_INSERT [dbo].[tipodelancamento] ON 

INSERT [dbo].[tipodelancamento] ([tipolancamentoId], [descrição]) VALUES (1, N'movimentação')
SET IDENTITY_INSERT [dbo].[tipodelancamento] OFF
GO
SET IDENTITY_INSERT [dbo].[Turma] ON 

INSERT [dbo].[Turma] ([turmaid], [descricao]) VALUES (1, N'H1')
INSERT [dbo].[Turma] ([turmaid], [descricao]) VALUES (2, N'H2')
SET IDENTITY_INSERT [dbo].[Turma] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([id], [nomeUsuario], [senha]) VALUES (1, N'rodrigo', N'123456')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[fluxodecaixa]  WITH CHECK ADD  CONSTRAINT [FK_fluxodecaixa_cliente] FOREIGN KEY([clienteId])
REFERENCES [dbo].[cliente] ([clienteId])
GO
ALTER TABLE [dbo].[fluxodecaixa] CHECK CONSTRAINT [FK_fluxodecaixa_cliente]
GO
ALTER TABLE [dbo].[fluxodecaixa]  WITH CHECK ADD  CONSTRAINT [FK_fluxodecaixa_despesa] FOREIGN KEY([despesaId])
REFERENCES [dbo].[despesa] ([despesaId])
GO
ALTER TABLE [dbo].[fluxodecaixa] CHECK CONSTRAINT [FK_fluxodecaixa_despesa]
GO
ALTER TABLE [dbo].[fluxodecaixa]  WITH CHECK ADD  CONSTRAINT [FK_fluxodecaixa_fornecedor] FOREIGN KEY([fornecedorId])
REFERENCES [dbo].[fornecedor] ([fornecedorId])
GO
ALTER TABLE [dbo].[fluxodecaixa] CHECK CONSTRAINT [FK_fluxodecaixa_fornecedor]
GO
ALTER TABLE [dbo].[fluxodecaixa]  WITH CHECK ADD  CONSTRAINT [FK_fluxodecaixa_produto] FOREIGN KEY([produtoId])
REFERENCES [dbo].[produto] ([produtoId])
GO
ALTER TABLE [dbo].[fluxodecaixa] CHECK CONSTRAINT [FK_fluxodecaixa_produto]
GO
ALTER TABLE [dbo].[fluxodecaixa]  WITH CHECK ADD  CONSTRAINT [FK_fluxodecaixa_tipodelancamento] FOREIGN KEY([tipodelancamentoId])
REFERENCES [dbo].[tipodelancamento] ([tipolancamentoId])
GO
ALTER TABLE [dbo].[fluxodecaixa] CHECK CONSTRAINT [FK_fluxodecaixa_tipodelancamento]
GO
ALTER TABLE [dbo].[Listapresenca]  WITH CHECK ADD  CONSTRAINT [FK_Listapresenca_Aluno] FOREIGN KEY([alunoid])
REFERENCES [dbo].[Aluno] ([alunoid])
GO
ALTER TABLE [dbo].[Listapresenca] CHECK CONSTRAINT [FK_Listapresenca_Aluno]
GO
ALTER TABLE [dbo].[Listapresenca]  WITH CHECK ADD  CONSTRAINT [FK_Listapresenca_Curso] FOREIGN KEY([cursoid])
REFERENCES [dbo].[Curso] ([cursoid])
GO
ALTER TABLE [dbo].[Listapresenca] CHECK CONSTRAINT [FK_Listapresenca_Curso]
GO
ALTER TABLE [dbo].[Listapresenca]  WITH CHECK ADD  CONSTRAINT [FK_Listapresenca_Professor] FOREIGN KEY([professorid])
REFERENCES [dbo].[Professor] ([professorid])
GO
ALTER TABLE [dbo].[Listapresenca] CHECK CONSTRAINT [FK_Listapresenca_Professor]
GO
ALTER TABLE [dbo].[Listapresenca]  WITH CHECK ADD  CONSTRAINT [FK_Listapresenca_Turma] FOREIGN KEY([turmaid])
REFERENCES [dbo].[Turma] ([turmaid])
GO
ALTER TABLE [dbo].[Listapresenca] CHECK CONSTRAINT [FK_Listapresenca_Turma]
GO
USE [master]
GO
ALTER DATABASE [Fluxocaixa] SET  READ_WRITE 
GO
