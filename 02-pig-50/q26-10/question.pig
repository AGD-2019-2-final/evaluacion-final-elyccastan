-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname 
--    FROM 
--        u 
--    WHERE 
--        SUBSTRING(firstname, 0, 1) >= 'm';
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

p_letra = FOREACH data GENERATE name, SUBSTRING(name, 0, 1) AS letra;
mayor_m = FILTER p_letra by letra >= 'M';
nombre_mayor_m = FOREACH mayor_m GENERATE name;

STORE nombre_mayor_m INTO 'output';