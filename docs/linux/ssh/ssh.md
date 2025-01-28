# Authentification par Clé SSH

L'authentification par clé SSH permet de sécuriser l'accès à un serveur via le protocole SSH de manière beaucoup plus fiable qu'avec un simple mot de passe.

## Génération d'une Clé SSH

Sur votre machine principale, vous pouvez générer une clé SSH avec la commande suivante :

```bash
ssh-keygen -t ed25519 -C "adresse@email.com"
```

### Ou, pour une clé RSA plus longue :

```bash
ssh-keygen -t rsa -b 4096 -C "adresse@email.com"
```

## Copie de la Clé vers le Serveur Distant

Pour autoriser l'accès à un serveur distant avec votre clé publique, il faut l'ajouter au fichier `~/.ssh/authorized_keys` sur ce serveur.

### Utilisation de `ssh-copy-id` :

```bash
ssh-copy-id username@remote_host
```

### Si `ssh-copy-id` n'est pas disponible, copie manuelle :

#### Pour une clé ED25519 :

```bash
cat ~/.ssh/id_ed25519.pub | ssh username@remote_host "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

#### Pour une clé RSA :

```bash
cat ~/.ssh/id_rsa.pub | ssh username@remote_host "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

## Connexion au Serveur avec la Clé SSH

Une fois la clé copiée, vous pouvez vous connecter au serveur sans mot de passe :

```bash
ssh username@remote_host
```

## Désactivation de l'Authentification par Mot de Passe

Pour renforcer la sécurité, il est recommandé de désactiver l'authentification par mot de passe une fois l'authentification par clé SSH configurée.

1. Modifiez le fichier de configuration SSH :

   ```bash
   sudo nano /etc/ssh/sshd_config
   ```

2. Recherchez et modifiez les paramètres suivants :

   ```plaintext
   # Empêcher le login root via SSH (bonne pratique)
   PermitRootLogin no

   # Activer l'authentification par clé publique (normalement activé par défaut)
   PubkeyAuthentication yes

   # Désactiver l'authentification par mot de passe
   PasswordAuthentication no
   ```

3. Redémarrez le service SSH pour appliquer les modifications :

   ```bash
   sudo systemctl restart ssh
   ```

> **💡 Conseil :** Une fois la connexion par clé SSH vérifiée, n'oubliez pas de sauvegarder votre clé privée dans un emplacement sécurisé et d'effectuer des tests avant de fermer l'accès par mot de passe.
