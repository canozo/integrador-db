insert into tbl_persona (nombre, apellido, fecha_nacimiento)
values ('Javier', 'Cano', cast('11-14-1996' as datetime));

insert into tbl_persona (nombre, apellido, fecha_nacimiento)
values ('Nohelia', 'Euceda', cast('09-27-1996' as datetime));

insert into tbl_persona (nombre, apellido, fecha_nacimiento)
values ('Crysthel', 'Aparicio', cast('04-21-1997' as datetime));

insert into tbl_persona (nombre, apellido, fecha_nacimiento)
values ('Jose', 'Fernando', cast('11-17-1996' as datetime));

insert into tbl_persona (nombre, apellido, fecha_nacimiento)
values ('Cristian', 'Cruz', cast('11-17-1980' as datetime));

insert into tbl_persona (nombre, apellido, fecha_nacimiento)
values ('Julio', 'Sandoval', cast('11-17-1980' as datetime));

insert into tbl_estudiantes (codigo_persona, numero_cuenta)
values (1, '11741291');

insert into tbl_estudiantes (codigo_persona, numero_cuenta)
values (2, '11741376');

insert into tbl_estudiantes (codigo_persona, numero_cuenta)
values (3, '31641283');

insert into tbl_maestro (codigo_persona, uvs_asignadas)
values (4, 15);

insert into tbl_maestro (codigo_persona, uvs_asignadas)
values (5, 30);

insert into tbl_maestro (codigo_persona, uvs_asignadas)
values (6, 30);

insert into tbl_seccion (uvs, nombre_clase, codigo_maestro)
values (4, 'Fisica 100', 1);

insert into tbl_seccion (uvs, nombre_clase, codigo_maestro)
values (4, 'Estadistica', 2);

insert into tbl_seccion (uvs, nombre_clase, codigo_maestro)
values (4, 'Base de Datos II', 3);

insert into tbl_seccionXestudiante (codigo_seccion, codigo_estudiante)
values (1, 1);

insert into tbl_seccionXestudiante (codigo_seccion, codigo_estudiante)
values (1, 2);

insert into tbl_seccionXestudiante (codigo_seccion, codigo_estudiante)
values (1, 3);

insert into tbl_seccionXestudiante (codigo_seccion, codigo_estudiante)
values (2, 1);

insert into tbl_seccionXestudiante (codigo_seccion, codigo_estudiante)
values (2, 2);

insert into tbl_seccionXestudiante (codigo_seccion, codigo_estudiante)
values (2, 3);

insert into tbl_seccionXestudiante (codigo_seccion, codigo_estudiante)
values (3, 1);

insert into tbl_seccionXestudiante (codigo_seccion, codigo_estudiante)
values (3, 2);

insert into tbl_seccionXestudiante (codigo_seccion, codigo_estudiante)
values (3, 3);

select
d.nombre + ' ' + d.apellido as estudiante,
e.nombre + ' ' + e.apellido as maestro,
b.nombre_clase as clase,
b.uvs as uvs
from tbl_seccionXestudiante a
inner join tbl_seccion b
on a.codigo_seccion = b.codigo_seccion
inner join tbl_estudiantes c
on a.codigo_estudiante = c.codigo_estudiante
inner join tbl_persona d
on c.codigo_persona = d.codigo_persona
inner join (
    select
    b.codigo_maestro as codigo_maestro,
    nombre,
    apellido
    from tbl_persona a
    inner join tbl_maestro b
    on a.codigo_persona = b.codigo_persona
) e
on b.codigo_maestro = e.codigo_maestro;
