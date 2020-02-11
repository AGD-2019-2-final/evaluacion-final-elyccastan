-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv'
    AS (f1:CHARARRAY, f2:BAG{}, f3:MAP[]);

c_f3 = FOREACH data GENERATE FLATTEN (f3) AS uno;
agrupa = GROUP c_f3 by uno;
cuenta = FOREACH agrupa GENERATE group, COUNT(c_f3.uno);
STORE cuenta INTO 'output'USING PigStorage(',');