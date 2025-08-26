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
numero_asiento varchar(5) primary key,
id_vuelo int,
clase varchar(20),
disponibilidad varchar(20),

foreign key (id_vuelo) references vuelos(id_vuelo)
);

insert into vuelos(origen, destino, fecha_salida, fecha_llegada, precio, aerolinea) 
values
('Madrid', 'París', '2024-03-20', '2024-03-20', 250.00, 'Iberia'),
('Barcelona', 'Roma', '2024-03-22', '2024-03-22', 300.00, 'Vueling'),
('París', 'Nueva York', '2024-03-25', '2024-03-25', 650.00, 'Air France'),
('Lima', 'Colombia', '2024-03-21', '2024-03-21', 100.00, 'Vueling'),
('Argentina', 'Perú', '2024-03-25', '2024-03-25', 120.00, 'Air France');

insert into pasajeros(nombre_apellido, pasaporte, nacionalidad, telefono)
values
('Ana López', 'AB123456', 'Española', '+34123456789'),
('Carlos Mendoza', 'CD789012', 'Mexicano', '+525512345678'),
('Sophie Dubois', 'EF345678', 'Francesa', '+33123456789'),
('Felipe Salvado', 'CD789012', 'Mexicano', '+525512345678'),
('Raúl Fernándes', 'EF345678', 'Francesa', '+33123456789');

insert into reservas(id_vuelo, id_pasajero, asiento, fecha_reserva) 
values
(1, 1, '15B', '2024-03-15'),
(2, 2, '8C', '2024-03-16'),	
(3, 3, '2B', '2024-03-17'),
(4, 4, '2C', '2024-03-12'),	
(5, 5, '7A', '2024-03-15');

insert into pagos(id_reserva, fecha_pago, metodo_pago, monto, validacion_pago)
values
(1, '2024-03-15 10:30:00', 'Tarjeta', 250.00, 1),
(2, '2024-03-16 14:45:00', 'PayPal', 300.00, 1),
(3, '2024-03-17 09:15:00', 'Transferencia', 650.00, 0),
(2, '2024-03-16 14:00:00', 'Transferencia', 100.00, 1),
(3, '2024-03-17 09:55:00', 'Transferencia', 120.00, 0);

insert into asientos(numero_asiento, id_vuelo, clase, disponibilidad)
values
('12A', 1, 'Turista', 'Disponible'),
('15B', 1, 'Turista', 'Ocupado'), 
('01A', 1, 'Business', 'Disponible'),
('08C', 2, 'Turista', 'Disponible'),
('02B', 3, 'Business', 'Ocupado');


