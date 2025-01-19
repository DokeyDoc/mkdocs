# Qu'est-ce que Docker Compose ?

Docker Compose est un outil pour définir et exécuter des applications Docker multi-conteneurs. Avec Compose, vous pouvez utiliser un fichier YAML pour définir les services, réseaux et volumes de votre application, puis utiliser une seule commande (`docker-compose up`) pour tout démarrer.

## Commandes Docker Compose de base

### 1. `docker-compose up`

La commande `docker-compose up` permet de démarrer votre application telle que définie dans le fichier `docker-compose.yml`. Elle crée et démarre tous les conteneurs, réseaux et volumes spécifiés dans le fichier.

**Syntaxe :**
```bash
docker-compose up
```

**Exemple :**
```bash
docker-compose up
```
Cela va construire les images (si nécessaire) et démarrer les conteneurs.

**Avec le flag `-d` (mode détaché) :**
```bash
docker-compose up -d
```
Cela démarre les conteneurs en arrière-plan (mode détaché), vous permettant de continuer à utiliser votre terminal.

### 2. `docker-compose down`

La commande `docker-compose down` arrête et supprime les conteneurs, réseaux et volumes créés par `docker-compose up`.

**Syntaxe :**
```bash
docker-compose down
```

**Exemple :**
```bash
docker-compose down
```
Cela arrête et supprime tous les conteneurs définis dans votre fichier `docker-compose.yml`. Cela supprimera également les réseaux et volumes associés, sauf si cela est spécifié autrement.

### 3. `docker-compose build`

La commande `docker-compose build` est utilisée pour construire ou reconstruire les services définis dans le fichier `docker-compose.yml`.

**Syntaxe :**
```bash
docker-compose build
```

**Exemple :**
```bash
docker-compose build
```
Cette commande est utile lorsque vous apportez des modifications au Dockerfile ou aux dépendances, et que vous devez reconstruire les images.

### 4. `docker-compose logs`

La commande `docker-compose logs` permet de visualiser les logs des conteneurs de votre application Compose. Vous pouvez aussi l'utiliser pour vérifier la sortie des services individuels.

**Syntaxe :**
```bash
docker-compose logs
```

**Exemple :**
```bash
docker-compose logs
```
Cela affiche les logs de tous les services définis dans votre fichier `docker-compose.yml`.

**Pour les logs d'un service spécifique :**
```bash
docker-compose logs <nom-du-service>
```
Par exemple :
```bash
docker-compose logs web
```

### 5. `docker-compose exec`

La commande `docker-compose exec` permet d'exécuter des commandes à l'intérieur d'un conteneur en cours d'exécution.

**Syntaxe :**
```bash
docker-compose exec <nom-du-service> <commande>
```

**Exemple :**
```bash
docker-compose exec web bash
```
Cette commande ouvrira un shell Bash à l'intérieur du conteneur du service `web`.

### 6. `docker-compose ps`

La commande `docker-compose ps` affiche l'état de tous les conteneurs de l'application Compose.

**Syntaxe :**
```bash
docker-compose ps
```

**Exemple :**
```bash
docker-compose ps
```
Cela affichera une liste de tous les conteneurs, leur état, et d'autres détails associés.

### 7. `docker-compose restart`

La commande `docker-compose restart` permet de redémarrer les services de votre application Compose.

**Syntaxe :**
```bash
docker-compose restart
```

**Exemple :**
```bash
docker-compose restart
```
Cela redémarre tous les services. Vous pouvez aussi redémarrer un service spécifique en fournissant son nom :
```bash
docker-compose restart web
```

### 8. `docker-compose stop`

La commande `docker-compose stop` arrête les conteneurs en cours d'exécution sans les supprimer. Cela vous permet de redémarrer les conteneurs plus tard en utilisant `docker-compose start`.

**Syntaxe :**
```bash
docker-compose stop
```

**Exemple :**
```bash
docker-compose stop
```

### 9. `docker-compose start`

La commande `docker-compose start` démarre les conteneurs qui ont été arrêtés précédemment avec `docker-compose stop`.

**Syntaxe :**
```bash
docker-compose start
```

**Exemple :**
```bash
docker-compose start
```

### 10. `docker-compose up --build`

Cette commande construit les images avant de démarrer les conteneurs, garantissant que les modifications apportées au Dockerfile ou aux dépendances de l'application sont appliquées.

**Syntaxe :**
```bash
docker-compose up --build
```

**Exemple :**
```bash
docker-compose up --build
```
Cela construira d'abord les services, puis démarrera les conteneurs.

## Conclusion

Docker Compose simplifie la gestion des applications multi-conteneurs, surtout lorsqu'il s'agit de microservices ou d'applications nécessitant plusieurs services fonctionnant ensemble. Comprendre ces commandes de base vous aidera à démarrer avec Docker Compose et facilitera la gestion de vos conteneurs.
