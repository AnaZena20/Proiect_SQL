
select numespec,count(matricol)
from traseu_stud INNER JOIN specializari
ON traseu_stud.codspec=specializari.codspec
group by numespec
order by count(matricol)desc
limit 3;










