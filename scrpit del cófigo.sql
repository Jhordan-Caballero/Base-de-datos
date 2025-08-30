drop table if exists asientos;
drop table if exists pagos;
drop table if exists reservas;
drop table if exists pasajeros;
drop table if exists vuelos;

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
nombre_apellido varchar(30),
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
metodo_pago varchar(25),
monto decimal(10,2),
validacion_pago bit,

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
('Raúl Fernándes', 'EF345678', 'Francesa', '+33123456789'),
('Elwood Catt', 'JL395082', 'Nicaragua', '+505 9456 1298'),
('Darby Felgate', 'QP149765', 'Russia', '+7 912 123 4567'),
('Dominica Pyle', 'SZ417698', 'China', '+86 138 7894 2365'),
('Bay Pencost', 'UC728690', 'China', '+86 159 6342 9071'),
('Lora Durbann', 'WE084263', 'Brazil', '+55 21 99876 5432'),
('Rand Bram', 'YG630158', 'Ivory Coast', '+225 05 6789 1234'),
('Perceval Dallosso', 'AI583470', 'Vietnam', '+84 912 345 678'),
('Aleda Pigram', 'CK927154', 'Palestinian', '+970 59 876 5432'),
('Burlie Schustl', 'EM205479', 'Thailand', '+66 81 234 5678'),
('Porty Jori', 'GO513947', 'Tunisia', '+216 29 345 678'),
('Briant De La Haye', 'IQ364781', 'Russia', '+7 915 234 5678'),
('Kalie Scoble', 'KS429763', 'Sweden', '+46 70 123 4567'),
('Catriona Beaument', 'MU784210', 'Russia', '+7 911 345 6789'),
('Amberly Handling', 'OW843175', 'China', '+86 139 6743 2956'),
('Dyna DeVere Hunt', 'QY951326', 'China', '+86 150 8321 4896'),
('Janella Hardaker', 'SA139682', 'Colombia', '+57 321 987 6543'),
('Alvin Wenzel', 'UC829465', 'Greece', '+30 693 512 3456'),
('Jerrine Peeters', 'WE694120', 'Philippines', '+63 917 789 6543'),
('Warner Driutti', 'YG703519', 'China', '+86 152 3456 7890'),
('Paige Hayhow', 'AI472503', 'Sweden', '+46 72 987 6543'),
('Dorisa Skill', 'CK159824', 'Ukraine', '+380 98 765 4321'),
('Bobbye Patmore', 'EM725091', 'China', '+86 133 4567 8901'),
('Jayme Dairton', 'GO461783', 'Indonesia', '+62 812 3456 7890'),
('Sayre Stroyan', 'IQ230567', 'Indonesia', '+62 811 456 7890'),
('Joellyn Stutter', 'KS817304', 'Croatia', '+385 91 234 5678'),
('Julietta Delahunt', 'MU328176', 'Republic of the Congo', '+243 81 234 5678'),
('Halie Jewar', 'OW604812', 'France', '+33 6 12 34 56 78'),
('Jessamyn Buddles', 'QY587203', 'Peru', '+51 996 543 210'),
('Gardiner Ferbrache', 'SA970834', 'Sweden', '+46 70 765 4321'),
('Rudolph Housbie', 'UC214580', 'Iran', '+98 912 345 6789'),
('Dun Craythorn', 'WE508673', 'China', '+86 137 6543 2109'),
('Dasha Eppson', 'YG437912', 'Indonesia', '+62 813 234 5678'),
('Bibby Evershed', 'AI276489', 'Indonesia', '+62 815 432 1098'),
('Ransom Chippindale', 'CK683105', 'Peru', '+51 975 432 100'),
('Zelig Brinded', 'EM740291', 'Brazil', '+55 31 98765 4321'),
('Rosalyn Vondrys', 'GO195378', 'China', '+86 138 5678 1234'),
('Lamond Ahmed', 'IQ507326', 'Croatia', '+385 95 432 1098'),
('Anders Treadger', 'KS614209', 'Madagascar', '+261 33 123 4567'),
('Haroun Holmes', 'MU941286', 'United States', '+1 202 555 0198'),
('Kristan Metzing', 'OW193684', 'Peru', '+51 987 654 321'),
('Willie Netherwood', 'QY672139', 'Russia', '+7 903 456 7890'),
('Aldon Ridsdell', 'SA769382', 'Ghana', '+233 24 567 8901'),
('Chrotoem Abels', 'UC287953', 'Russia', '+7 905 321 9876'),
('Andy Kettleson', 'WE294175', 'China', '+86 135 1234 5678'),
('Dredi Curd', 'YG356729', 'Russia', '+7 914 567 8901'),
('Tessy Athelstan', 'AI590247', 'Russia', '+7 901 234 5678'),
('Tamas Vigneron', 'CK962374', 'Sweden', '+46 70 123 9876'),
('Gnni Chaperling', 'EM280497', 'Brazil', '+55 61 98765 4321'),
('Margaux Lattin', 'GO195736', 'Guatemala', '+502 555 7890'),
('Anabella Tutchings', 'IQ520914', 'China', '+86 155 1234 8765'),
('Joeann Gotcliff', 'KS947136', 'Kyrgyzstan', '+996 775 234 567'),
('Peri Battram', 'MU706491', 'Peru', '+51 991 876 543'),
('Eugenius Headon', 'OW439602', 'Ukraine', '+380 63 234 5678'),
('Erwin Baise', 'QY804216', 'Haiti', '+509 372 4567'),
('Leta Tartt', 'SA473590', 'Afghanistan', '+93 78 123 4567'),
('Lilli Sarath', 'UC905761', 'Sweden', '+46 72 567 8901'),
('Franz Roset', 'WE720138', 'Greece', '+30 694 567 8901'),
('Natalya Offner', 'YG617240', 'Czech Republic', '+420 602 345 678'),
('Genevra Shipperbottom', 'AI874652', 'Ethiopia', '+251 91 234 5678'),
('Francine Adolfsen', 'CK695731', 'Indonesia', '+62 812 678 9012'),
('Cairistiona Tummond', 'EM739204', 'Tanzania', '+255 754 321 876'),
('Kelci Colliver', 'GO296754', 'China', '+86 139 2345 6789'),
('Denys Endricci', 'IQ631852', 'Nigeria', '+234 703 567 8901'),
('Findley Godleman', 'KS942715', 'Indonesia', '+62 821 234 5678'),
('Fidelio Guerry', 'MU781432', 'China', '+86 131 2456 7890'),
('Krishnah Dabels', 'OW163945', 'Russia', '+7 901 234 5678'),
('Diannne Samter', 'QY591738', 'Cameroon', '+237 69 123 4567'),
('Inge Hewins', 'SA967324', 'Morocco', '+212 661 234 567'),
('Dermot Stainburn', 'UC803765', 'Armenia', '+374 99 123 456'),
('Ajay Durward', 'WE374105', 'Russia', '+7 916 456 7890'),
('Constancy Darke', 'YG217340', 'China', '+86 134 5678 9012'),
('Cy Servante', 'AI402697', 'China', '+86 139 8765 4321'),
('Lennard Giorgi', 'CK591236', 'Peru', '+51 993 876 543'),
('Cordie Rosenberger', 'EM210489', 'Brazil', '+55 81 99876 5432'),
('Noelyn Penquet', 'GO385170', 'Brazil', '+55 11 98765 4321'),
('Frank Greenhough', 'IQ147852', 'Philippines', '+63 932 345 6789'),
('Tan Connold', 'KS873046', 'Sweden', '+46 73 234 5678'),
('Star Casford', 'MU758130', 'Greece', '+30 697 123 4567'),
('Travers Selwyne', 'OW612984', 'Colombia', '+57 315 234 5678'),
('Randie Jankin', 'QY860423', 'Mexico', '+52 555 123 4567'),
('Henryetta Noice', 'SA738120', 'Chile', '+56 9 8765 4321'),
('Fons Schrieves', 'UC867051', 'Albania', '+355 69 345 6789'),
('Lissa Thynn', 'WE596138', 'Luxembourg', '+352 621 234 567'),
('Mattias Darrell', 'YG375806', 'Honduras', '+504 9456 7890'),
('Cirilo Camoletto', 'AI672905', 'China', '+86 132 3456 7890'),
('Aeriela Clarke', 'CK504271', 'Portugal', '+351 912 345 678'),
('Marjory Franz', 'EM285940', 'Nigeria', '+234 702 345 6789'),
('Rodolph Grewcock', 'GO579130', 'Kazakhstan', '+7 777 234 5678'),
('María González', 'MX492615', 'Mexico', '+52 55 3819 4726'),
('José Ramírez', 'CO158924', 'Colombia', '+57 310 824 5931'),
('Ana Pereira', 'BR906271', 'Brasil', '+55 21 98714 3602'),
('Luis Fernández', 'AR284105', 'Argentina', '+54 11 4982 7035'),
('Carolina Torres', 'CL573829', 'Chile', '+56 9 4218 5072'),
('Diego Morales', 'PE941620', 'Perú', '+51 982 540 613'),
('Valentina López', 'VE631205', 'Venezuela', '+58 212 371 9504'),
('Andrés Castro', 'EC428510', 'Ecuador', '+593 98 351 7042'),
('Camila Herrera', 'PY952307', 'Paraguay', '+595 981 642 370'),
('Juan Rojas', 'BO513926', 'Bolivia', '+591 715 23846'),
('Sofía Mendoza', 'UY760184', 'Uruguay', '+598 94 312 705'),
('Ricardo Jiménez', 'CR249805', 'Costa Rica', '+506 8712 5309'),
('Lucía Vargas', 'PA584721', 'Panamá', '+507 6402 9183'),
('Mateo Delgado', 'DO316482', 'República Dominicana', '+1 809 715 3049'),
('Gabriela Cruz', 'PR729054', 'Puerto Rico', '+1 787 652 3904'),
('Héctor Salazar', 'HN845210', 'Honduras', '+504 9982 4317'),
('Natalia Paredes', 'GT158742', 'Guatemala', '+502 5418 2706');

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

select * from pasajeros;
