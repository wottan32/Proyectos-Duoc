SET QUOTED_IDENTIFIER ON
go
/* Crear Base de datos Banco.*/
use master
go
create database "Banco"
go
use "Banco"
go
create table "Cliente" (	
	"RutCliente" nvarchar(12) not null,
	"NombreCompleto" nvarchar(50) not null,
	"Password" nvarchar(50) not null)
go
alter table "Cliente" add constraint "Cliente_PK" primary key ("RutCliente")
go
create table "Transferencia" (
	"IdTransferencia" int not null,
	"Cliente" nvarchar(12) not null,
	"RutDestinatario" nvarchar(12) not null,
	"NroCuentaDestinatario" int not null,	
	"Monto" int not null)
go
alter table "Transferencia" add constraint "Transferencia_PK" primary key ("IdTransferencia")
go
alter table "Transferencia" add constraint "Cliente_Transferencia_FK1" foreign key ("Cliente") references "Cliente" ("RutCliente") on update no action on delete no action
go
INSERT INTO [Banco].[dbo].[Cliente] VALUES ('1-9','julio','cesar')
INSERT INTO [Banco].[dbo].[Cliente] VALUES ('2-7','alejandro','magno')
INSERT INTO [Banco].[dbo].[Cliente] VALUES ('3-5','carlo','magno')