# Configuration de Fail2ban

Fail2ban permet de protéger un serveur contre les attaques par force brute en bannissant temporairement les adresses IP suspectes.

## Installation de Fail2ban

Installez Fail2ban :

```bash
sudo apt install fail2ban 
```

## Configuration de Base

Créez un fichier de configuration personnalisé : `/etc/fail2ban/jail.d/custom.conf` avec le contenu suivant :

```ini
[DEFAULT]
ignoreip = 127.0.0.1 X.X.X.X
findtime = 10m
bantime = 24h
maxretry = 3

[sshd]
enabled = true
logpath = /var/log/fail2ban_auth.log
backend = systemd
```

- **ignoreip** : Liste des adresses IP à ne pas bannir (ex. votre adresse IP fixe).
- **findtime** : Durée pendant laquelle les tentatives de connexion sont analysées (ici 10 minutes).
- **bantime** : Durée de bannissement d'une adresse IP (ici 24 heures).
- **maxretry** : Nombre de tentatives échouées avant de bannir une IP (ici 3 tentatives).

Si vous avez une adresse IP fixe, remplacez `X.X.X.X` par cette adresse. Sinon, laissez uniquement `127.0.0.1`.

## Activation et Démarrage du Service

Démarrez et activez Fail2ban :

```bash
sudo systemctl start fail2ban
sudo systemctl enable fail2ban
```

## Vérification du Statut de Fail2ban

- Pour consulter le statut de Fail2ban :

  ```bash
  sudo fail2ban-client status
  ```

- Pour voir les IP bannies :

  ```bash
  sudo fail2ban-client banned
  ```

- Pour débannir une adresse IP :

  ```bash
  sudo fail2ban-client set sshd unbanip X.X.X.X
  ```

- Pour afficher les logs en direct :

  ```bash
  sudo tail -f /var/log/fail2ban.log
  ```

## Configuration des Notifications par Email

### Installation des Outils SMTP

1. Installez un serveur SMTP avec Mailhog :

#### Avec Docker Compose :

```yaml
services:
  mailhog:
    image: mailhog/mailhog:latest
    ports:
      - 1025:1025
      - 8025:8025
```

#### Avec Docker directement :

```bash
docker run -p 1025:1025 -p 8025:8025 mailhog/mailhog:latest
```

2. Installez `msmtp` et configurez-le :

```bash
sudo apt install msmtp msmtp-mta
```

Créez le fichier `/etc/msmtprc` avec le contenu suivant :

```plaintext
# Valeurs par défaut pour tous les comptes.
defaults
auth           on
tls            on
tls_starttls   on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
logfile        /var/log/msmtp

# Exemple pour un serveur de test MailHog
account        mailhog
auth           off
tls            off
tls_starttls   off
host           X.X.X.X
port           1025
from           mon-serveur@home.lab

# Définir le compte par défaut
account default : mailhog
```

Remplacez `X.X.X.X` par l'adresse IP de la machine où Mailhog tourne (`127.0.0.1` si c'est sur la même machine).

3. Configurez les permissions et testez `msmtp` :

```bash
sudo touch /var/log/msmtp
sudo chmod 777 /var/log/msmtp

echo -e "Subject: Un mail de test\r\n\r\nEnvoyé via msmtp" | msmtp -t moi@example.com
```

### Mise à Jour de la Configuration de Fail2ban

Modifiez le fichier `/etc/fail2ban/jail.d/custom.conf` :

```ini
[DEFAULT]
ignoreip = 127.0.0.1
findtime = 10m
bantime = 24h
maxretry = 3
destemail = admin@home.lab
action = %(action_mwl)s

[sshd]
enabled = true
logpath = /var/log/fail2ban_auth.log
backend = systemd
```

Redémarrez Fail2ban :

```bash
sudo systemctl restart fail2ban
```

Vous devriez recevoir un mail indiquant que Fail2ban a démarré.

## Testez la Configuration

Essayez de générer des tentatives de connexion échouées pour vérifier que les IP sont bannies et que des notifications par email sont envoyées.
