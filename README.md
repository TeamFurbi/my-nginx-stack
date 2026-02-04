# Nginx Swarm Stack

Este repositorio contiene un stack Docker Swarm para desplegar Nginx utilizando Portainer en modo "Git repository".

## Archivos

- `docker-compose.yml` → Manifiesto del stack Swarm.
- `stack.env` → Variables utilizadas por el compose.
- `configs/` (si se usa) → Archivos de configuración opcionales.

## Variables configurables (stack.env)

- `NGINX_VERSION` → Versión de la imagen de Nginx.
- `NODE_TYPE` → Label del nodo Swarm (`docker node update --label-add type=TEST <node>`).
- `MEM_LIMIT` → Límite de memoria por contenedor.
- `RESTART_MAX_ATTEMPTS` → Intentos de reinicio antes de parar.

## Cómo usarlo con Portainer

1. Crear un stack → "Deploy from Git repository".
2. URL del repo: `https://github.com/<tu_usuario>/nginx-swarm-stack.git`
3. Branch: `main`
4. Compose path: `docker-compose.yml`
5. Deploy the stack.

Portainer descargará el repo, leerá `stack.env` y desplegará el stack automáticamente.

## Cómo actualizar

1. Cambiar variables o YAML en el repositorio.
2. En Portainer → Stack → **Pull and redeploy**.
3. Swarm aplicará rolling update con rollback automático si falla.
