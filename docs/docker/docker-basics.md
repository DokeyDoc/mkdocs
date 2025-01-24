
# Guide des Commandes Docker

## Introduction
Docker est une plateforme permettant de développer, expédier et exécuter des applications dans des conteneurs. Un conteneur est une unité standardisée qui regroupe une application et toutes ses dépendances.

## 1. Installation de Docker
Avant de commencer, vous devez installer Docker sur votre machine. Vous pouvez télécharger Docker Desktop [ici](https://www.docker.com/products/docker-desktop).

## 2. Commandes de Base

2.1 Vérifier l'Installation de Docker
Pour vérifier si Docker est installé correctement, utilisez la commande suivante :
```bash
docker --version
```
**Exemple de sortie :**
```bash
Docker version 20.10.7, build f0df350
```
Cela montre que Docker est installé et la version exacte de Docker.

2.2 Lancer Docker
Pour démarrer Docker (si ce n'est pas déjà fait), utilisez :
```bash
docker run hello-world
```
**Ce qui se passe :**
- Docker télécharge l'image `hello-world` depuis Docker Hub.
- Docker crée un conteneur, l'exécute et affiche un message confirmant que Docker fonctionne correctement.

---

## 3. Commandes Docker pour Manipuler les Conteneurs

3.1 Lancer un Conteneur
Pour exécuter un conteneur à partir d'une image (par exemple, l'image `ubuntu`), utilisez :
```bash
docker run -it ubuntu
```
**Ce qui se passe :**
- Docker télécharge l'image `ubuntu` si elle n'est pas déjà présente sur votre machine.
- Un conteneur `ubuntu` est lancé et vous êtes directement dans le terminal du conteneur (mode interactif avec `-it`).

3.2 Lister les Conteneurs en Cours d'Exécution
Pour voir les conteneurs qui sont actuellement en fonctionnement :
```bash
docker ps
```
**Exemple de sortie :**
```bash
CONTAINER ID   IMAGE     COMMAND   CREATED      STATUS         PORTS     NAMES
d1e4c8c0cd9b   ubuntu    "bash"    3 hours ago  Up 3 hours               hopeful_brown
```
Cela montre que le conteneur avec l'ID `d1e4c8c0cd9b` est en cours d'exécution.

3.3 Lister Tous les Conteneurs (y compris ceux arrêtés)
Pour voir tous les conteneurs, même ceux qui ne sont pas en cours d'exécution :
```bash
docker ps -a
```
**Exemple de sortie :**
```bash
CONTAINER ID   IMAGE     COMMAND   CREATED      STATUS                     NAMES
d1e4c8c0cd9b   ubuntu    "bash"    3 hours ago  Up 3 hours                 hopeful_brown
e04b984b5789   ubuntu    "bash"    5 hours ago  Exited (0) 5 hours ago      relaxed_swartz
```
Cette commande liste tous les conteneurs, qu'ils soient actifs ou arrêtés.

3.4 Arrêter un Conteneur
Pour arrêter un conteneur en cours d'exécution, utilisez :
```bash
docker stop <nom_du_conteneur>
```
Par exemple :
```bash
docker stop hopeful_brown
```
**Ce qui se passe :**
- Le conteneur `hopeful_brown` est arrêté.

3.5 Supprimer un Conteneur
Pour supprimer un conteneur, utilisez :
```bash
docker rm <nom_du_conteneur>
```
Par exemple :
```bash
docker rm hopeful_brown
```
**Ce qui se passe :**
- Le conteneur `hopeful_brown` est supprimé de votre machine.

---

## 4. Commandes Docker pour Manipuler les Images

4.1 Lister les Images Docker
Pour voir toutes les images disponibles sur votre machine :
```bash
docker images
```
**Exemple de sortie :**
```bash
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       latest    4e2eef0168c5   2 weeks ago   72.9MB
nginx        latest    f0dbfc1ad8ab   3 weeks ago   133MB
```
Cette commande montre toutes les images téléchargées sur votre machine.

4.2 Télécharger une Image depuis Docker Hub
Pour télécharger une image depuis Docker Hub, utilisez :
```bash
docker pull nginx
```
**Ce qui se passe :**
- Docker télécharge l'image `nginx` depuis Docker Hub.

4.3 Construire une Image à partir d'un Dockerfile
Si vous avez un fichier `Dockerfile`, vous pouvez créer une image en utilisant la commande suivante :
```bash
docker build -t mon_image .
```
**Ce qui se passe :**
- Docker construit une image en suivant les instructions dans le fichier `Dockerfile` du répertoire actuel.
- L'option `-t` permet de taguer l'image, ici sous le nom `mon_image`.

---

## 5. Travailler avec les Volumes

5.1 Créer un Volume
Un volume Docker permet de persister des données. Pour créer un volume :
```bash
docker volume create mon_volume
```
**Ce qui se passe :**
- Docker crée un volume nommé `mon_volume`.

5.2 Lister les Volumes
Pour voir les volumes existants :
```bash
docker volume ls
```
**Exemple de sortie :**
```bash
DRIVER    VOLUME NAME
local     mon_volume
```
Cela liste les volumes existants.

5.3 Supprimer un Volume
Pour supprimer un volume non utilisé :
```bash
docker volume rm mon_volume
```
**Ce qui se passe :**
- Docker supprime le volume `mon_volume`.

---

## 6. Travailler avec les Réseaux

6.1 Créer un Réseau
Pour créer un réseau Docker :
```bash
docker network create mon_reseau
```
**Ce qui se passe :**
- Docker crée un réseau nommé `mon_reseau`.

6.2 Lister les Réseaux
Pour voir les réseaux disponibles :
```bash
docker network ls
```
**Exemple de sortie :**
```bash
NETWORK ID     NAME            DRIVER    SCOPE
c4b8fa33cb3f   mon_reseau      bridge    local
```
Cela liste les réseaux existants.

6.3 Connecter un Conteneur à un Réseau
Pour connecter un conteneur à un réseau :
```bash
docker network connect mon_reseau mon_conteneur
```
**Ce qui se passe :**
- Le conteneur `mon_conteneur` est maintenant connecté au réseau `mon_reseau`.

6.4 Déconnecter un Conteneur d'un Réseau
Pour déconnecter un conteneur d'un réseau :
```bash
docker network disconnect mon_reseau mon_conteneur
```
**Ce qui se passe :**
- Le conteneur `mon_conteneur` est déconnecté du réseau `mon_reseau`.

---

## 7. Commandes de Gestion des Logs et des Processus

7.1 Voir les Logs d'un Conteneur
Pour afficher les logs d'un conteneur :
```bash
docker logs mon_conteneur
```
**Exemple de sortie :**
```bash
Hello World from the Nginx container!
```
Cela affiche les logs générés par le conteneur `mon_conteneur`.

7.2 Exécuter une Commande dans un Conteneur en Cours d'Exécution
Pour exécuter une commande dans un conteneur en cours d'exécution :
```bash
docker exec -it mon_conteneur bash
```
**Ce qui se passe :**
- Un terminal interactif `bash` s'ouvre dans le conteneur `mon_conteneur`.

---

## 8. Nettoyage des Ressources Docker

8.1 Supprimer Toutes les Images Non Utilisées
Pour supprimer toutes les images non utilisées :
```bash
docker image prune -a
```
**Ce qui se passe :**
- Docker supprime toutes les images non utilisées par un conteneur.

8.2 Supprimer Tous les Conteneurs Arrêtés
Pour supprimer tous les conteneurs arrêtés :
```bash
docker container prune
```
**Ce qui se passe :**
- Docker supprime tous les conteneurs qui ne sont pas en cours d'exécution.

8.3 Supprimer Tous les Volumes Non Utilisés
Pour supprimer tous les volumes non utilisés :
```bash
docker volume prune
```
**Ce qui se passe :**
- Docker supprime tous les volumes non utilisés par un conteneur.

8.4 Supprimer Tous les Réseaux Non Utilisés
Pour supprimer tous les réseaux non utilisés :
```bash
docker network prune
```
**Ce qui se passe :**
- Docker supprime tous les réseaux qui ne sont pas utilisés par des conteneurs.

---

## Conclusion
Vous avez maintenant les bases pour démarrer avec Docker ! N'hésitez pas à expérimenter les commandes ci-dessus pour vous familiariser avec l'environnement Docker. Une fois que vous serez à l'aise avec ces commandes de base, vous pourrez explorer des concepts plus avancés tels que les `Docker Compose`, les `Dockerfiles`, et la gestion de clusters avec `Docker Swarm` ou `Kubernetes`.

---

## Remarque
Les commandes dans ce guide sont destinées à une utilisation sur un terminal Unix/Linux. Si vous utilisez Windows, vous pouvez utiliser Docker via Docker Desktop et un terminal comme PowerShell ou WSL (Windows Subsystem for Linux).
