CREATE VIEW pregunta_tres AS
SELECT MAX(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %H:%i:'))) as Hora, COUNT(DISTINCT bus) AS `Cantidad_Buses`
from transacciones
GROUP BY HOUR(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %H:%i:')))
ORDER BY HOUR(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %H:%i:')));