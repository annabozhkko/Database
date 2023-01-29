WITH RECURSIVE temp(id, fullname, bossid, path) AS (
    SELECT t1.id, t1.fullname, t1.bossid, CAST(t1.id AS VARCHAR(50)) as path
    FROM employees t1
    WHERE t1.bossid IS NULL
    UNION
    SELECT t2.id, t2.fullname, t2.bossid,  CAST(temp.path || '->' || t2.id AS VARCHAR(50))
    FROM employees t2 INNER JOIN temp ON temp.id = t2.bossid)

SELECT * FROM temp
ORDER BY path