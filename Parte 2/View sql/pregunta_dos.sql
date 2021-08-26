CREATE VIEW pregunta_dos AS
SELECT MAX(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %H:%i:'))) as Hora, COUNT(DISTINCT Tarjeta) AS `Cantidad_Pasajeros`
from transacciones
GROUP BY HOUR(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %H:%i:')))
ORDER BY HOUR(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %H:%i:')));