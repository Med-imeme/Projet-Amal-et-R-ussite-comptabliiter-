  --b)calculer apport de reussite (snc)
SELECT
  total_actif,
  total_passif,
  total_actif - total_passif as SNC_reussite
  from(
  SELECT(
   Select Sum(s.debit)
   from solde_initial s
   JOIN plan_comptable p On s.compte_id=p.compte_id
   where entreprise_id =2 and p.classe like 'Actif%'
   )As total_actif
   ,(SELECT sum(s.credit)
   from solde_initial s
   JOIN plan_comptable p on s.compte_id=p.compte_id
   WHERE entreprise_id =2 and p.classe like 'passif%'
   )as total_passif
   )AS SNC_reussite
   