-- ============================================
-- 1. CREACIÓN DE TABLAS
-- ============================================

CREATE TABLE Clientes (
    IdCliente INT PRIMARY KEY,
    DNI VARCHAR2(20),
    CodigoUnico VARCHAR2(20),
    NombreCliente VARCHAR2(20),
    ApellidoPaternoCliente VARCHAR2(20),
    ApellidoMaternoCliente VARCHAR2(20),
    Direccion VARCHAR2(140),
    Telefono VARCHAR2(20)
);

CREATE TABLE Agencia (
    IdAgencia INT PRIMARY KEY,
    NombreAgencia VARCHAR2(20)
);

CREATE TABLE Garage (
    IdGarage INT PRIMARY KEY,
    NombreGarage VARCHAR2(10)
);

CREATE TABLE Coches (
    IdCoche INT PRIMARY KEY,
    Matricula VARCHAR2(10),
    Marca VARCHAR2(10),
    Modelo VARCHAR2(15),
    Color VARCHAR2(10),
    CuantosLitrosTiene FLOAT,
    PrecioAlquiler NUMBER(10,2),
    IdReserva INT,
    IdGarage INT REFERENCES Garage(IdGarage)
);

CREATE TABLE Reservaciones (
    IdReservacion INT PRIMARY KEY,
    FechaInicio DATE,
    FechaFin DATE,
    PrecioTotalReserva NUMBER(10,2),
    Entregado NUMBER(1),
    IdCliente INT REFERENCES Clientes(IdCliente),
    IdAgencia INT REFERENCES Agencia(IdAgencia),
    IdCoche INT REFERENCES Coches(IdCoche)
);

CREATE TABLE Avalados (
    IdAvala INT PRIMARY KEY,
    IdClienteAvala INT REFERENCES Clientes(IdCliente),
    IdClienteAvalado INT REFERENCES Clientes(IdCliente),
    Avalado NUMBER(1)
);

-- ============================================
-- 2. INSERCIÓN DE DATOS RELEVANTES
-- ============================================

-- Agencias
INSERT INTO Agencia VALUES (1, 'Viajes del Sur S.A.');
INSERT INTO Agencia VALUES (2, 'Tour Express');
INSERT INTO Agencia VALUES (3, 'Rutas del Norte');

-- Garajes
INSERT INTO Garage VALUES (1, 'Centro');
INSERT INTO Garage VALUES (2, 'Norte');
INSERT INTO Garage VALUES (3, 'Sur');

-- Clientes
INSERT INTO Clientes VALUES (1, '12345678', 'C001', 'Juan', 'Fernández', 'Lopez', 'Av. Lima 123', '999888777');
INSERT INTO Clientes VALUES (2, '87654321', 'C002', 'Lucía', 'Gómez', 'Ramírez', 'Calle Sol 456', '999111222');
INSERT INTO Clientes VALUES (3, '11223344', 'C003', 'Pedro', 'Fernández', 'Soto', 'Av. Andes 999', '998877665');
INSERT INTO Clientes VALUES (4, '55667788', 'C004', 'María', 'Ruiz', 'Delgado', 'Calle Norte 890', '997755333');
INSERT INTO Clientes VALUES (5, '99887766', 'C005', 'Ana', 'Morales', 'Fernández', 'Jr. Los Alamos 321', '991122334');
INSERT INTO Clientes VALUES (6, '66778899', 'C006', 'Carlos', 'Sánchez', 'Fernández', 'Jr. Pacifico 800', '990011223');

-- Coches
INSERT INTO Coches VALUES (1, 'ABC123', 'Toyota', 'RAV4', 'Rojo', 55.0, 500.00, NULL, 1);
INSERT INTO Coches VALUES (2, 'XYZ789', 'Honda', 'Civic', 'Negro', 40.0, 400.00, NULL, 2);
INSERT INTO Coches VALUES (3, 'MNO456', 'Ford', 'Escape', 'Blanco', 60.0, 350.00, NULL, 3);
INSERT INTO Coches VALUES (4, 'JKL321', 'Toyota', 'RAV4', 'Azul', 55.0, 520.00, NULL, 2);
INSERT INTO Coches VALUES (5, 'DEF987', 'Chevrolet', 'Spark', 'Gris', 30.0, 300.00, NULL, 1);
INSERT INTO Coches VALUES (6, 'LMN654', 'Toyota', 'Corolla', 'Negro', 45.0, 450.00, NULL, 3);
INSERT INTO Coches VALUES (7, 'QWE321', 'Toyota', 'RAV4', 'Verde', 50.0, 510.00, NULL, 1);

-- Reservaciones - Semana Santa y otras fechas
INSERT INTO Reservaciones VALUES (1, TO_DATE('2025-04-15', 'YYYY-MM-DD'), TO_DATE('2025-04-18', 'YYYY-MM-DD'), 1200.00, 1, 1, 1, 1);
INSERT INTO Reservaciones VALUES (2, TO_DATE('2025-03-10', 'YYYY-MM-DD'), TO_DATE('2025-03-15', 'YYYY-MM-DD'), 700.00, 0, 2, 2, 2);
INSERT INTO Reservaciones VALUES (3, TO_DATE('2025-04-14', 'YYYY-MM-DD'), TO_DATE('2025-04-19', 'YYYY-MM-DD'), 1500.00, 1, 3, 1, 4);
INSERT INTO Reservaciones VALUES (4, TO_DATE('2025-04-16', 'YYYY-MM-DD'), TO_DATE('2025-04-20', 'YYYY-MM-DD'), 1800.00, 1, 5, 1, 7);
INSERT INTO Reservaciones VALUES (5, TO_DATE('2025-04-01', 'YYYY-MM-DD'), TO_DATE('2025-04-05', 'YYYY-MM-DD'), 600.00, 0, 4, 3, 3);
INSERT INTO Reservaciones VALUES (6, TO_DATE('2025-04-15', 'YYYY-MM-DD'), TO_DATE('2025-04-20', 'YYYY-MM-DD'), 2000.00, 1, 6, 1, 6);

-- Asociar Coches con Reservaciones
UPDATE Coches SET IdReserva = 1 WHERE IdCoche = 1;
UPDATE Coches SET IdReserva = 2 WHERE IdCoche = 2;
UPDATE Coches SET IdReserva = 3 WHERE IdCoche = 4;
UPDATE Coches SET IdReserva = 4 WHERE IdCoche = 7;
UPDATE Coches SET IdReserva = 5 WHERE IdCoche = 3;
UPDATE Coches SET IdReserva = 6 WHERE IdCoche = 6;

-- Avalados
INSERT INTO Avalados VALUES (1, 2, 1, 1);
INSERT INTO Avalados VALUES (2, 1, 2, 1);
INSERT INTO Avalados VALUES (3, 3, 5, 1);
INSERT INTO Avalados VALUES (4, 4, 6, 1);
