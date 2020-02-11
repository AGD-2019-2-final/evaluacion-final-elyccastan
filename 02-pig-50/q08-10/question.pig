-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv'
    AS (f1:CHARARRAY, f2:BAG{t: TUPLE()}, f3:MAP[]);

primer = FOREACH data GENERATE FLATTEN(f2) AS ff2, FLATTEN(f3) AS ff3;
agrupa = GROUP primer BY (ff2, ff3);
cuenta = FOREACH agrupa GENERATE group, COUNT(primer);
STORE cuenta INTO 'output';