# Kèspam — Mise à jour mobile

## Corrections incluses

- Ajout du bouton **Dettes** dans la barre de navigation mobile.
- Ajout du bouton **À propos** dans la barre de navigation mobile.
- Conservation des accès **Accueil, Historique, Ajouter, Budget et Conseils** sur mobile.
- Le bouton central **+ Ajouter** est mis en évidence pour faciliter l'ajout d'une opération.
- Correction de l'alignement de la ligne/du rectangle des dépenses dans la section **Budget** sur mobile.
- Ajout d'une vraie page **À propos de Kèspam**, accessible depuis la barre mobile et depuis le profil.
- Dans le profil, séparation visuelle claire entre **À propos de Kèspam** et **Réinitialiser mes données** afin d'éviter qu'ils soient confondus sur petit écran.
- La réinitialisation demande une confirmation avant de supprimer les revenus, dépenses, dettes et budgets du compte.

## Navigation mobile

Accueil | Historique | + Ajouter | Budget | Dettes | Conseils | À propos

## Déploiement

Le projet reste un projet Next.js. Pour Vercel, il faut déployer le dossier du projet contenant `package.json`, `app/` et `lib/`.
