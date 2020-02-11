-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv'
    AS (f1:CHARARRAY, f2:BAG{}, f3:MAP[]);

primer = FOREACH data GENERATE f1, COUNT(f2), COUNT(KEYSET(f3));
ordena = ORDER primer BY $0,$1,$2;
STORE ordena INTO 'output' USING PigStorage(',');