--Care sunt cea mai veche specializare din FEAA?
SELECT DISTINCT numespec,anuniv  
FROM specializari s INNER JOIN plan_invatamant pi ON s.codspec=pi.codspec
WHERE anuniv='2017-2018'
ORDER BY anuniv,numespec


