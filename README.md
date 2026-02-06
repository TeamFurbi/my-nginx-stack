# Nginx Swarm Stack

Este repositorio contiene un stack Docker Swarm para desplegar Nginx utilizando Portainer en modo "Git repository".

## Archivos

- `docker-compose.yml` → Manifiesto del stack Swarm.
- `.env` → Variables utilizadas por el compose, en este caso no se utiliza.
- `configs/` (si se usa) → Archivos de configuración opcionales para el docker.

## Variables configurables (stack.env)

- `NGINX_VERSION` → Versión de la imagen de Nginx.
- `NODE_TYPE` → Label del nodo Swarm (`docker node update --label-add type=TEST <node>`).
- `MEM_LIMIT` → Límite de memoria por contenedor (docker).
- `RESTART_MAX_ATTEMPTS` → Intentos de reinicio antes de parar por completo.

## Cómo usarlo con Portainer

1. Crear un stack → "Deploy from Git repository".
2. URL del repo: `https://github.com/<tu_usuario>/nginx-swarm-stack.git`
3. Branch: `main`
4. Compose path: `docker-compose.yml`
5. Deploy the stack.

Portainer descargará el repo, leerá `stack.env` y desplegará el stack automáticamente.

## Cómo actualizar

1. Cambiar variables o YAML en el repositorio.
2. En Portainer → Stack → **Pull and redeploy**. Ademas se ha definido en Portainer un mecanismo de "GitOps updates" de 5m, si el repositorio git difiere de lo que se almacenó localmente en el último git pull, se implementan los cambios.
3. Swarm aplicará rolling update (de uno en uno) con rollback automático si falla.
