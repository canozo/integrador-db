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

SET @StrInsert = 'INSERT INTO tbl_persona(codigo_persona ,nombre, apellido, fecha_nacimiento) values(`' + @persona2 + '`, `'+ @nnombre + '`, `'+ @napellido + '`, `'+ @fecha2 +'`);';

INSERT INTO dbo.Bitacora VALUES ( @StrInsert);
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

SET @StrInsert = 'INSERT INTO tbl_maestro (codigo_maestro, codigo_persona, uvs_asignadas) values(`' +@maestro+'`, `'+@persona2 + '`, `'+ @unidades+'`);';

INSERT INTO dbo.Bitacora VALUES ( @StrInsert);
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

SET @StrInsert = 'INSERT INTO tbl_secciones (codigo_seccion, codigo_maestro, nombre_clase, uvs) values(`'+@seccion+'`, `'+@maestro + '`, `'+ @nnombre_clase+ '`, `'+ @unidades+'`);';

INSERT INTO dbo.Bitacora VALUES ( @StrInsert);
GO

-- agregar estudiante
GO
CREATE TRIGGER agregar_estudiante
ON dbo.tbl_estudiantes
AFTER INSERT
AS

DECLARE @StrInsert varchar(200),
        @ncodigo_estudiante int,
        @persona varchar(15),
        @nnumero_cuenta nchar(25),
        @estudiante varchar(15)
;

SELECT @nnumero_cuenta = INSERTED.numero_cuenta
FROM INSERTED;

SELECT @ncodigo_estudiante = INSERTED.codigo_estudiante
FROM INSERTED;
select @estudiante = CAST(@ncodigo_estudiante as varchar(10))

SET @StrInsert = 'INSERT INTO tbl_estudiantes (codigo_estudiante, codigo_persona, numero_cuenta) values(`'+@estudiante+'`, `'+@persona + '`, `'+ @nnumero_cuenta+'`);';

INSERT INTO dbo.Bitacora VALUES ( @StrInsert);
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

SET @StrInsert = 'INSERT INTO tbl_seccionXestudiante(codigo_seccion, codigo_estudiante) values(`' +@seccion+'`, `'+@estudiante +'`);';

INSERT INTO dbo.Bitacora VALUES ( @StrInsert);
GO

-- DELETE persona
GO
CREATE TRIGGER delete_persona
ON dbo.tbl_persona
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StrDelete varchar(200),
    @ncodigo_persona int,
    @persona VARCHAR(10)
    ;

    SELECT @ncodigo_persona = DELETED.codigo_persona
    FROM DELETED
    select @persona = CAST(@ncodigo_persona as varchar(10))

    SET @StrDelete = 'DELETE FROM tbl_persona where codigo_persona = `'+@persona+'`);';
    INSERT INTO dbo.Bitacora VALUES ( @StrDelete);
END
GO

-- Delete maestro
GO
CREATE TRIGGER delete_maestro
ON dbo.tbl_maestro
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StrDelete varchar(200),
    @ncodigo_maestro int,
    @maestro varchar(25)
    ;

    SELECT @ncodigo_maestro = DELETED.codigo_maestro
    FROM DELETED
    select @maestro = CAST(@ncodigo_maestro as varchar(10))

    SET @StrDelete = 'DELETE FROM tbl_maestro where codigo_maestro = `'+@maestro+'`);';
    INSERT INTO dbo.Bitacora VALUES ( @StrDelete);
END
GO

-- delete seccion
GO
CREATE TRIGGER delete_seccion
ON dbo.tbl_seccion
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StrDelete varchar(200),
    @ncodigo_seccion int,
     @seccion varchar(15)
    ;

    SELECT @ncodigo_seccion = DELETED.codigo_seccion
    FROM DELETED
    select @seccion = CAST(@ncodigo_seccion as varchar(10))

    SET @StrDelete = 'DELETE FROM tbl_seccion where codigo_seccion = `'+@seccion+'`);';
    INSERT INTO dbo.Bitacora VALUES ( @StrDelete);
END
GO

-- delete estudiante
GO
CREATE TRIGGER delete_estudiante
ON dbo.tbl_estudiantes
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StrDelete varchar(200),
    @ncodigo_estudiante int,
     @estudiante varchar(15)
    ;

    SELECT @ncodigo_estudiante = DELETED.codigo_estudiante
    FROM DELETED
    select @estudiante = CAST(@ncodigo_estudiante as varchar(10))

    SET @StrDelete = 'DELETE FROM tbl_estudiantes where codigo_estudiante = `'+@estudiante+'`);';
    INSERT INTO dbo.Bitacora VALUES ( @StrDelete);
END
GO

