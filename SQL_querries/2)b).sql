--2)
   --b) verifier si le les comptes est equilibrer 
 SELECT
 Total_actif,
 Total_capitaux_propres_et_passif,
 Total_actif - Total_capitaux_propres_et_passif as ecart_bilan
 from(
 SELECT(
    Select sum(f.debit) FROM solde_final f
	JOIN plan_comptable p on f.compte_id=p.compte_id
	WHERE p.classe like 'Actif%')as Total_actif,
    (Select sum(f.credit) FROM solde_final f
	JOIN plan_comptable p on f.compte_id=p.compte_id
	WHERE p.classe='capîtaux propres'or p.classe like 'passif%')as Total_capitaux_propres_et_passif);