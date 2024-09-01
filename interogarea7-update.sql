--aflam la cate discipline a dat fiecare student examen in iunie 2022 si notam cu TEMP1
WITH TEMP1 AS( Select matricol,count(coddisc) as NrDiscipline from examene
where dataex  between '06/01/2022' AND '06/30/2022'
group by matricol
order by matricol
			  ),

--aflam cate discipline obligatorii studiaza fiecare student si notam cu TEMP2
TEMP2 as(SELECT  ts.matricol, pi.tip_disc, COUNT (distinct coddisc) as NrDiscipline
FROM studenti s inner join traseu_stud ts on s.matricol=ts.matricol inner join plan_invatamant pi on ts.an=pi.an
where pi.tip_disc='Obligatorie'
GROUP BY ts.matricol,pi.tip_disc
ORDER BY ts.matricol,pi.tip_disc)

--aflam nr studentilor care au dat examen la TOATE disciplinele obligatorii in iunie 2022
SELECT COUNT(TEMP1.matricol) 
FROM TEMP1 INNER JOIN TEMP2
ON TEMP1.matricol = TEMP2.matricol
WHERE TEMP1.nrdiscipline=TEMP2.nrdiscipline