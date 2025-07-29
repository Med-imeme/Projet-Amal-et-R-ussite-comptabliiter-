--1)determner le capital sarl
   --a)determiner le compte d'exploitant de societer amal
          /*ALTER TABLE solde_initial ADD COLUMN is_auto_generated BOOLEAN DEFAULT 0;'''
             using this command to defferentiate between data given in exam and is found using querryes*/
		 
	             UPDATE solde_initial
                SET debit = 0,
                credit = 0 
                 WHERE entreprise_id = 1
                  AND is_auto_generated = 1
                  AND compte_id = 108;
				  ---deleting past changes to maintain the same result
SELECT 
  actif_total,
  capitaux_et_passif_total,
  actif_total - capitaux_et_passif_total AS compte_exploitant_manquant
FROM (
  SELECT 
    (SELECT SUM(s.debit)
     FROM solde_initial s
     JOIN plan_comptable p ON s.compte_id = p.compte_id
     WHERE entreprise_id = 1 AND p.classe LIKE 'Actif%') AS actif_total,

    (SELECT SUM(s.credit)
     FROM solde_initial s
     JOIN plan_comptable p ON s.compte_id = p.compte_id
     WHERE entreprise_id = 1 AND( p.classe LIKE 'passif%'or p.classe like 'capîtaux%' )) AS capitaux_et_passif_total
) AS principe_de_deux_partie;
