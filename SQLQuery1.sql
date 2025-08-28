create table vuelos(
id_vuelo int identity(1,1) primary key,
origen varchar(25),
destino varchar(25),
fecha_salida date,
fecha_llegada date,
precio decimal(10,2),
aerolinea varchar(25)
);
create table pasajeros(
id_pasajero int identity(1,1) primary key,
nombre_apellido varchar(25),
pasaporte varchar(25),
nacionalidad varchar(25),
telefono varchar(25)
);
create table reservas(
id_reserva int identity(1,1) primary key,
id_vuelo int,
id_pasajero int,
asiento varchar(10),
fecha_reserva date,

foreign key (id_vuelo) references vuelos(id_vuelo),
foreign key (id_pasajero) references pasajeros(id_pasajero)
);
create table pagos(
id_pago int identity(1,1) primary key,
id_reserva int,
fecha_pago datetime,
metodo_pago varchar(15),
monto decimal(10,2),
validacion_pago varchar(10),

foreign key (id_reserva) references reservas(id_reserva)
);
create table asientos(
numero_asiento varchar(