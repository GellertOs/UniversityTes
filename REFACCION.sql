create database tienda;

use  tienda

create table tbl_proveedores(
	cn_proveedorid int identity (1,1),
	cn_nombre nvarchar(30),
	cn_direccion nvarchar(30),
	cn_telefono int,
	cn_correo nvarchar(30),
	cn_foto image,
	constraint Pk_cn_proveedorid primary key(cn_proveedorid));

create table tbl_carro(
	cn_carroid int identity (1,1),
	cn_marca nvarchar(30),
	cn_modelo nvarchar(30),
	cn_anio date,
	constraint Pk_cn_carroid primary key(cn_carroid));

create table tbl_refacciones(
	cn_refaccionid int identity (1,1),
	cn_nombre nvarchar(30),
	cn_descripcion nvarchar(30),
	cn_precio int,
	cn_carroid int,
	cn_proveedorid int,
	cn_foto image,
	constraint Pk_cn_refaccionid primary key(cn_refaccionid),
	constraint fk_cn_carro foreign key(cn_carroid) references tbl_carro(cn_carroid),
	constraint fk_cn_proveedor foreign key(cn_proveedorid) references tbl_proveedores(cn_proveedorid));

create table tbl_tipocliente(
	cn_tipoclienteid int identity (1,1),
	cn_nombre nvarchar(30),
	cn_porcentaje_pago nvarchar(30),
	constraint Pk_cn_tipoclienteid primary key(cn_tipoclienteid));

create table tbl_clientes(
	cn_clienteid int identity (1,1),
	cn_nombre nvarchar(30),
	cn_ap_p nvarchar(30),
	cn_ap_m nvarchar(30),
	cn_direccion nvarchar(30),
	cn_foto image,
	cn_telcliente int,
	cn_telfamiliar int,
	cn_correo nvarchar(30),
	cn_tipoclienteid int,
	constraint Pk_cn_clienteid primary key(cn_clienteid),
	constraint fk_cn_tipocliente foreign key(cn_tipoclienteid) references tbl_tipocliente(cn_tipoclienteid));

create table tbl_empleados(
	cn_empleadoid int identity (1,1),
	cn_nombre nvarchar(30),
	cn_ap_p nvarchar(30),
	cn_ap_m nvarchar(30),
	cn_direccion nvarchar(30),
	cn_foto image,
	cn_correo nvarchar(30),
	constraint Pk_cn_empleadoid primary key(cn_empleadoid));

create table tbl_ventas(
	cn_ventaid int identity (1,1),
	cn_empleadoid int,
	cn_clienteid int,
	cn_fecha date,
	cn_monto_total int,
	cn_comision int,
	constraint Pk_cn_ventaid primary key(cn_ventaid),
	constraint fk_cn_empleado foreign key(cn_empleadoid) references tbl_empleados(cn_empleadoid),
	constraint fk_cn_cliente foreign key(cn_clienteid) references tbl_clientes(cn_clienteid));

create table tbl_detalleventa(
	cn_detalleventaid int identity (1,1),
	cn_ventaid int,
	cn_refaccionid int,
	cn_cantidad int,
	constraint Pk_cn_detalleventaid primary key(cn_detalleventaid),
	constraint fk_cn_venta foreign key(cn_ventaid) references tbl_ventas(cn_ventaid),
	constraint fk_cn_refaccion foreign key(cn_refaccionid) references tbl_refacciones(cn_refaccionid));
	

