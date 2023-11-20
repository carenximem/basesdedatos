-- asignación de silla a un pasajero
INSERT INTO reservas (pasajero_id, vuelo_id, silla_id) VALUES (1, 1, 101);
--  consulta de reserva por cédula del pasajero
SELECT *
FROM reservas r
JOIN pasajeros p ON r.pasajero_id = p.id
WHERE p.cedula = '1234567890';
--  eliminación de reserva por cédula del pasajero
DELETE FROM reservas
WHERE pasajero_id = (SELECT id FROM pasajeros WHERE cedula = '1234567890');
--  búsqueda de pasajero por cédula
SELECT *
FROM pasajeros
WHERE cedula = '1234567890';
--  cálculo del porcentaje de ocupación
SELECT COUNT(*) / 50 * 100 AS PorcentajeOcupacion
FROM reservas;
--  consulta del valor total de ventas
SELECT SUM(valor) AS ValorTotalVentas
FROM ventas;
--  consulta del valor promedio de venta por pasajero
SELECT AVG(valor) AS ValorPromedioVenta
FROM ventas;

