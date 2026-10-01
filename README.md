# Kèspam
Application de gestion financière personnelle — Next.js + Supabase, prête pour Vercel.

## Fonctionnalités
- Création de compte et connexion par email/mot de passe
- Session persistante et récupération du profil
- Revenus et dépenses
- Tableau de bord avec solde, revenus, dépenses et créances
- Graphique de dépenses sur 6 mois
- Budgets mensuels par catégorie
- Dettes que l'utilisateur doit / qu'on lui doit, échéance et statut
- Conseils personnalisés basés sur les données saisies
- Interface mobile-first orange / vert / blanc
- Sécurité des données par RLS Supabase

## Déploiement
1. Créer un projet Supabase.
2. Ouvrir SQL Editor et exécuter `supabase.sql`.
3. Récupérer l'URL et la clé anon du projet Supabase.
4. Dans Vercel, ajouter:
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
5. Déployer le projet.

## Mot de passe
Kèspam ne stocke pas les mots de passe en clair. Supabase Auth gère l'authentification. Le navigateur/téléphone peut proposer de mémoriser le mot de passe via son gestionnaire de mots de passe.
