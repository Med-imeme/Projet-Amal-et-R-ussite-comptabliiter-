--4)
 --b)pour les compte de gestion
DROP TABLE if EXISTS balance_gestion;--une mesure contre l'erreur que le tableaux deja existe

CREATE TABLE balance_gestion AS
SELECT
  p.compte_id AS numero_de_compte,
  p.compte_nom AS nom_de_compte,

  COALESCE(SUM(sf.debit), 0) AS solde_initial_debit,
  COALESCE(SUM(sf.credit), 0) AS solde_initial_credit,

  COALESCE(SUM(ec.debit), 0) AS mouvement_debit,
  COALESCE(SUM(ec.credit), 0) AS mouvement_credit,

  COALESCE(SUM(sf.debit), 0) + COALESCE(SUM(ec.debit), 0) AS solde_final_debit,
  COALESCE(SUM(sf.credit), 0) + COALESCE(SUM(ec.credit), 0) AS solde_final_credit

FROM plan_comptable p

LEFT JOIN solde_final sf ON sf.compte_id = p.compte_id
LEFT JOIN ecriture_comptable ec ON ec.compte_id = p.compte_id

WHERE CAST(SUBSTR(p.compte_id, 1, 1) AS INTEGER) IN (6,7)

GROUP BY p.compte_id
ORDER By p.compte_id ASC;