--5)calculer le resultat
 --b) par l'ecart de compte gestion
 SELECT sum(solde_final_debit) as total_debit,
sum(solde_final_credit) as total_credit,
CASE
WHEN (sum(solde_final_debit) - sum(solde_final_credit) )<0
 THEN abs(sum(solde_final_debit) -sum( solde_final_credit)) 
ELSE 0 
END as resultat_Benidficaire ,
CASE
WHEN (sum(solde_final_debit) - sum(solde_final_credit) )>0
 THEN abs(sum(solde_final_debit) -sum( solde_final_credit)) 
ELSE 0 
END As Resultat_deficitaire
FROM balance_gestion;
