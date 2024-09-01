--interogarea 5
SELECT ROUND(AVG(Nota)) AS medie_note
FROM examene
	INNER JOIN discipline ON examene.coddisc=discipline.coddisc
	INNER JOIN studenti ON examene.matricol=studenti.matricol
	INNER JOIN traseu_stud ON studenti.matricol=traseu_stud.matricol
	INNER JOIN specializari ON traseu_stud.codspec=specializari.codspec
	INNER JOIN formatii_curs ON discipline.coddisc=formatii_curs.coddisc
WHERE DenDisc='Baze De Date' and DataEx between '06/01/2020' AND '06/30/2020' AND numespec='Statis. Si Prev. Economica'

--interogarea 6, doar numele profilor
SELECT DISTINCT profi.numeprof
from profi
	INNER JOIN formatii_curs ON profi.codprof=formatii_curs.codprof
	INNER JOIN plan_invatamant ON formatii_curs.anuniv=plan_invatamant.anuniv
	INNER JOIN specializari ON plan_invatamant.codspec=specializari.codspec
GROUP BY profi.numeprof
HAVING COUNT(plan_invatamant.codspec)>=2
ORDER BY profi.numeprof

--interogarea 6, si specializarile la care predau
SELECT DISTINCT profi.numeprof, specializari.numespec
from profi
	INNER JOIN formatii_curs ON profi.codprof=formatii_curs.codprof
	INNER JOIN plan_invatamant ON formatii_curs.anuniv=plan_invatamant.anuniv
	INNER JOIN specializari ON plan_invatamant.codspec=specializari.codspec
GROUP BY profi.numeprof, specializari.numespec
HAVING COUNT(plan_invatamant.codspec)>=2
ORDER BY profi.numeprof
