WITH X as(WITH T1 as (SELECT distinct coddisc,codprof
FROM formatii_seminar_labor
UNION
SELECT distinct coddisc,codprof
FROM formatii_curs
order by codprof)
SELECT T1.codprof,COUNT(T1.coddisc)
FROM T1
WHERE T1.coddisc IN (SELECT distinct fc.coddisc
FROM formatii_curs fc FULL OUTER JOIN formatii_seminar_labor fsl ON fc.codprof=fsl.codprof 
where fc.codprof IN (SELECT codprof from profi where numeprof='Fotache Marin')
)
GROUP By T1.codprof
ORDER BY T1.codprof)
SELECT p.numeprof
FROM profi p inner join X on p.codprof=X.codprof



