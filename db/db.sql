CREATE TABLE CLIENTE 
(
 id INT NOT NULL auto_increment , 
 nombre VARCHAR (50) NOT NULL, 
 apellido VARCHAR (50) NOT NULL, 
 ci INT NOT NULL,
 telefono int not null,
 direccion VARCHAR (20) NOT NULL, 
 fechaNacimiento date,
 primary key (id)
);

create table ROL
(
id int not null auto_increment,
nombre VARCHAR (50) NOT NULL,
descripcion varchar(120) not null,
primary key(id)
);


create table CARGO 
( 
  id int not null auto_increment , 
  nombre varchar (120) not null, 
  sueldo float not null, 
  primary key (id) 
);

create table EMPLEADO
(
  id int not null auto_increment , 
  nombre varchar(40) not null, 
  apellido varchar(40) not null, 
  ci int not null, 
  direccion varchar(120) not null, 
  sexo varchar(1) not null,
  fechaNacimiento date,
  idCargo int not null,  
  primary key (id),
  foreign key (idCargo) references CARGO ( id)
   ON UPDATE CASCADE
   ON DELETE CASCADE 
  
);

create table USUARIO
(
 id int not null auto_increment , 
 login varchar(40) not null, 
 Password varchar(40) not null, 
 idEmpleado int not null, 
 idRol int not null,
 primary key (id),
 foreign key (idEmpleado) references EMPLEADO ( id)
   ON UPDATE CASCADE
   ON DELETE CASCADE,
  foreign key (idRol) references ROL ( id)
   ON UPDATE CASCADE
   ON DELETE CASCADE
);

create table PEDIDO
( 
 id int not null auto_increment , 
 detalle varchar(300) not null, 
 fecha date not null,
 fechaEntrega date not null, 
 total float not null,
 idEmpleado int not null, 
 idCliente int not null,
 primary key (id),
  foreign key (idEmpleado) references EMPLEADO ( id)
   ON UPDATE CASCADE
   ON DELETE CASCADE,
    foreign key (idCliente) references CLIENTE ( id)
   ON UPDATE CASCADE
   ON DELETE CASCADE 
);

create table NOTAENTREGA(
 id int not null auto_increment,
 fecha date not null,
 idEmpleado int not null,
 primary key (id),
 foreign key  ( idEmpleado ) references EMPLEADO (id) 
 on update cascade 
  on delete cascade
);

create table PRODUCTO
( 
 id int not null auto_increment , 
 nombre varchar(50) not null, 
 precio float not null,
 cantidad int not null, 
 descripcion varchar(300) not null, 
 primary key(id)
);

create table DETALLEVENTA
(
 idPedido int not null, 
 idProducto int not null, 
 cantidad int not null, 
 precioVenta float not null, 
 primary key ( idPedido , idProducto) , 
 foreign key  ( idPedido) references PEDIDO(id) 
 on update cascade 
  on delete cascade, 
  foreign key (idProducto) references PRODUCTO ( id) 
  on update cascade 
  on delete cascade
);

create table UNIDADMEDIDA
(
id int not null auto_increment,
abreviatura char(5) not null,
nombre varchar(50)not null,
primary key (id)

);

create table MATERIA
(
 id int not null auto_increment, 
 nombre varchar(120) not null, 
 stock float not null, 
 stockMinimo float not null,
 fechaVencimiento date not null,
 idUnidad int not null,
 primary key (id),
 foreign key  ( idUnidad ) references UNIDADMEDIDA (id) 
 on update cascade 
  on delete cascade

);

create table PROVEEDOR 
(
 id int not null auto_increment , 
 nombre VARCHAR (50) NOT NULL, 
 apellido VARCHAR(50) NOT NULL,
 direccion VARCHAR (20) NOT NULL, 
 telefono int not null,
 primary key (id)
);
create table NOTACOMPRA
(
 id int not null auto_increment, 
 fecha date not null, 
 total float not null,
 idEmpleado int not null,
 primary key (id),
 foreign key  ( idEmpleado ) references EMPLEADO (id) 
 on update cascade 
  on delete cascade
);
create table DETALLECOMPRA
(
 id int not null auto_increment,
 cantidad int not null, 
 precio float not null, 
 fecha date not null,
 tipoUnidad int not null,
 idNota int not null, 
 idMateria int not null, 
 idProveedor int not null,
 primary key ( id) , 
 foreign key  ( idNota ) references NOTACOMPRA (id) 
 on update cascade 
  on delete cascade, 
  foreign key (idMateria) references MATERIA ( id ) 
  on update cascade 
  on delete cascade,
  foreign key (idProveedor) references PROVEEDOR ( id ) 
  on update cascade 
  on delete cascade,
  foreign key (tipoUnidad) references UNIDADMEDIDA ( id ) 
  on update cascade 
  on delete cascade
);


/*-----Poblado de tablas-----*/
insert into ROL(id, nombre, descripcion)values
(1,'Admi','Puede ingresara todo y hacer todo'),
(2,'Usuario','Puede ingresar a todo y ver todo pero no agregar, editar ni eliminar nada'),
(3,'Secretaria','Puede ingresar a datos en todos los modulos y editarlos pero no asi eliminarlos'),
(4,'Encargado de ventas','Permiso a todos las operaciones del modulo de ventas'),
(5,'Encargado de almacen','Permiso a todos las operaciones del modulo de almacen'),
(6,'Encargado de produccion','Permiso a todos las operaciones del modulo de produccion'),
(7,'Maestro de produccion','Permiso a todos las operaciones del modulo de produccion');
select * from ROL;
