SELECT MAX(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %H:%i:'))) as Hora, ROUND(avg(tarifa),2) AS `ingreso_Promedio`
from transacciones
GROUP BY HOUR(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %H:%i:')))
ORDER BY HOUR(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %H:%i:')));