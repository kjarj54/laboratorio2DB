SELECT 
    a.NombreAgencia,
    COUNT(r.IdReservacion) AS TotalReservaciones,
    SUM(r.PrecioTotalReserva) AS PrecioTotalReservas
FROM Reservaciones r
JOIN Agencia a ON r.IdAgencia = a.IdAgencia
WHERE r.FechaInicio BETWEEN TO_DATE('2025-04-14', 'YYYY-MM-DD') AND TO_DATE('2025-04-20', 'YYYY-MM-DD')
GROUP BY a.NombreAgencia;
