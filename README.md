# Hawser Agent – Home Assistant OS

## 📌 Objectif

Ce dépôt fournit un **add-on Home Assistant OS** permettant d’exécuter **Hawser** comme agent Docker afin de connecter un hôte Home Assistant à **Dockhand** en **mode Edge**.

Le mode Edge permet à Hawser d’initier une connexion sortante sécurisée vers Dockhand, sans exposer de ports ni nécessiter d’IP publique.

---

## 🧠 Architecture

Home Assistant OS
→ Add-on Hawser (container Docker)
→ Docker socket de l’hôte HA
→ Connexion WebSocket sortante (TLS)
→ Dockhand

---

## 🔐 Sécurité

* ❌ Pas de `host_network`
* ✅ Accès Docker **uniquement** via `/var/run/docker.sock`
* ✅ Authentification par **token secret**
* ✅ Connexion sortante uniquement

Ce modèle est adapté aux environnements :

* NAT
* IP dynamique
* box Internet / homelab

---

## 📁 Structure du dépôt

```
hawser-ha-addon/
├── repository.yaml
└── hawser/
    ├── Dockerfile
    ├── config.yaml
    └── run.sh
```

---

## ⚙️ Configuration de l’add-on

### `config.yaml`

```yaml
name: Hawser Agent
slug: hawser
version: "1.0.0"
description: Hawser agent for Dockhand (Edge mode)
arch:
  - amd64
  - armv7
  - armhf
  - aarch64
startup: services
boot: auto
host_network: false
map:
  - docker_socket
options:
  dockhand_server_url: ""
  token: ""
schema:
  dockhand_server_url: str
  token: password
```

### Champs importants

* `dockhand_server_url`

  * Exemple : `wss://dockhand.example.com/api/hawser/connect`
* `token`

  * Token secret généré dans Dockhand ou via `openssl rand -hex 32`

---

## 🐳 Dockerfile

```dockerfile
ARG BUILD_FROM
FROM ghcr.io/finsys/hawser:latest

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
```

---

## ▶️ Script de démarrage

### `run.sh`

```sh
#!/usr/bin/with-contenv sh

export DOCKHAND_SERVER_URL="${dockhand_server_url}"
export TOKEN="${token}"

exec hawser \
  --server "$DOCKHAND_SERVER_URL" \
  --token "$TOKEN"
```

---

## 🚀 Installation dans Home Assistant OS

1. Fork ou clone ce dépôt
2. Modifie `repository.yaml` avec ton URL GitHub
3. Dans Home Assistant :

   * Settings → Add-ons → Add-on Store → Repositories
   * Ajouter l’URL du repo
4. Installer **Hawser Agent**
5. Renseigner :

   * `dockhand_server_url`
   * `token`
6. Démarrer l’add-on

---

## ✅ Fonctionnement attendu

* Hawser se connecte automatiquement à Dockhand
* L’hôte Home Assistant apparaît comme **Environment actif**
* Dockhand peut :

  * lister les containers
  * démarrer / arrêter
  * déployer

---

## 🧪 Dépannage

### Hawser ne se connecte pas

* Vérifier l’URL `/api/hawser/connect`
* Vérifier le token
* Vérifier l’horloge système (TLS)

### Erreur Docker

* Vérifier `map: docker_socket`
* Redémarrer l’add-on

---

## 🧩 Limitations

* Fonctionne uniquement sur **Home Assistant OS**
* Accès Docker = contrôle total de l’hôte
* À ne pas exposer sur un Dockhand non sécurisé

---

## 📜 Licence

MIT

---

## ✨ Bonnes pratiques

* Un token par agent
* Rotation régulière des tokens
* Dockhand derrière HTTPS

---

Happy homelabbing 🚀
