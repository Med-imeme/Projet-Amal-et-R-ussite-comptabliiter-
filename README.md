# Projet Amal et Réussite comptabliiter
This project is based on an accounting exam from IHEC Sousse (2021 – Session Principale). It simulates the merger of two companies ("Amal" and "Réussite") first handled in Excel, then migrated into SQL for automated financial reporting and analysis.
NB: The SQLite .db file cannot be previewed directly on GitHub. You must download it and open it using a SQL GUI editor like DB Browser for SQLite or DBeaver.

## Objectifs du projet :

-✅ Regrouper les données comptables des deux sociétés
-✅ Automatiser le traitement des soldes initiaux, mouvements et soldes finaux
-✅ Générer une balance comptable dynamique
-✅ Calculer le résultat net, retraiter les actifs fictifs, et déterminer le montant de l’impôt dû
-✅ Respecter les règles du plan comptable tunisien (PCN) : classes 1 à 7, traitement des capitaux propres, résultat d’exploitation, etc.

##Outils utilisés :
SQLite (via DB Browser)
SQL avancé (CTE, agrégations, nettoyage de données)
Structuration des tables : plan_comptable, solde_initial, ecriture_comptable, balance_bilan, solde_final ,utilisateur,operations,entreprises,bilan.

✅ Le tout conforme à la logique comptable tunisienne (PCN) : classes 1 à 7, traitement des capitaux propres, séparation bilan/gestion.

## Question utiliser:
1)determner le capital sarl .
  a)determiner le compte d'exploitant de societer amal
  b)calculer le SNC
  c)calculer apport de reussite 
donc alors d'aprés b)et c) le capital social=72000+60100=132100
2)creation d'une noveaux tableaux pour les solde des comptes de noveaux entreprise sarl
  a)fusion des compte 
  b)verifier la principe de double partie 
3)creer une bilan
4)creer la balance de la société
 a)pour les compte de bilan (compte 1 jusqu'a 5)
 b)pour les compte de gestion (compte 1 jusqu'a 5)
5) calculer le resultat
 a) par la methode de patrimoine
 b) par l'ecart de compte gestion
