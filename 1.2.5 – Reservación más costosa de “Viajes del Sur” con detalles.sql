SELECT 
    r.IdReservacion,
    r.FechaInicio,
    r.FechaFin,
    r.PrecioTotalReserva,
    r.Entregado,
    a.NombreAgencia,
    c.NombreCliente,
    c.ApellidoPaternoCliente,
    c.ApellidoMaternoCliente,
    co.Marca,
    co.Modelo,
    co.Matricula
FROM Reservaciones r
JOIN Agencia a ON r.IdAgencia = a.IdAgencia
JOIN Clientes c ON r.IdCliente = c.IdCliente
JOIN Coches co ON r.IdCoche = co.IdCoche
WHERE a.NombreAgencia = 'Viajes del Sur S.A.'
  AND r.PrecioTotalReserva = (
      SELECT MAX(r2.PrecioTotalReserva)
      FROM Reservaciones r2
      JOIN Agencia a2 ON r2.IdAgencia = a2.IdAgencia
      WHERE a2.NombreAgencia = 'Viajes del Sur S.A.'
  );
