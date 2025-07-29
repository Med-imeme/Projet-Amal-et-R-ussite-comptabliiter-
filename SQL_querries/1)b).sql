   --b) calculer le SNC de societer amal
     --en ajoute les donner retrouver en 1)a)
         UPDATE solde_initial
         SET debit = 0,
           credit = 60600 
           WHERE entreprise_id = 1
           AND is_auto_generated = 1
           AND compte_id = 108;
  --Formule SNC=total capital propres -actifs fictif
SELECT
  total_capitaux_propres,
  total_actif_fictif,
  total_capitaux_propres - total_actif_fictif as SNC_amel
  from(
  SELECT(
   Select Sum(s.debit)
   from solde_initial s
   JOIN plan_comptable p On s.compte_id=p.compte_id
   where entreprise_id =1 and p.notes='actif fictif'
   )As total_actif_fictif
   ,(SELECT sum(s.credit)
   from solde_initial s
   JOIN plan_comptable p on s.compte_id=p.compte_id
   WHERE entreprise_id =1 and p.classe = 'capîtaux propres'
   )as total_capitaux_propres
   )AS SNC