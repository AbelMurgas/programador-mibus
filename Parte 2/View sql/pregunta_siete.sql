
SELECT MAX(SEC_TO_TIME(TIME_TO_SEC(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %k:%i:'))) -
TIME_TO_SEC(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %k:%i:')) % (25 * 60)))) AS Hora, round((SUM(`Tarifa`) / 100), 2)                                                                AS `Ingresos`
from transacciones
GROUP BY SEC_TO_TIME(TIME_TO_SEC(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %k:%i:'))) -
TIME_TO_SEC(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %k:%i:')) % (25 * 60)))
ORDER BY SEC_TO_TIME(TIME_TO_SEC(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %k:%i:'))) -
TIME_TO_SEC(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %k:%i:')) % (25 * 60)));

select MAX(SEC_TO_TIME(TIME_TO_SEC(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %k:%i:'))) as wtf , Fecha_Transaccion
from transacciones
group by  MAX(SEC_TO_TIME(TIME_TO_SEC(TIME(STR_TO_DATE(`Fecha_Transaccion`, '%m/%d/%Y %k:%i:')));