SELECT MAX(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %H:%i:'))) as Hora, COUNT(Tarjeta) AS `N_Transacciones`
from transacciones
GROUP BY HOUR(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %H:%i:')))
ORDER BY HOUR(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %H:%i:')));