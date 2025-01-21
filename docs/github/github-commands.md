# Commandes de base GitHub

GitHub repose sur Git, un système de gestion de version décentralisé.

## Configuration de Git

### Configurer le nom d'utilisateur global
Cette commande définit le nom d'utilisateur qui apparaîtra dans les commits.
```bash
git config --global user.name "JohnDoe"
```

### Configurer l'adresse e-mail globale
L'adresse e-mail associée à vos commits est définie avec cette commande.
```bash
git config --global user.email "johndoe@example.com"
```

### Vérifier la configuration actuelle
Utilisez cette commande pour afficher tous les paramètres de configuration actuels.
```bash
git config --list
```

## Initialisation et configuration d'un dépôt

### Initialiser un nouveau dépôt Git
Cela crée un dépôt Git vide dans le répertoire actuel.
```bash
git init
```

### Cloner un dépôt existant
Télécharge un dépôt distant et crée une copie locale.
```bash
git clone https://github.com/username/repo.git
```

## Gestion des fichiers

### Ajouter un fichier au suivi
Cette commande ajoute un fichier spécifique à l'index (staging area).
```bash
git add fichier.txt
```

### Ajouter tous les fichiers modifiés
Ajoute tous les fichiers modifiés et nouveaux au suivi.
```bash
git add .
```

### Vérifier l'état du dépôt
Affiche les fichiers modifiés, ajoutés ou supprimés dans le dépôt.
```bash
git status
```

### Supprimer un fichier suivi par Git
Cette commande supprime un fichier du suivi et du système de fichiers.
```bash
git rm fichier.txt
```

### Renommer un fichier suivi
Renomme un fichier tout en conservant son historique Git.
```bash
git mv ancien_nom.txt nouveau_nom.txt
```

## Commit des modifications

### Enregistrer les modifications avec un message
Crée un snapshot de l'état actuel du projet avec un message descriptif.
```bash
git commit -m "Ajout de la fonctionnalité X"
```

### Modifier le dernier commit
Permet de corriger le message ou d'ajouter des modifications oubliées.
```bash
git commit --amend -m "Message corrigé"
```

## Historique des commits

### Afficher l'historique des commits
Affiche tous les commits dans l'ordre chronologique inverse.
```bash
git log
```

### Afficher l'historique avec les modifications
Affiche les commits et les changements effectués.
```bash
git log -p
```

### Afficher une seule ligne par commit
Permet d'obtenir une vue compacte des commits.
```bash
git log --oneline
```

## Gestion des branches

### Lister les branches existantes
Affiche toutes les branches locales.
```bash
git branch
```

### Créer une nouvelle branche
Ajoute une branche sans changer de branche active.
```bash
git branch feature-branch
```

### Changer de branche avec `checkout`
Permet de passer à une autre branche existante.
```bash
git checkout feature-branch
```

### Créer et passer à une nouvelle branche avec `checkout`
Combine la création d'une branche et le changement vers celle-ci.
```bash
git checkout -b hotfix-branch
```

### Créer et changer de branche avec `switch`
Cette commande remplace `checkout` pour créer et basculer entre les branches de manière plus intuitive.
- Créer et passer à une nouvelle branche :
```bash
git switch -c nouvelle-branche
```

- Passer à une branche existante :
```bash
git switch feature-branch
```

### Fusionner une branche dans la branche active
Intègre les modifications d'une branche dans celle actuellement utilisée.
```bash
git merge feature-branch
```

### Supprimer une branche
Supprime une branche locale qui n'est plus nécessaire.
```bash
git branch -d feature-branch
```

## Synchronisation avec un dépôt distant

### Ajouter un dépôt distant
Lie un dépôt local à un dépôt distant nommé "origin".
```bash
git remote add origin https://github.com/username/repo.git
```

### Vérifier les dépôts distants
Affiche les URL des dépôts distants configurés.
```bash
git remote -v
```

### Pousser les modifications vers le dépôt distant
Envoie les commits locaux vers la branche spécifiée sur le dépôt distant.
```bash
git push origin main
```

### Récupérer les modifications depuis le dépôt distant
Met à jour la branche locale avec les modifications du dépôt distant.
```bash
git pull origin main
```

### Synchroniser les tags
Pousse les tags locaux vers le dépôt distant.
```bash
git push --tags
```

## Gestion des tags

### Créer un tag
Ajoute un tag léger ou annoté au dépôt.
```bash
git tag v1.0.0
```

### Lister les tags existants
Affiche tous les tags disponibles.
```bash
git tag
```

### Supprimer un tag local
Efface un tag uniquement de votre dépôt local.
```bash
git tag -d v1.0.0
```

### Partager un tag avec le dépôt distant
Pousse un tag spécifique vers le dépôt distant.
```bash
git push origin v1.0.0
```

## Résolution des conflits

### Voir les fichiers en conflit après un merge
Affiche les fichiers ayant des conflits non résolus.
```bash
git status
```

### Ajouter les fichiers résolus
Après résolution manuelle des conflits, ajoutez les fichiers corrigés.
```bash
git add fichier.txt
```

### Finaliser le merge
Crée un commit pour terminer le processus de fusion.
```bash
git commit -m "Résolution des conflits dans fichier.txt"
```

## Commandes diverses

### Réinitialiser un fichier modifié localement
Annule les modifications locales pour un fichier spécifique.
```bash
git checkout -- fichier.txt
```

### Réinitialiser tout le répertoire à l'état du dernier commit
Annule toutes les modifications locales non validées.
```bash
git reset --hard
```

### Supprimer des fichiers non suivis
Efface les fichiers non suivis ou ignorés du répertoire de travail.
```bash
git clean -f
```

