SELECT  CONCAT( Stud_sem_labor.IdFSL, '(',Discipline.dendisc,')')  as Grupa_de_labor ,
STRING_AGG(distinct persoane.numepren || ' ( '|| traseu_stud.codspec || ' )', ',')  as Lista_studenti
FROM Stud_sem_labor INNER JOIN Studenti on stud_sem_labor.matricol=studenti.matricol
                    INNER JOIN Persoane on studenti.IdPers=persoane.IdPers
					INNER JOIN Traseu_stud on Traseu_stud.matricol=studenti.matricol
					INNER JOIN Formatii_Seminar_labor on stud_sem_labor.IdFSL=Formatii_seminar_labor.IdFSL
					INNER JOIN Discipline on Formatii_Seminar_labor.coddisc=discipline.coddisc
					INNER JOIN Plan_invatamant on traseu_stud.codspec=plan_invatamant.codspec
WHERE PLAN_INVATAMANT.AnUniv = '2020-2021'
group by stud_sem_labor.IDFSL,discipline.dendisc
order by stud_sem_labor.IDFSL,discipline.dendisc