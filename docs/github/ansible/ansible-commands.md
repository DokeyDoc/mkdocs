# Commandes de base Ansible

Ansible est un outil d'automatisation permettant de gérer la configuration, le déploiement d'applications et d'autres tâches IT. 

## Installation d'Ansible

### Installer Ansible sur Debian/Ubuntu
Pour installer Ansible sur une distribution basée sur Debian ou Ubuntu, utilisez les commandes suivantes :
```bash
sudo apt update
sudo apt install ansible -y
```

### Installer Ansible sur CentOS/RHEL
Pour installer Ansible sur CentOS ou RHEL, suivez ces étapes :
```bash
sudo yum install epel-release -y
sudo yum install ansible -y
```

### Vérifier l'installation
Une fois installé, vérifiez que tout fonctionne correctement :
```bash
ansible --version
```

## Préparation de l'environnement

### Vérifier la version d'Ansible
Affiche la version installée d'Ansible pour confirmer qu'il est correctement configuré.
```bash
ansible --version
```

### Tester la connectivité avec les hôtes distants
Vérifie si Ansible peut se connecter à un hôte distant via SSH.
```bash
ansible all -m ping
```

- `all` : cible tous les hôtes définis dans l'inventaire.
- `-m ping` : utilise le module "ping" pour tester la connectivité.

### Définir un inventaire
Créez un fichier d'inventaire (également appelé "hosts") pour indiquer les machines cibles. Exemple d'un fichier d'inventaire :
```
[webservers]
192.168.1.10
192.168.1.11

[dbservers]
192.168.1.20
```

## Gestion des modules

### Lister tous les modules disponibles
Affiche une liste des modules utilisables dans Ansible.
```bash
ansible-doc -l
```

### Obtenir des informations sur un module
Affiche la documentation détaillée pour un module spécifique.
```bash
ansible-doc copy
```

### Exécuter une commande avec un module
Exécute une commande ad hoc sur un ou plusieurs hôtes cibles.
```bash
ansible all -m shell -a "uname -r"
```

- `-m shell` : utilise le module "shell".
- `-a "uname -r"` : passe la commande "uname -r" en argument au module.

## Gestion des fichiers

### Copier un fichier vers une machine distante
Transfère un fichier local vers les hôtes distants.
```bash
ansible all -m copy -a "src=/local/path/file dest=/remote/path/file"
```

- `src` : chemin du fichier local.
- `dest` : chemin où le fichier sera copié sur la machine distante.

### Supprimer un fichier sur une machine distante
Supprime un fichier ou un répertoire sur l'hôte distant.
```bash
ansible all -m file -a "path=/remote/path/file state=absent"
```

- `path` : chemin du fichier ou répertoire.
- `state=absent` : indique que l'élément doit être supprimé.

## Gestion des paquets

### Installer un paquet
Installe un paquet via le gestionnaire de paquets de l'hôte distant.
```bash
ansible all -m apt -a "name=nginx state=present" -b
```

- `-m apt` : utilise le module "apt" (gestionnaire de paquets pour Debian/Ubuntu).
- `name=nginx` : nom du paquet à installer.
- `state=present` : s'assure que le paquet est installé.
- `-b` : exécute la commande avec des privilèges sudo.

### Supprimer un paquet
Désinstalle un paquet de la machine distante.
```bash
ansible all -m apt -a "name=nginx state=absent" -b
```

- `state=absent` : supprime le paquet.

## Gestion des Playbooks

### Lancer un Playbook
Exécute un fichier Playbook YAML qui définit une série d'actions automatisées.
```bash
ansible-playbook site.yml
```

- `site.yml` : fichier YAML contenant les instructions.

### Effectuer un test sans appliquer les modifications
Affiche les modifications qui seraient apportées sans les exécuter.
```bash
ansible-playbook site.yml --check
```

### Spécifier un hôte cible dans le Playbook
Exécute un Playbook uniquement sur un groupe ou un hôte spécifique.
```bash
ansible-playbook site.yml --limit webservers
```

- `--limit webservers` : restreint l'exécution aux hôtes du groupe "webservers".

### Redémarrer un Playbook à une étape précise
Reprend l'exécution d'un Playbook à partir d'une étape donnée.
```bash
ansible-playbook site.yml --start-at-task="Installer Nginx"
```

## Commandes diverses

### Vérifier la syntaxe d'un Playbook
Valide la syntaxe d'un fichier YAML sans l'exécuter.
```bash
ansible-playbook site.yml --syntax-check
```

### Lister les hôtes affectés par un Playbook
Affiche les hôtes cibles sans appliquer les modifications.
```bash
ansible-playbook site.yml --list-hosts
```

### Forcer la mise à jour du cache
S'assure que le cache des gestionnaires de paquets est à jour avant d'installer ou de supprimer des paquets.
```bash
ansible all -m apt -a "update_cache=yes" -b
```