-- delete seccionXestdiante ??
GO
CREATE TRIGGER delete_seccionXestudiante
ON dbo.tbl_seccionXestudiante
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

        DECLARE @StrDelete varchar(200),
        @ncodigo_seccion int,
        @ncodigo_estudiante int,
        @estudiante varchar(15),
        @seccion varchar(15)
        ;

        SELECT @ncodigo_seccion = DELETED.codigo_seccion
        FROM DELETED
        select @seccion = CAST(@ncodigo_seccion as varchar(10))

        SELECT @ncodigo_estudiante = DELETED.codigo_estudiante
        FROM DELETED
        select @estudiante = CAST(@ncodigo_estudiante as varchar(10))


        SET @StrDelete = 'DELETE FROM tbl_seccionXestudiante where codigo_seccion = `'+@seccion +'`, and codigo_estudiante = `'+ @estudiante+'` );';
        INSERT INTO dbo.Bitacora VALUES ( @StrDelete);
        END
GO

-- update persona
GO
CREATE TRIGGER update_persona
       ON tbl_persona
AFTER UPDATE
AS
BEGIN

DECLARE @StrInsert varchar(200),
        @ncodigo_persona int,
        @nnombre varchar(45),
        @napellido varchar(45),
        @nfecha_nacimiento date,
        @persona2 varchar(25),
        @fecha2 varchar(25)
;

SELECT @ncodigo_persona = INSERTED.codigo_persona
FROM INSERTED;
select @persona2 = CAST(@ncodigo_persona as varchar(25))

SELECT @nnombre = INSERTED.nombre
FROM INSERTED;

SELECT @napellido = INSERTED.apellido
FROM INSERTED;

SELECT @nfecha_nacimiento = INSERTED.fecha_nacimiento
FROM INSERTED;
SELECT @fecha2 = LEFT(CONVERT(VARCHAR, @nfecha_nacimiento, 120), 10)

SET @StrInsert = 'UPDATE tbl_persona values set nombre = `'+@nnombre + '`, apellido = `'+ @napellido+ '`, fecha_nacimiento = `'+ @fecha2+'`
                  where codigo_persona = `'+ @persona2+'`;';

INSERT INTO dbo.Bitacora VALUES (@StrInsert);
END
GO

-- update maestro
GO
CREATE TRIGGER update_maestro
       ON tbl_maestro
AFTER UPDATE
AS
BEGIN

DECLARE @StrInsert varchar(200),
        @ncodigo_maestro int,
        @nuvs_asignadas int,
        @ncodigo_persona int,
        @maestro varchar(25),
        @unidades varchar(25),
        @persona2 varchar(25)
;

SELECT @ncodigo_persona = INSERTED.codigo_persona
FROM INSERTED;
select @persona2 = CAST(@ncodigo_persona as varchar(25))

SELECT @nuvs_asignadas = INSERTED.uvs_asignadas
FROM INSERTED;
select @unidades = CAST(@nuvs_asignadas as varchar(25))

SET @StrInsert = 'UPDATE tbl_maestro values set uvs_asignadas = `'+@unidades +'` where codigo_persona = `'+ @persona2+'`;';

INSERT INTO dbo.Bitacora VALUES (@StrInsert);
END
GO

-- update secciones
GO
CREATE TRIGGER update_secciones
       ON tbl_seccion
AFTER UPDATE
AS
BEGIN
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
select @seccion = CAST(@ncodigo_seccion as varchar(15))

SELECT @nuvs = INSERTED.uvs
FROM INSERTED;
select @unidades = CAST(@nuvs as varchar(10))

SELECT @nnombre_clase = INSERTED.nombre_clase
FROM INSERTED;

SELECT @ncodigo_maestro = INSERTED.codigo_maestro
FROM INSERTED;
select @maestro = CAST(@ncodigo_maestro as varchar(10))

SET @StrInsert = 'UPDATE tbl_secciones set uvs = `'+@unidades+'`,  codigo_maestro = `'+@maestro + '`, nombre clase = `'+ @nnombre_clase+'` where codigo_seccion = `'+@seccion+'`;';

INSERT INTO dbo.Bitacora VALUES (@StrInsert);

END
GO

-- update estudiantes
GO
CREATE TRIGGER update_estudiante
       ON tbl_estudiantes
AFTER UPDATE
AS
BEGIN
DECLARE @StrInsert varchar(200),
        @ncodigo_estudiante int,
        @nnumero_cuenta nchar(45),
        @ncodigo_persona int,
        @persona varchar(15),
        @estudiante varchar(15)
;

SELECT @nnumero_cuenta = INSERTED.numero_cuenta
FROM INSERTED;

SELECT @ncodigo_estudiante = INSERTED.codigo_estudiante
FROM INSERTED;
select @estudiante = CAST(@ncodigo_estudiante as varchar(10))

SET @StrInsert = 'UPDATE tbl_estudiantes set numero_cuenta = `'+@nnumero_cuenta+'` where codigo_estudiante = `'+@estudiante+'`;';

INSERT INTO dbo.Bitacora VALUES ( @StrInsert);
END
GO
