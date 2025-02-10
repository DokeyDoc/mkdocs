# Introduction à l'Infrastructure as Code (IaC)

## Définition
L'Infrastructure as Code (IaC) permet de gérer l'infrastructure informatique via des fichiers de configuration. Cela inclut des éléments comme les réseaux, machines virtuelles, équilibreurs de charge, etc. Les principes essentiels de l'IaC sont l'automatisation, le versionnage, la réutilisabilité et la consistance.

### Avantages
- **🚀 Automatisation et rapidité** : Automatise les déploiements d'infrastructure, réduisant le temps nécessaire pour configurer des environnements.
- **✅ Consistance et réduction des erreurs** : Les configurations étant définies dans le code, elles sont répétables et consistantes à chaque déploiement.
- **📜 Versionnage et historique** : Les fichiers IaC peuvent être stockés dans des systèmes de contrôle de version comme Git, permettant de suivre les modifications.
- **🤝 Collaboration et partage** : Facilite la collaboration entre équipes grâce à des configurations documentées et partagées.

### Inconvénients
- **📚 Complexité initiale** : Nécessite une courbe d'apprentissage, surtout pour les équipes non familières avec la gestion de code.
- **⚠️ Gestion des états et dépendances** : Certains outils IaC nécessitent une gestion des états de l'infrastructure, ce qui peut être compliqué.
- **🔐 Risques de sécurité** : Les fichiers de configuration peuvent contenir des informations sensibles nécessitant des pratiques de sécurité rigoureuses.
- **🔗 Dépendance à l'outil** : Dépendance à un outil spécifique peut être un inconvénient si l'outil n'est plus maintenu ou si l'entreprise souhaite changer de solution.

---

## 🔄 Commandes Terraform essentielles

| Commande | Description |
|----------|------------|
| `terraform init` | 🚀 Initialise un répertoire Terraform et télécharge les plugins nécessaires. |
| `terraform plan` | 📝 Prévisualise les modifications qui seront appliquées à l'infrastructure. |
| `terraform apply` | ✅ Applique les changements planifiés. |
| `terraform destroy` | 💥 Supprime toutes les ressources gérées par Terraform. |
| `terraform show` | 🔍 Affiche l’état actuel de l’infrastructure. |
| `terraform state list` | 📋 Liste toutes les ressources gérées par Terraform. |
| `terraform state show <resource>` | 🔎 Affiche les détails d’une ressource spécifique. |
| `terraform workspace new dev` | 🏗️ Crée un nouvel environnement de travail (workspace). |
| `terraform workspace select dev` | 🔄 Change d’environnement de travail. |
| `terraform workspace list` | 📂 Affiche la liste des workspaces disponibles. |

### 📌 Exemples d'utilisation

#### 🏁 Initialiser un projet Terraform
```sh
terraform init
```

#### 🔍 Planifier les modifications avant application
```sh
terraform plan
```

#### ✅ Appliquer les modifications
```sh
terraform apply -auto-approve
```

#### 💣 Détruire toutes les ressources
```sh
terraform destroy -auto-approve
```

---

## Comparaison entre Terraform, Ansible, Chef et Puppet

| Outil       | Type                  | Usage principal                                      | Agent | Langage |
|------------|----------------------|--------------------------------------------------|--------|---------|
| **Terraform** | Infrastructure as Code | Provisionnement et gestion d’infrastructure       | Non    | HCL     |
| **Ansible** | Configuration Management | Configuration et déploiement d’applications      | Non    | YAML    |
| **Chef**   | Configuration Management | Gestion avancée des configurations systèmes     | Oui    | Ruby    |
| **Puppet** | Configuration Management | Automatisation des configurations à grande échelle | Oui    | DSL (basé sur Ruby) |

### 🔑 Différences clés
- **Terraform** est orienté infrastructure et permet la gestion de ressources cloud et on-premise.
- **Ansible** est utilisé principalement pour configurer des serveurs et déployer des applications.
- **Chef** et **Puppet** sont plus adaptés aux grandes infrastructures nécessitant une gestion fine des configurations.
- **Ansible** et **Terraform** ne nécessitent pas d'agent sur les machines, contrairement à **Chef** et **Puppet**.

### 🛠️ Exemples de configurations

#### 🏗️ Exemple de configuration IaC avec Docker
```yaml
services:
  web:
    image: httpd:latest
    ports:
      - "8080:80"
    networks:
      - webnet
  db:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: example
    volumes:
      - db_data:/var/lib/mysql
    networks:
      - webnet
  adminer:
    image: adminer
    ports:
      - "8081:8080"
    networks:
      - webnet
volumes:
  db_data:
networks:
  webnet:
```

#### 🏗️ Exemple de configuration Terraform
```hcl
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
```

#### 🛠️ Exemple de configuration Ansible
```yaml
- name: Configure web servers
  hosts: webservers
  become: yes
  tasks:
    - name: Ensure Apache is installed
      apt:
        name: apache2
        state: present
        update_cache: yes
    - name: Ensure Apache is started and enabled
      service:
        name: apache2
        state: started
        enabled: true
```

#### 🛠️ Exemple de configuration Chef
```ruby
apt_update 'update'
package 'apache2'
service 'apache2' do
  action [:enable, :start]
end
file '/var/www/html/index.html' do
  content '<h1>Welcome to the Web Server</h1>'
  mode '0644'
  owner 'www-data'
  group 'www-data'
end
```

#### 🛠️ Exemple de configuration Puppet
```puppet
class my_datacenter_module::webserver {
  exec { 'apt_update':
    command => '/usr/bin/apt-get update',
    path    => ['/usr/bin', '/usr/sbin'],
  }
  package { 'apache2':
    ensure => installed,
    require => Exec['apt_update'],
  }
  service { 'apache2':
    ensure => running,
    enable => true,
    require => Package['apache2'],
  }
  file { '/var/www/html/index.html':
    ensure  => file,
    content => '<h1>Welcome to the Web Server</h1>',
    mode    => '0644',
    owner   => 'www-data',
    group   => 'www-data',
  }
}
```

## 🔥 Conclusion
Terraform permet d'automatiser le déploiement d'infrastructure en utilisant des fichiers de configuration déclaratifs. Sa flexibilité, sa gestion des états et sa compatibilité multi-cloud en font un outil incontournable pour le DevOps. Il peut être combiné avec d'autres outils comme Ansible pour une gestion complète de l'infrastructure.


