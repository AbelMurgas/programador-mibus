CREATE VIEW pregunta_seis AS
SELECT Bus, round((sum(`Tarifa`)/100),2) as Ingreso_bus
from transacciones
group by Bus
order by Ingreso_bus desc
limit 10;