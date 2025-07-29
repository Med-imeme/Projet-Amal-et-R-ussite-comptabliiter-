--2)creation d'une noveaux tableaux pour les solde des comptes de noveaux entreprise sarl
  --a)fusion des compte
DROP TABLE IF EXISTS solde_final; --une mesure contre l'erreur que le tableaux deja existe
CREATE TABLE solde_final AS
SELECT 
  s.compte_id,
  CASE 
    WHEN p.notes = 'actif fictif' THEN 0 --annuler les actif fictif
    WHEN SUM(s.debit) - SUM(s.credit) > 0 THEN SUM(s.debit) - SUM(s.credit) --calcule le solde (débit - crédit) uniquement s’il est positif
    ELSE 0
  END AS debit,
  CASE 
    WHEN p.classe ='capîtaux propres' THEN 0 --annuler les capitaux propres pour l ajouter dans une autre requet
    WHEN SUM(s.debit) - SUM(s.credit) < 0 THEN ABS(SUM(s.debit) - SUM(s.credit))--calcule le solde (débit - crédit) uniquement s’il est negatif
    ELSE 0
  END AS credit,
  p.notes
  ,s.is_auto_generated
FROM solde_initial s
JOIN plan_comptable p ON s.compte_id = p.compte_id
GROUP BY s.compte_id;
--insertion de la capital de l'entreprise
INSERT INTO solde_final (compte_id,debit,credit,is_auto_generated)
VALUES(101,0,132100,1)