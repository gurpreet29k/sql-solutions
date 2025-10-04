--Problem- https://datalemur.com/questions/tesla-unfinished-parts

SELECT PART, ASSEMBLY_STEP
FROM parts_assembly
WHERE finish_date is NULL
