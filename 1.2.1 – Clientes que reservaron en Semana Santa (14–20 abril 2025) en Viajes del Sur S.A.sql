SELECT 
    c.IdCliente,
    c.DNI,
    c.CodigoUnico,
    c.NombreCliente,
    c.ApellidoPaternoCliente,
    c.ApellidoMaternoCliente,
    c.Direccion,
    c.Telefono
FROM Clientes c
JOIN Reservaciones r ON c.IdCliente = r.IdCliente
JOIN Agencia a ON r.IdAgencia = a.IdAgencia
WHERE a.NombreAgencia = 'Viajes del Sur S.A.'
  AND r.FechaInicio BETWEEN TO_DATE('2025-04-14', 'YYYY-MM-DD') AND TO_DATE('2025-04-20', 'YYYY-MM-DD');
