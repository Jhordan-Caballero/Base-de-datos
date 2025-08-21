create table vuelos(
id_vuelo varchar(10) primary key,
    origen varchar(50) NOT NULL,
    destino varchar(50) NOT NULL,
    fecha_salida datetime NOT NULL,
    fecha_llegada datetime NOT NULL,
    precio decimal(10, 2) NOT NULL,
    aerolinea varchar(50) NOT NULL
    );
 create table pasajeros (
    id_pasajero varchar(10) primary key,
    nombre_apellido varchar(100) NOT NULL,
    pasaporte varchar(20) unique NOT NULL,
    nacionalidad varchar(50) NOT NULL,
    telefono varchar(20) NOT NULL
);
  create table reservas (
    id_reserva varchar(10) primary key,
    id_vuelo varchar(10) NOT NULL,
    id_pasajero varchar(10) NOT NULL,
    asiento varchar(5) NOT NULL,
    fecha_reserva DATE NOT NULL,
    
   
    FOREIGN KEY (id_vuelo) REFERENCES vuelos(id_vuelo),
    FOREIGN KEY (id_pasajero) REFERENCES pasajeros(id_pasajero)
    );
   create table pagos (
    id_pago VARCHAR(10) PRIMARY KEY,
    id_reserva VARCHAR(10) NOT NULL,
    fecha_pago DATE NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    validacion_pago VARCHAR(20) NOT NULL,
    

    FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva)
);
INSERT INTO vuelos VALUES 
('V001', 'Nueva York', 'Londres', '2024-03-15 08:00:00', '2024-03-15 20:30:00', 850.00, 'Delta'),
('V002', 'Madrid', 'París', '2024-03-20 14:30:00', '2024-03-20 16:15:00', 120.00, 'Iberia');


INSERT INTO pasajeros VALUES 
('P001', 'Ana García Rodríguez', 'A12345678', 'Española', '+34 600111222'),
('P002', 'John Smith', 'US87654321', 'Estadounidense', '+1 5551234567');

INSERT INTO reservas VALUES 
('R001', 'V001', 'P001', '15A', '2024-02-10'),
('R002', 'V002', 'P002', '8B', '2024-02-15');


INSERT INTO pagos VALUES 
('PAY001', 'R001', '2024-02-10', 'Tarjeta Crédito', 850.00, 'Aprobado'),
('PAY002', 'R002', '2024-02-15', 'PayPal', 120.00, 'Aprobado');

DROP TABLE IF EXISTS pagos;
DROP TABLE IF EXISTS asientos;
DROP TABLE IF EXISTS reservas;

-- 2. Luego eliminar las tablas principales
DROP TABLE IF EXISTS pasajeros;
DROP TABLE IF EXISTS vuelos;
CREATE TABLE vuelos (
    id_vuelo VARCHAR(10) PRIMARY KEY,
    origen VARCHAR(50) NOT NULL,
    destino VARCHAR(50) NOT NULL,
    fecha_salida DATETIME NOT NULL,
    fecha_llegada DATETIME NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    aerolinea VARCHAR(50) NOT NULL
);

CREATE TABLE pasajeros (
    id_pasajero VARCHAR(10) PRIMARY KEY,
    nombre_apellido VARCHAR(100) NOT NULL,
    pasaporte VARCHAR(20) UNIQUE NOT NULL,
    nacionalidad VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

CREATE TABLE reservas (
    id_reserva VARCHAR(10) PRIMARY KEY,
    id_vuelo VARCHAR(10) NOT NULL,
    id_pasajero VARCHAR(10) NOT NULL,
    asiento VARCHAR(5) NOT NULL,
    fecha_reserva DATE NOT NULL,
    FOREIGN KEY (id_vuelo) REFERENCES vuelos(id_vuelo),
    FOREIGN KEY (id_pasajero) REFERENCES pasajeros(id_pasajero)
);

CREATE TABLE pagos (
    id_pago VARCHAR(10) PRIMARY KEY,
    id_reserva VARCHAR(10) NOT NULL,
    fecha_pago DATE NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    validacion_pago VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva)
);

CREATE TABLE asientos (
    id_vuelo VARCHAR(10) NOT NULL,
    numero_asiento VARCHAR(5) NOT NULL,
    clase VARCHAR(20) NOT NULL,
    disponibilidad VARCHAR(15) NOT NULL,
    PRIMARY KEY (id_vuelo, numero_asiento),
    FOREIGN KEY (id_vuelo) REFERENCES vuelos(id_vuelo)
);