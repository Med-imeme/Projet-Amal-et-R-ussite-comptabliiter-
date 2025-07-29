--5)calculer le resultat
 --a) par la methode de patrimoine
SELECT sum(solde_final_debit) as total_debit,
sum(solde_final_credit) as total_credit,
CASE
WHEN (sum(solde_final_debit) - sum(solde_final_credit) )<0
 THEN abs(sum(solde_final_debit) -sum( solde_final_credit)) 
ELSE 0 
END as Resultat_deficitaire,
CASE
WHEN (sum(solde_final_debit) - sum(solde_final_credit) )>0
 THEN abs(sum(solde_final_debit) -sum( solde_final_credit)) 
ELSE 0 
END As esultat_Benidficaire
FROM balance_bilan;