-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código en Pig para manipulación de fechas que genere la siguiente 
-- salida.
-- 
--    1971-07-08,jul,07,7
--    1974-05-23,may,05,5
--    1973-04-22,abr,04,4
--    1975-01-29,ene,01,1
--    1974-07-03,jul,07,7
--    1974-10-18,oct,10,10
--    1970-10-05,oct,10,10
--    1969-02-24,feb,02,2
--    1974-10-17,oct,10,10
--    1975-02-28,feb,02,2
--    1969-12-07,dic,12,12
--    1973-12-24,dic,12,12
--    1970-08-27,ago,08,8
--    1972-12-12,dic,12,12
--    1970-07-01,jul,07,7
--    1974-02-11,feb,02,2
--    1973-04-01,abr,04,4
--    1973-04-29,abr,04,4
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.csv' USING PigStorage(',')
    AS (Id:INT, name:CHARARRAY, l_name:CHARARRAY, fecha:CHARARRAY, color:CHARARRAY, num:INT);

anio = FOREACH data GENERATE fecha, ToDate(fecha,'yyyy-MM-dd') AS fecha_1;
mes2 = FOREACH anio GENERATE fecha, fecha_1, GetMonth(fecha_1) AS Mes;
mes3 = FOREACH mes2 GENERATE fecha, (
case Mes
when 1 then 'ene'
when 2 then 'feb'
when 3 then 'mar'
when 4 then 'abr'
when 5 then 'may'
when 6 then 'jun'
when 7 then 'jul'
when 8 then 'ago'
when 9 then 'sep'
when 10 then 'oct'
when 11 then 'nov'
else 'dic' END
) AS nombre_mes, ToString(fecha_1, 'MM') AS Mes1, ToString(fecha_1, 'M') AS Mes2;

STORE mes3 INTO 'output' USING PigStorage(',');