# Hawser Agent – Add-on Home Assistant OS

## ⚠️ Disclaimer

> **Important notice**
>
> This Home Assistant add-on is **currently not functional on Home Assistant OS** due to **platform limitations**.
>
> Home Assistant OS **does not allow third-party add-ons to access the Docker API** (`/var/run/docker.sock`), even in read-only or privileged modes. As a result, Docker-based agents such as **Hawser** cannot retrieve container information from HA OS.
>
> 🔧 **Status**: The add-on is under active investigation. Alternative approaches and workarounds are being evaluated, but there is **no guaranteed solution** at this time.
>
> ✅ This is **not a bug in Hawser or Dockhand**, but a design restriction of Home Assistant OS.

Still trying to find a proper solution for that !

![Dockhand Logo](logo.png)

 

## 📌 Présentation

Cet add-on permet d’exécuter **Hawser** sur **Home Assistant OS** afin de connecter l’hôte Home Assistant à **Dockhand**.

👉 **Cet add-on est uniquement un agent Docker pour Dockhand.**
Il n’ajoute aucune intégration Home Assistant, aucune entité, aucun service HA.

Son rôle est simple :

* exposer l’API Docker de Home Assistant à Dockhand
* via une connexion **sortante sécurisée (Edge mode)**

---


---

## 📜 Licence

MIT

---

Add-on minimal, sécurisé, orienté production 🚀
