/*
   Monday, December 10, 201810:03:16 AM
   User:
   Server: NOHELIAS-LAPTOP
   Database: db_escuela
   Application:
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.tbl_persona
	(
	codigo_persona int NOT NULL IDENTITY(1,1),
	nombre varchar(45) NOT NULL,
	apellido varchar(45) NOT NULL,
	fecha_nacimiento date NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.tbl_persona ADD CONSTRAINT
	PK_tbl_persona PRIMARY KEY CLUSTERED
	(
	codigo_persona
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE UNIQUE NONCLUSTERED INDEX codigo_persona ON dbo.tbl_persona
	(
	codigo_persona
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.tbl_persona SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.tbl_maestro
	(
	codigo_maestro int NOT NULL IDENTITY(1,1),
	uvs_asignadas int NOT NULL,
	codigo_persona int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.tbl_maestro ADD CONSTRAINT
	PK_tbl_maestro PRIMARY KEY CLUSTERED
	(
	codigo_maestro
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.tbl_maestro ADD CONSTRAINT
	FK_tbl_maestro_tbl_persona FOREIGN KEY
	(
	codigo_persona
	) REFERENCES dbo.tbl_persona
	(
	codigo_persona
	) ON UPDATE  NO ACTION
	 ON DELETE  CASCADE

GO
ALTER TABLE dbo.tbl_maestro SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.tbl_seccion
	(
	codigo_seccion int NOT NULL IDENTITY(1,1),
	uvs int NOT NULL,
	nombre_clase varchar(45) NOT NULL,
	codigo_maestro int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.tbl_seccion ADD CONSTRAINT
	PK_tbl_seccion PRIMARY KEY CLUSTERED
	(
	codigo_seccion
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.tbl_seccion ADD CONSTRAINT
	FK_tbl_seccion_tbl_maestro FOREIGN KEY
	(
	codigo_maestro
	) REFERENCES dbo.tbl_maestro
	(
	codigo_maestro
	) ON UPDATE  NO ACTION
	 ON DELETE  CASCADE

GO
ALTER TABLE dbo.tbl_seccion SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.tbl_estudiantes
	(
	codigo_estudiante int NOT NULL IDENTITY(1,1),
	numero_cuenta varchar(45) NOT NULL,
	codigo_persona int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.tbl_estudiantes ADD CONSTRAINT
	PK_tbl_estudiantes PRIMARY KEY CLUSTERED
	(
	codigo_estudiante
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE UNIQUE NONCLUSTERED INDEX codigo_estudiante ON dbo.tbl_estudiantes
	(
	codigo_estudiante
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.tbl_estudiantes ADD CONSTRAINT
	FK_tbl_estudiantes_tbl_persona FOREIGN KEY
	(
	codigo_persona
	) REFERENCES dbo.tbl_persona
	(
	codigo_persona
	) ON UPDATE  NO ACTION
	 ON DELETE  CASCADE

GO
ALTER TABLE dbo.tbl_estudiantes SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.tbl_seccionXestudiante
	(
	codigo_seccion int NOT NULL,
	codigo_estudiante int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.tbl_seccionXestudiante ADD CONSTRAINT
	PK_tbl_seccionXestudiante PRIMARY KEY NONCLUSTERED
	(
	codigo_seccion, codigo_estudiante
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.tbl_seccionXestudiante ADD CONSTRAINT
	FK_tbl_seccionXestudiante_tbl_seccion FOREIGN KEY
	(
	codigo_seccion
	) REFERENCES dbo.tbl_seccion
	(
	codigo_seccion
	) ON UPDATE  NO ACTION
	 ON DELETE  CASCADE

GO
ALTER TABLE dbo.tbl_seccionXestudiante ADD CONSTRAINT
	FK_tbl_seccionXestudiante_tbl_estudiantes FOREIGN KEY
	(
	codigo_estudiante
	) REFERENCES dbo.tbl_estudiantes
	(
	codigo_estudiante
	) ON UPDATE  NO ACTION
	 ON DELETE NO ACTION

GO
ALTER TABLE dbo.tbl_seccionXestudiante SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

BEGIN TRANSACTION
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Bitacora](
	[id_transaccion] [int] IDENTITY(1,1) NOT NULL,
	[transaccion] [nchar](300) NOT NULL,
	[tabla] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED
(
	[id_transaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
COMMIT

