-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el codigo en Pig para manipulación de fechas que genere la siguiente
-- salida.
-- 
--    1971-07-08,08,8,jue,jueves
--    1974-05-23,23,23,jue,jueves
--    1973-04-22,22,22,dom,domingo
--    1975-01-29,29,29,mie,miercoles
--    1974-07-03,03,3,mie,miercoles
--    1974-10-18,18,18,vie,viernes
--    1970-10-05,05,5,lun,lunes
--    1969-02-24,24,24,lun,lunes
--    1974-10-17,17,17,jue,jueves
--    1975-02-28,28,28,vie,viernes
--    1969-12-07,07,7,dom,domingo
--    1973-12-24,24,24,lun,lunes
--    1970-08-27,27,27,jue,jueves
--    1972-12-12,12,12,mar,martes
--    1970-07-01,01,1,mie,miercoles
--    1974-02-11,11,11,lun,lunes
--    1973-04-01,01,1,dom,domingo
--    1973-04-29,29,29,dom,domingo
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
dia = FOREACH anio GENERATE fecha, ToString(fecha_1, 'dd') AS dia, GetDay(fecha_1) AS dia1, ToString(fecha_1, 'e') AS dia2;
nombre_dia = FOREACH dia GENERATE fecha, dia, dia1, (
case dia2
WHEN '1' THEN 'lun'
WHEN '2' THEN 'mar'
WHEN '3' THEN 'mie'
WHEN '4' THEN 'jue'
WHEN '5' THEN 'vie'
WHEN '6' THEN 'sab'
ELSE 'dom'
END),
(CASE dia2
WHEN '1' THEN 'lunes'
WHEN '2' THEN 'martes'
WHEN '3' THEN 'miercoles'
WHEN '4' THEN 'jueves'
WHEN '5' THEN 'viernes'
WHEN '6' THEN 'sabado'
ELSE 'domingo'
END);

STORE nombre_dia INTO 'output' USING PigStorage(',');
