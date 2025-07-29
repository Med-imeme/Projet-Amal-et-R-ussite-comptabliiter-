--3)creer une bilan
DROP TABLE IF EXISTS bilan; --une mesure contre l'erreur que le tableaux deja existe

CREATE TABLE bilan AS
SELECT 
  p.sous_classe,
  p.classe,
  SUM(s.debit) AS total_debit,
  SUM(s.credit) AS total_credit
FROM solde_final s
JOIN plan_comptable p ON s.compte_id = p.compte_id
GROUP BY p.sous_classe
ORDER BY p.classe, p.sous_classe;