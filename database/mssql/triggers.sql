-- agregar personas
GO
CREATE TRIGGER agregar_persona
ON dbo.tbl_persona
AFTER INSERT
AS
DECLARE @StrInsert varchar(200),
        @ncodigo_persona int,
        @persona2 varchar(45),
        @nnombre varchar(45),
        @napellido varchar(45),
        @nfecha_nacimiento date,
        @fecha2 varchar(40)
;

SELECT @ncodigo_persona = INSERTED.codigo_persona
FROM INSERTED;
select @persona2 = CAST(@ncodigo_persona as varchar(10))

SELECT @nnombre = INSERTED.nombre
FROM INSERTED;

SELECT @napellido = INSERTED.apellido
FROM INSERTED;

SELECT @nfecha_nacimiento = INSERTED.fecha_nacimiento
FROM INSERTED;

SELECT @fecha2 = LEFT(CONVERT(VARCHAR, @nfecha_nacimiento, 120), 10)

SET @StrInsert = 'INSERT INTO tbl_persona(codigo_persona ,nombre, apellido, fecha_nacimiento) values(''' + @persona2 + ''', '''+ @nnombre + ''', '''+ @napellido + ''', '''+ @fecha2 +''');';

INSERT INTO dbo.Bitacora (transaccion, tabla) VALUES (@StrInsert, 'tbl_persona');
GO

-- agregar maestro
GO
CREATE TRIGGER agregar_maestro
ON dbo.tbl_maestro
AFTER INSERT
AS

DECLARE @StrInsert varchar(200),
        @ncodigo_maestro int,
        @maestro varchar(25),
        @nuvs_asignadas int,
        @unidades varchar(25),
        @ncodigo_persona int,
        @persona2 varchar(25)
;

SELECT @ncodigo_maestro = INSERTED.codigo_maestro
FROM INSERTED;
select @maestro = CAST(@ncodigo_maestro as varchar(10))

SELECT @nuvs_asignadas = INSERTED.uvs_asignadas
FROM INSERTED;
select @unidades = CAST(@nuvs_asignadas as varchar(10))

SELECT @ncodigo_persona = INSERTED.codigo_persona
FROM INSERTED;
select @persona2 = CAST(@ncodigo_persona as varchar(10))

SET @StrInsert = 'INSERT INTO tbl_maestro (codigo_maestro, codigo_persona, uvs_asignadas) values(''' +@maestro+''', '''+@persona2 + ''', '''+ @unidades+''');';

INSERT INTO dbo.Bitacora (transaccion, tabla) VALUES (@StrInsert, 'tbl_maestro');
GO

-- agregar seccion
GO
CREATE TRIGGER agregar_seccion
ON dbo.tbl_seccion
AFTER INSERT
AS

DECLARE @StrInsert varchar(200),
        @ncodigo_seccion int,
        @nuvs int,
        @nnombre_clase varchar(45),
        @ncodigo_maestro int,
        @seccion varchar(15),
        @unidades varchar(15),
        @maestro varchar(15)
;

SELECT @ncodigo_seccion = INSERTED.codigo_seccion
FROM INSERTED;
select @seccion = CAST(@ncodigo_seccion as varchar(10))

SELECT @nuvs = INSERTED.uvs
FROM INSERTED;
select @unidades = CAST(@nuvs as varchar(10))

SELECT @nnombre_clase = INSERTED.nombre_clase
FROM INSERTED;

SELECT @ncodigo_maestro = INSERTED.codigo_maestro
FROM INSERTED;
select @maestro = CAST(@ncodigo_maestro as varchar(10))

SET @StrInsert = 'INSERT INTO tbl_seccion (codigo_seccion, codigo_maestro, nombre_clase, uvs) values('''+@seccion+''', '''+@maestro + ''', '''+ @nnombre_clase+ ''', '''+ @unidades+''');';

INSERT INTO dbo.Bitacora (transaccion, tabla) VALUES (@StrInsert, 'tbl_seccion');
GO

-- agregar estudiante
GO
CREATE TRIGGER agregar_estudiante
ON dbo.tbl_estudiantes
AFTER INSERT
AS

DECLARE @StrInsert varchar(200),
        @ncodigo_persona int,
        @ncodigo_estudiante int,
        @persona varchar(15),
        @nnumero_cuenta nchar(25),
        @estudiante varchar(15),
        @persona2 varchar(15)
;

SELECT @ncodigo_persona = INSERTED.codigo_persona
FROM INSERTED;
select @persona2 = CAST(@ncodigo_persona as varchar(10))

SELECT @nnumero_cuenta = INSERTED.numero_cuenta
FROM INSERTED;

SELECT @ncodigo_estudiante = INSERTED.codigo_estudiante
FROM INSERTED;
select @estudiante = CAST(@ncodigo_estudiante as varchar(10))

SET @StrInsert = 'INSERT INTO tbl_estudiantes (codigo_estudiante, codigo_persona, numero_cuenta) values('''+@estudiante+''', '''+@persona2 + ''', '''+ @nnumero_cuenta+''');';

INSERT INTO dbo.Bitacora (transaccion, tabla) VALUES (@StrInsert, 'tbl_estudiantes');
GO

-- agregar seccion X estudiante
GO
CREATE TRIGGER agregar_seccionXestudiante
ON dbo.tbl_seccionXestudiante
AFTER INSERT
AS

DECLARE @StrInsert varchar(200),
        @ncodigo_seccion int,
        @seccion varchar(10),
        @ncodigo_estudiante int,
        @estudiante varchar(10)
;

SELECT @ncodigo_estudiante = INSERTED.codigo_estudiante
FROM INSERTED;
select @estudiante = CAST(@ncodigo_estudiante as varchar(10))

SELECT @ncodigo_seccion = INSERTED.codigo_seccion
FROM INSERTED;
select @seccion = CAST(@ncodigo_seccion as varchar(10))

SET @StrInsert = 'INSERT INTO tbl_seccionXestudiante(codigo_seccion, codigo_estudiante) values('''+@seccion+''', '''+@estudiante +''');';

INSERT INTO dbo.Bitacora (transaccion, tabla) VALUES (@StrInsert, 'tbl_seccionXestudiante');
GO

-- DELETE persona
GO
CREATE TRIGGER delete_persona
ON dbo.tbl_persona
AFTER DELETE
AS
BEGIN
    insert into dbo.Bitacora (transaccion, tabla)
    select 'delete from tbl_persona where codigo_persona = ''' + cast(DELETED.codigo_persona as varchar) + ''';' as transaccion, 'tbl_persona' as tabla from DELETED;
END
GO

-- Delete maestro
GO
CREATE TRIGGER delete_maestro
ON dbo.tbl_maestro
AFTER DELETE
AS
BEGIN
    insert into dbo.Bitacora (transaccion, tabla)
    select 'delete from tbl_maestro where codigo_maestro = ''' + cast(DELETED.codigo_maestro as varchar) + ''';' as transaccion, 'tbl_maestro' as tabla from DELETED;
END
GO

-- delete seccion
GO
CREATE TRIGGER delete_seccion
ON dbo.tbl_seccion
AFTER DELETE
AS
BEGIN
    insert into dbo.Bitacora (transaccion, tabla)
    select 'delete from tbl_seccion where codigo_seccion = ''' + cast(DELETED.codigo_seccion as varchar) + ''';' as transaccion, 'tbl_seccion' as tabla from DELETED;
END
GO

-- delete estudiante
GO
CREATE TRIGGER delete_estudiante
ON dbo.tbl_estudiantes
AFTER DELETE
AS
BEGIN
    insert into dbo.Bitacora (transaccion, tabla)
    select 'delete from tbl_estudiantes where codigo_estudiante = ''' + cast(DELETED.codigo_estudiante as varchar) + ''';' as transaccion, 'tbl_estudiantes' as tabla from DELETED;
END
GO

-- delete seccionXestdiante
GO
CREATE TRIGGER delete_seccionXestudiante
ON dbo.tbl_seccionXestudiante
AFTER DELETE
AS
BEGIN
    insert into dbo.Bitacora (transaccion, tabla)
    select 'delete from tbl_seccionXestudiante where codigo_seccion = ''' + cast(DELETED.codigo_seccion as varchar) + ''' and codigo_estudiante = ''' + cast(DELETED.codigo_estudiante as varchar) + ''';' as transaccion, 'tbl_seccionXestudiante' as tabla from DELETED;
END
GO

-- update persona
GO
CREATE TRIGGER update_persona
ON tbl_persona
AFTER UPDATE
AS
BEGIN
    insert into dbo.Bitacora (transaccion, tabla)
    select 'update tbl_persona set nombre = ''' + INSERTED.nombre + ''', apellido = ''' + INSERTED.apellido + ''', fecha_nacimiento = ''' + LEFT(CONVERT(VARCHAR, INSERTED.fecha_nacimiento, 120), 10) + ''' where codigo_persona = ''' + INSERTED.codigo_persona + ''';' as transaccion, 'tbl_persona' as tabla from INSERTED;
END
GO

-- update maestro
GO
CREATE TRIGGER update_maestro
       ON tbl_maestro
AFTER UPDATE
AS
BEGIN
    insert into dbo.Bitacora (transaccion, tabla)
    select 'update tbl_maestro set uvs_asignadas = ''' + INSERTED.uvs_asignadas + ''', codigo_persona = ''' + INSERTED.codigo_persona + ''' where codigo_maestro = ''' + INSERTED.codigo_maestro + ''';' as transaccion, 'tbl_maestro' as tabla from INSERTED;
END
GO

-- update secciones
GO
CREATE TRIGGER update_secciones
       ON tbl_seccion
AFTER UPDATE
AS
BEGIN
    insert into dbo.Bitacora (transaccion, tabla)
    select 'update tbl_seccion set uvs = ''' + cast(INSERTED.uvs as varchar) + ''', nombre_clase = ''' + INSERTED.nombre_clase + ''' codigo_maestro = ''' + cast(INSERTED.codigo_maestro as varchar) + ''' where codigo_seccion = ''' + INSERTED.codigo_seccion + ''';' as transaccion, 'tbl_seccion' as tabla from INSERTED;
END
GO

-- update estudiantes
GO
CREATE TRIGGER update_estudiante
       ON tbl_estudiantes
AFTER UPDATE
AS
BEGIN
    insert into dbo.Bitacora (transaccion, tabla)
    select 'update tbl_estudiantes set numero_cuenta = ''' + INSERTED.numero_cuenta + ''', codigo_estudiante = ''' + cast(INSERTED.codigo_estudiante as varchar) + ''' where codigo_estudiante = ''' + cast(INSERTED.codigo_estudiante as varchar) + ''';' as transaccion, 'tbl_estudiantes' as tabla from INSERTED;
END
GO
