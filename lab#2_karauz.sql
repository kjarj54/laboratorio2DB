prompt PL/SQL Developer Export Tables for user KARAUZ@192.168.0.14:1521/XEPDB1
prompt Created by kevin on domingo, 20 de abril de 2025
set feedback off
set define off

prompt Dropping AGENCIA...
drop table AGENCIA cascade constraints;
prompt Dropping CLIENTES...
drop table CLIENTES cascade constraints;
prompt Dropping AVALADOS...
drop table AVALADOS cascade constraints;
prompt Dropping GARAGE...
drop table GARAGE cascade constraints;
prompt Dropping COCHES...
drop table COCHES cascade constraints;
prompt Dropping RESERVACIONES...
drop table RESERVACIONES cascade constraints;
prompt Creating AGENCIA...
create table AGENCIA
(
  idagencia     INTEGER not null,
  nombreagencia VARCHAR2(20)
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AGENCIA
  add primary key (IDAGENCIA)
  using index 
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CLIENTES...
create table CLIENTES
(
  idcliente              INTEGER not null,
  dni                    VARCHAR2(20),
  codigounico            VARCHAR2(20),
  nombrecliente          VARCHAR2(20),
  apellidopaternocliente VARCHAR2(20),
  apellidomaternocliente VARCHAR2(20),
  direccion              VARCHAR2(140),
  telefono               VARCHAR2(20)
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLIENTES
  add primary key (IDCLIENTE)
  using index 
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating AVALADOS...
create table AVALADOS
(
  idavala          INTEGER not null,
  idclienteavala   INTEGER,
  idclienteavalado INTEGER,
  avalado          NUMBER(1)
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AVALADOS
  add primary key (IDAVALA)
  using index 
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AVALADOS
  add foreign key (IDCLIENTEAVALA)
  references CLIENTES (IDCLIENTE);
alter table AVALADOS
  add foreign key (IDCLIENTEAVALADO)
  references CLIENTES (IDCLIENTE);

prompt Creating GARAGE...
create table GARAGE
(
  idgarage     INTEGER not null,
  nombregarage VARCHAR2(10)
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table GARAGE
  add primary key (IDGARAGE)
  using index 
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating COCHES...
create table COCHES
(
  idcoche            INTEGER not null,
  matricula          VARCHAR2(10),
  marca              VARCHAR2(10),
  modelo             VARCHAR2(15),
  color              VARCHAR2(10),
  cuantoslitrostiene FLOAT,
  precioalquiler     NUMBER(10,2),
  idreserva          INTEGER,
  idgarage           INTEGER
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table COCHES
  add primary key (IDCOCHE)
  using index 
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table COCHES
  add foreign key (IDGARAGE)
  references GARAGE (IDGARAGE);

prompt Creating RESERVACIONES...
create table RESERVACIONES
(
  idreservacion      INTEGER not null,
  fechainicio        DATE,
  fechafin           DATE,
  preciototalreserva NUMBER(10,2),
  entregado          NUMBER(1),
  idcliente          INTEGER,
  idagencia          INTEGER,
  idcoche            INTEGER
)
tablespace UNA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table RESERVACIONES
  add primary key (IDRESERVACION)
  using index 
  tablespace UNA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table RESERVACIONES
  add foreign key (IDCLIENTE)
  references CLIENTES (IDCLIENTE);
alter table RESERVACIONES
  add foreign key (IDAGENCIA)
  references AGENCIA (IDAGENCIA);
alter table RESERVACIONES
  add foreign key (IDCOCHE)
  references COCHES (IDCOCHE);

prompt Disabling triggers for AGENCIA...
alter table AGENCIA disable all triggers;
prompt Disabling triggers for CLIENTES...
alter table CLIENTES disable all triggers;
prompt Disabling triggers for AVALADOS...
alter table AVALADOS disable all triggers;
prompt Disabling triggers for GARAGE...
alter table GARAGE disable all triggers;
prompt Disabling triggers for COCHES...
alter table COCHES disable all triggers;
prompt Disabling triggers for RESERVACIONES...
alter table RESERVACIONES disable all triggers;
prompt Disabling foreign key constraints for AVALADOS...
alter table AVALADOS disable constraint SYS_C008350;
alter table AVALADOS disable constraint SYS_C008351;
prompt Disabling foreign key constraints for COCHES...
alter table COCHES disable constraint SYS_C008344;
prompt Disabling foreign key constraints for RESERVACIONES...
alter table RESERVACIONES disable constraint SYS_C008346;
alter table RESERVACIONES disable constraint SYS_C008347;
alter table RESERVACIONES disable constraint SYS_C008348;
prompt Loading AGENCIA...
insert into AGENCIA (idagencia, nombreagencia)
values (1, 'Viajes del Sur S.A.');
insert into AGENCIA (idagencia, nombreagencia)
values (2, 'Tour Express');
insert into AGENCIA (idagencia, nombreagencia)
values (3, 'Rutas del Norte');
commit;
prompt 3 records loaded
prompt Loading CLIENTES...
insert into CLIENTES (idcliente, dni, codigounico, nombrecliente, apellidopaternocliente, apellidomaternocliente, direccion, telefono)
values (1, '12345678', 'C001', 'Juan', 'Fern�ndez', 'Lopez', 'Av. Lima 123', '999888777');
insert into CLIENTES (idcliente, dni, codigounico, nombrecliente, apellidopaternocliente, apellidomaternocliente, direccion, telefono)
values (2, '87654321', 'C002', 'Luc�a', 'G�mez', 'Ram�rez', 'Calle Sol 456', '999111222');
insert into CLIENTES (idcliente, dni, codigounico, nombrecliente, apellidopaternocliente, apellidomaternocliente, direccion, telefono)
values (3, '11223344', 'C003', 'Pedro', 'Fern�ndez', 'Soto', 'Av. Andes 999', '998877665');
insert into CLIENTES (idcliente, dni, codigounico, nombrecliente, apellidopaternocliente, apellidomaternocliente, direccion, telefono)
values (4, '55667788', 'C004', 'Mar�a', 'Ruiz', 'Delgado', 'Calle Norte 890', '997755333');
insert into CLIENTES (idcliente, dni, codigounico, nombrecliente, apellidopaternocliente, apellidomaternocliente, direccion, telefono)
values (5, '99887766', 'C005', 'Ana', 'Morales', 'Fern�ndez', 'Jr. Los Alamos 321', '991122334');
insert into CLIENTES (idcliente, dni, codigounico, nombrecliente, apellidopaternocliente, apellidomaternocliente, direccion, telefono)
values (6, '66778899', 'C006', 'Carlos', 'S�nchez', 'Fern�ndez', 'Jr. Pacifico 800', '990011223');
commit;
prompt 6 records loaded
prompt Loading AVALADOS...
insert into AVALADOS (idavala, idclienteavala, idclienteavalado, avalado)
values (1, 2, 1, 1);
insert into AVALADOS (idavala, idclienteavala, idclienteavalado, avalado)
values (2, 1, 2, 1);
insert into AVALADOS (idavala, idclienteavala, idclienteavalado, avalado)
values (3, 3, 5, 1);
insert into AVALADOS (idavala, idclienteavala, idclienteavalado, avalado)
values (4, 4, 6, 1);
commit;
prompt 4 records loaded
prompt Loading GARAGE...
insert into GARAGE (idgarage, nombregarage)
values (1, 'Centro');
insert into GARAGE (idgarage, nombregarage)
values (2, 'Norte');
insert into GARAGE (idgarage, nombregarage)
values (3, 'Sur');
commit;
prompt 3 records loaded
prompt Loading COCHES...
insert into COCHES (idcoche, matricula, marca, modelo, color, cuantoslitrostiene, precioalquiler, idreserva, idgarage)
values (1, 'ABC123', 'Toyota', 'RAV4', 'Rojo', 55, 500, 1, 1);
insert into COCHES (idcoche, matricula, marca, modelo, color, cuantoslitrostiene, precioalquiler, idreserva, idgarage)
values (2, 'XYZ789', 'Honda', 'Civic', 'Negro', 40, 400, 2, 2);
insert into COCHES (idcoche, matricula, marca, modelo, color, cuantoslitrostiene, precioalquiler, idreserva, idgarage)
values (3, 'MNO456', 'Ford', 'Escape', 'Blanco', 60, 350, 5, 3);
insert into COCHES (idcoche, matricula, marca, modelo, color, cuantoslitrostiene, precioalquiler, idreserva, idgarage)
values (4, 'JKL321', 'Toyota', 'RAV4', 'Azul', 55, 520, 3, 2);
insert into COCHES (idcoche, matricula, marca, modelo, color, cuantoslitrostiene, precioalquiler, idreserva, idgarage)
values (5, 'DEF987', 'Chevrolet', 'Spark', 'Gris', 30, 300, null, 1);
insert into COCHES (idcoche, matricula, marca, modelo, color, cuantoslitrostiene, precioalquiler, idreserva, idgarage)
values (6, 'LMN654', 'Toyota', 'Corolla', 'Negro', 45, 450, 6, 3);
insert into COCHES (idcoche, matricula, marca, modelo, color, cuantoslitrostiene, precioalquiler, idreserva, idgarage)
values (7, 'QWE321', 'Toyota', 'RAV4', 'Verde', 50, 510, 4, 1);
commit;
prompt 7 records loaded
prompt Loading RESERVACIONES...
insert into RESERVACIONES (idreservacion, fechainicio, fechafin, preciototalreserva, entregado, idcliente, idagencia, idcoche)
values (1, to_date('15-04-2025', 'dd-mm-yyyy'), to_date('18-04-2025', 'dd-mm-yyyy'), 1200, 1, 1, 1, 1);
insert into RESERVACIONES (idreservacion, fechainicio, fechafin, preciototalreserva, entregado, idcliente, idagencia, idcoche)
values (2, to_date('10-03-2025', 'dd-mm-yyyy'), to_date('15-03-2025', 'dd-mm-yyyy'), 700, 0, 2, 2, 2);
insert into RESERVACIONES (idreservacion, fechainicio, fechafin, preciototalreserva, entregado, idcliente, idagencia, idcoche)
values (3, to_date('14-04-2025', 'dd-mm-yyyy'), to_date('19-04-2025', 'dd-mm-yyyy'), 1500, 1, 3, 1, 4);
insert into RESERVACIONES (idreservacion, fechainicio, fechafin, preciototalreserva, entregado, idcliente, idagencia, idcoche)
values (4, to_date('16-04-2025', 'dd-mm-yyyy'), to_date('20-04-2025', 'dd-mm-yyyy'), 1800, 1, 5, 1, 7);
insert into RESERVACIONES (idreservacion, fechainicio, fechafin, preciototalreserva, entregado, idcliente, idagencia, idcoche)
values (5, to_date('01-04-2025', 'dd-mm-yyyy'), to_date('05-04-2025', 'dd-mm-yyyy'), 600, 0, 4, 3, 3);
insert into RESERVACIONES (idreservacion, fechainicio, fechafin, preciototalreserva, entregado, idcliente, idagencia, idcoche)
values (6, to_date('15-04-2025', 'dd-mm-yyyy'), to_date('20-04-2025', 'dd-mm-yyyy'), 2000, 1, 6, 1, 6);
commit;
prompt 6 records loaded
prompt Enabling foreign key constraints for AVALADOS...
alter table AVALADOS enable constraint SYS_C008350;
alter table AVALADOS enable constraint SYS_C008351;
prompt Enabling foreign key constraints for COCHES...
alter table COCHES enable constraint SYS_C008344;
prompt Enabling foreign key constraints for RESERVACIONES...
alter table RESERVACIONES enable constraint SYS_C008346;
alter table RESERVACIONES enable constraint SYS_C008347;
alter table RESERVACIONES enable constraint SYS_C008348;
prompt Enabling triggers for AGENCIA...
alter table AGENCIA enable all triggers;
prompt Enabling triggers for CLIENTES...
alter table CLIENTES enable all triggers;
prompt Enabling triggers for AVALADOS...
alter table AVALADOS enable all triggers;
prompt Enabling triggers for GARAGE...
alter table GARAGE enable all triggers;
prompt Enabling triggers for COCHES...
alter table COCHES enable all triggers;
prompt Enabling triggers for RESERVACIONES...
alter table RESERVACIONES enable all triggers;

set feedback on
set define on
prompt Done
