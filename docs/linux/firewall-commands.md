
# Guide d'utilisation de `iptables` 

## Installation d'`iptables`

### Sous Debian/Ubuntu

```bash
sudo apt update
sudo apt install iptables
```

### Sous CentOS

```bash
sudo yum install iptables-services
```

---

## Concepts de base

`iptables` est un outil de filtrage de paquets qui permet de définir des règles pour gérer le trafic réseau entrant et sortant. Les règles peuvent être appliquées à différentes chaînes : 

- **INPUT** : Trafic entrant vers la machine.
- **OUTPUT** : Trafic sortant de la machine.
- **FORWARD** : Trafic qui traverse la machine vers un autre réseau.

---

## Commandes principales

### 1. Afficher les règles actuelles

```bash
sudo iptables -L
```

Cela affiche toutes les règles en cours.

### 2. Ajouter une règle

#### Exemple : Bloquer l'accès SSH (port 22)

```bash
sudo iptables -A INPUT -p tcp --dport 22 -j DROP
```

**Explication :**
- `-A INPUT` : Ajouter la règle dans la chaîne INPUT (trafic entrant).
- `-p tcp` : Utiliser le protocole TCP.
- `--dport 22` : Cibler le port 22 (SSH).
- `-j DROP` : Rejeter les paquets correspondants.

### 3. Accepter le trafic

#### Exemple : Autoriser l'accès SSH (port 22)

```bash
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
```

Cela permet le trafic entrant sur le port 22 (SSH).

### 4. Supprimer une règle

#### Exemple : Supprimer une règle bloquant le port 22

```bash
sudo iptables -D INPUT -p tcp --dport 22 -j DROP
```

Cela supprime la règle qui bloque le port 22.

### 5. Bloquer tout le trafic entrant sauf sur le port 80 et 443

```bash
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables -A INPUT -j DROP
```

Cela autorise uniquement les connexions HTTP (port 80) et HTTPS (port 443), et bloque tout le reste.

---

## Sauvegarder et restaurer les règles

### 1. Sauvegarder les règles

#### Sous Debian/Ubuntu

```bash
sudo iptables-save > /etc/iptables/rules.v4
```

#### Sous CentOS

```bash
sudo service iptables save
```

### 2. Restaurer les règles

#### Sous Debian/Ubuntu

```bash
sudo iptables-restore < /etc/iptables/rules.v4
```

#### Sous CentOS

```bash
sudo service iptables restart
```

---

## Solution pour persister les règles après un reboot

### Avec `iptables-persistent` (solution recommandée)

1. Installez le paquet `iptables-persistent` :

```bash
sudo apt install iptables-persistent
```

2. Lors de l'installation, il vous sera demandé si vous voulez sauvegarder vos règles. Acceptez cette option.
3. Les règles seront sauvegardées dans les fichiers `/etc/iptables/rules.v4` et `/etc/iptables/rules.v6`.

Si vous ajoutez de nouvelles règles, vous pouvez les sauvegarder à l'aide de la commande suivante :

```bash
sudo netfilter-persistent save
```

### Sans `iptables-persistent` (solution manuelle)

1. Sauvegardez vos règles actuelles dans un fichier spécifique :

```bash
sudo iptables-save > /etc/iptables/rules.v4
```

2. Créez un script de démarrage qui va restaurer ces règles à chaque reboot. Pour ce faire, créez un fichier dans le répertoire `/etc/network/if-up.d/` :

```bash
sudo nano /etc/network/if-up.d/iptables-restore
```

Ajoutez-y le contenu suivant :

```bash
#!/bin/sh
iptables-restore < /etc/iptables/rules.v4
```

3. Rendez le script exécutable :

```bash
sudo chmod +x /etc/network/if-up.d/iptables-restore
```

### Explication de la solution manuelle

- **Sauvegarde** : Vous sauvegardez les règles actuelles dans un fichier, ici `/etc/iptables/rules.v4`.
- **Script de démarrage** : Le script `/etc/network/if-up.d/iptables-restore` sera exécuté à chaque démarrage, et il restaurera les règles stockées dans le fichier spécifié.
- **Rendre exécutable** : Vous devez rendre le script exécutable pour qu'il soit correctement pris en charge par le système.

---

## Exemple complet

### Configuration d'un pare-feu de base

```bash
# Supprimer toutes les règles existantes
sudo iptables -F

# Accepter les connexions sur le port 22 (SSH)
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Accepter les connexions sur le port 80 (HTTP)
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# Accepter les connexions sur le port 443 (HTTPS)
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Bloquer toutes les autres connexions
sudo iptables -A INPUT -j DROP
```

---

## Conclusion

`iptables` est un outil puissant pour gérer la sécurité réseau de votre machine. En utilisant des règles simples, vous pouvez contrôler le trafic entrant et sortant selon vos besoins. N'oubliez pas de sauvegarder vos règles pour éviter de les perdre après un redémarrage.
