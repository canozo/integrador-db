--TODO agregar comillas
--agregar personas
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

SET @StrInsert = 'INSERT INTO tbl_persona values('+ @persona2 + ', '+ @nnombre + ', '+ @napellido + ', '+ @fecha2 +');';

INSERT INTO dbo.Bitacora VALUES (2, @StrInsert, 2);



--agregar maestro
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

SET @StrInsert = 'INSERT INTO tbl_maestro values('+@maestro+', '+@persona2 + ', '+ @unidades+');';

INSERT INTO dbo.Bitacora VALUES (2, @StrInsert, 2);


--agregar seccion
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

SET @StrInsert = 'INSERT INTO tbl_secciones values('+@seccion+', '+@maestro + ', '+ @nnombre_clase+ ', '+ @unidades+');';

INSERT INTO dbo.Bitacora VALUES (2, @StrInsert, 2);


--agregar estudiante
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

SELECT @ncodigo_persona = INSERTED.codigo_persona  
FROM INSERTED;
select @persona = CAST(@ncodigo_persona as varchar(10))

SELECT @nnumero_cuenta = INSERTED.numero_cuenta 
FROM INSERTED;

SELECT @ncodigo_estudiante = INSERTED.codigo_estudiante 
FROM INSERTED;
select @estudiante = CAST(@ncodigo_estudiante as varchar(10))

SET @StrInsert = 'INSERT INTO tbl_estudiantes values('+@estudiante+', '+@persona + ', '+ @nnumero_cuenta+');';

INSERT INTO dbo.Bitacora VALUES (2, @StrInsert, 2);


--agregar seccion X estudiante
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

SET @StrInsert = 'INSERT INTO tbl_seccionXestudiante values('+@seccion+', '+@estudiante +');';

INSERT INTO dbo.Bitacora VALUES (2, @StrInsert, 2);




-- DELETE persona

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

    SET @StrDelete = 'DELETE FROM tbl_persona where codigo_persona = '+@persona');';
    INSERT INTO dbo.Bitacora VALUES (2, @StrDelete, 2);


--Delete maestro
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

    SET @StrDelete = 'DELETE FROM tbl_maestro where codigo_maestro = '+@maestro');';
    INSERT INTO dbo.Bitacora VALUES (2, @StrDelete, 2);


--delete seccion
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

    SET @StrDelete = 'DELETE FROM tbl_seccion where codigo_seccion = '+@seccion');';
    INSERT INTO dbo.Bitacora VALUES (2, @StrDelete, 2);


-- delete estudiante
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

    SET @StrDelete = 'DELETE FROM tbl_estudiantes where codigo_estudiante = '+@estudiante');';
    INSERT INTO dbo.Bitacora VALUES (2, @StrDelete, 2);


--delete seccionXestdiante ??

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


    SET @StrDelete = 'DELETE FROM tbl_seccionXestudiante where codigo_seccion = '+@seccion +', and codigo_estudiante = '+ @estudiante+' );';
    INSERT INTO dbo.Bitacora VALUES (2, @StrDelete, 2);


--update persona
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
select @fecha2 = CAST(@nfecha_nacimiento as varchar(25))

SET @StrInsert = 'UPDATE tbl_persona values set nombre = '+@nnombre + ', apellido = '+ @napellido+ ', fecha_nacimiento = '+ @fecha2+'
                  where codigo_persona = '+ @persona2+';';

INSERT INTO dbo.Bitacora VALUES (2, @StrInsert, 2);


--update maestro

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


SET @StrInsert = 'UPDATE tbl_maestro values set uvs_asignadas = '+@unidades +'where codigo_persona = '+ @persona2+';';

INSERT INTO dbo.Bitacora VALUES (2, @StrInsert, 2);


--update secciones

CREATE TRIGGER update_secciones
       ON tbl_secciones
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

SET @StrInsert = 'UPDATE tbl_secciones set uvs = '+@unidades+',  codigo_maestro = '+@maestro + ', nombre clase = '+ @nnombre_clase+' where codigo_seccion = '+@seccion+';';

INSERT INTO dbo.Bitacora VALUES (2, @StrInsert, 2);

--update estudiantes


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

SELECT @codigo_persona = INSERTED.codigo_persona  
FROM INSERTED;
select @persona = CAST(@ncodigo_persona as varchar(10))

SELECT @nnumero_cuenta = INSERTED.numero_cuenta 
FROM INSERTED;

SELECT @ncodigo_estudiante = INSERTED.codigo_estudiante 
FROM INSERTED;
select @estudiante = CAST(@ncodigo_estudiante as varchar(10))


SET @StrInsert = 'UPDATE tbl_estudiantes set numero_cuenta = '+@nnumero_cuenta+' where codigo_estudiante = '+@estudiante+';';


INSERT INTO dbo.Bitacora VALUES (2, @StrInsert, 2);
