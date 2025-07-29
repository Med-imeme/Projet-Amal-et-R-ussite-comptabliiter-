--4)creer la balance de la société
 --a)pour les compte de bilan
DROP TABLE if EXISTS balance_bilan;--une mesure contre l'erreur que le tableaux deja existe


CREATE TABLE balance_bilan AS

SELECT
  p.compte_id AS numero_de_compte,
  p.compte_nom AS nom_de_compte,
-- Soldes initiaux : 
  COALESCE(SUM(sf.debit), 0) AS solde_initial_debit,
  COALESCE(SUM(sf.credit), 0) AS solde_initial_credit,
-- Mouvements : somme des debits et credits des écritures liées aux opérations par compte
  COALESCE(SUM(mvt.debit_mouvement), 0) AS mouvement_debit,
  COALESCE(SUM(mvt.credit_mouvement), 0) AS mouvement_credit,
-- Soldes finaux = solde_initial + mouvements 
  COALESCE(SUM(sf.debit), 0) + COALESCE(SUM(mvt.debit_mouvement), 0) AS solde_final_debit,
  COALESCE(SUM(sf.credit), 0) + COALESCE(SUM(mvt.credit_mouvement), 0) AS solde_final_credit

FROM plan_comptable p
LEFT JOIN solde_final sf ON sf.compte_id = p.compte_id
LEFT JOIN (
  SELECT 
    compte_id,
    SUM(debit) AS debit_mouvement,
    SUM(credit) AS credit_mouvement
  FROM ecriture_comptable
  GROUP BY compte_id
) AS mvt ON mvt.compte_id = p.compte_id

WHERE CAST(SUBSTR(p.compte_id, 1, 1) AS INTEGER) BETWEEN 1 AND 5
GROUP BY p.compte_id
ORDER BY p.compte_id;--i got un nexpected result here (did not get ordered)
