-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname, 
--        color 
--    FROM 
--        u
--    WHERE color NOT IN ('blue','black');
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

nombre_color = FOREACH data GENERATE name, color;
fil = FILTER nombre_color by NOT color IN ('blue','black');

STORE fil INTO 'output' USING PigStorage(',');