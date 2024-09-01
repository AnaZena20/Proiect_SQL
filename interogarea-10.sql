prima varianta :

SELECT sc.idfc,COUNT(sc.matricol)
from formatii_curs fc inner join stud_cursuri sc on fc.IdFc=sc.IdFc
where fc.anuniv='2021-2022'
group by sc.idfc
order  by count(sc.matricol) desc
limit 5





a doua varianta:


WITH TEMP1 as(SELECT idfc,COUNT(matricol) as Nrstudenti from stud_cursuri
group by idfc
order by COUNT(matricol) desc),
TEMP2 as (select idfc
		  from formatii_curs
		 where anuniv='2021-2022')
SELECT TEMP1.idfc,TEMP1.Nrstudenti
FROM TEMP1  inner join TEMP2  on TEMP1.idfc=TEMP2.idfc
limit 5



