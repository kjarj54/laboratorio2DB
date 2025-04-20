SELECT 
    co.IdCoche,
    co.Matricula,
    co.Marca,
    co.Modelo,
    co.Color,
    co.CuantosLitrosTiene,
    co.PrecioAlquiler,
    co.IdReserva,
    co.IdGarage
FROM Coches co
JOIN Reservaciones r ON co.IdCoche = r.IdCoche
JOIN Clientes c ON r.IdCliente = c.IdCliente
WHERE c.ApellidoPaternoCliente = 'Fernández'
  AND co.Marca = 'Toyota'
  AND co.Modelo = 'RAV4';
