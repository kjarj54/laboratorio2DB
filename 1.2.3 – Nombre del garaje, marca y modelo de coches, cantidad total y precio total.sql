SELECT 
    g.NombreGarage,
    c.Marca,
    c.Modelo,
    COUNT(c.IdCoche) AS TotalCoches,
    SUM(c.PrecioAlquiler) AS PrecioTotalAlquiler
FROM Garage g
JOIN Coches c ON g.IdGarage = c.IdGarage
GROUP BY g.NombreGarage, c.Marca, c.Modelo
ORDER BY TotalCoches DESC, g.NombreGarage, c.Marca, c.Modelo;
