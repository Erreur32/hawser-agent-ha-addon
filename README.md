# Hawser Agent – Add-on Home Assistant OS

##⚠️ Disclaimer

> **Important notice**
>
> This Home Assistant add-on is **currently not functional on Home Assistant OS** due to **platform limitations**.
>
> Home Assistant OS **does not allow third-party add-ons to access the Docker API** (`/var/run/docker.sock`), even in read-only or privileged modes. As a result, Docker-based agents such as **Hawser** cannot retrieve container information from HA OS.
>
> 🔧 **Status**: The add-on is under active investigation. Alternative approaches and workarounds are being evaluated, but there is **no guaranteed solution** at this time.
>
> ✅ This is **not a bug in Hawser or Dockhand**, but a design restriction of Home Assistant OS.


![Dockhand Logo](logo.png)

 

## 📌 Présentation

Cet add-on permet d’exécuter **Hawser** sur **Home Assistant OS** afin de connecter l’hôte Home Assistant à **Dockhand**.

👉 **Cet add-on est uniquement un agent Docker pour Dockhand.**
Il n’ajoute aucune intégration Home Assistant, aucune entité, aucun service HA.

Son rôle est simple :

* exposer l’API Docker de Home Assistant à Dockhand
* via une connexion **sortante sécurisée (Edge mode)**

---

## 🧠 Fonctionnement

* Hawser tourne dans un container géré par Home Assistant
* Il se connecte à Dockhand via WebSocket (TLS)
* Dockhand peut alors administrer les containers Docker de Home Assistant

Aucun port entrant n’est ouvert sur Home Assistant.

---

## 🔐 Sécurité

* Mode **Edge** uniquement (connexion sortante)
* Pas de `host_network`
* Accès Docker strictement via le socket
* Authentification par **token secret**

⚠️ Donner accès à Dockhand = donner accès complet à Docker.

---

## 🚀 Installation

1. Ajouter le dépôt GitHub de l’add-on dans Home Assistant
2. Installer **Hawser Agent**
3. Configurer :

   * URL du serveur Dockhand
   * Token secret
4. Démarrer l’add-on

Une fois connecté, l’environnement apparaît automatiquement dans Dockhand.

---

## 📊 Logs (Home Assistant)

Les logs sont **100 % intégrés à Home Assistant**.

### Accès aux logs

Home Assistant → Settings → Add-ons → Hawser Agent → Logs

### Logs standards

```
INFO starting hawser agent
INFO connecting to Dockhand
INFO websocket connected
INFO docker client ready
```

### Logs debug

Le mode debug est activé par défaut dans cet add-on.

```
DEBUG docker event received
DEBUG websocket heartbeat ok
```

---

## 🧪 Dépannage rapide

### L’agent ne se connecte pas

* Vérifier l’URL Dockhand (`/api/hawser/connect`)
* Vérifier le token
* Vérifier l’heure système (TLS)

### Aucun container visible

* Vérifier que l’add-on est démarré
* Vérifier les logs (permission Docker)

---

## ✅ Compatibilité

* Home Assistant OS uniquement
* Toutes architectures supportées par HA

---

## 📜 Licence

MIT

---

Add-on minimal, sécurisé, orienté production 🚀
