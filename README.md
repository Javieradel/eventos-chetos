# eventos-chetos
Plataforma para eventos

## 🚀 Configuración de Entorno de Desarrollo

### Requisitos

- **Docker** y **Docker Compose** instalados
- **Git** para clonar el repositorio
- Permisos de administrador/sudo para configurar hosts locales

### Instalación y Ejecución

1. **Clonar el repositorio**
```bash
git clone <repository-url>
cd eventos-chetos
```

2. **Configurar host local (opcional pero recomendado)**

**Linux/Mac:**
```bash
./setup-hosts-unix.sh
```

**Windows (ejecutar como Administrador):**
```cmd
setup-hosts-windows.bat
```

3. **Levantar servicios**
```bash
docker-compose up --build
```

### Acceso a la Aplicación

- **Aplicación Web:** 
  - http://localhost
  - http://eventos-chetos.local (si configuraste el host)
- **API Spring Boot:** http://localhost:8080
- **Base de datos PostgreSQL:** localhost:5432
  - Database: `eventos_db`
  - Usuario: `eventos_user`
  - Contraseña: `eventos_password`

### Arquitectura del Proyecto

```
eventos-chetos/
├── App/                    # Aplicación Spring Boot
├── nginx/                  # Configuración Nginx
├── docker-compose.yml      # Orquestación de servicios
├── Dockerfile             # Build para producción
├── Dockerfile.dev         # Build para desarrollo (hot reload)
└── setup-hosts-*.*        # Scripts configuración hosts
```

### Servicios Docker

- **postgres**: Base de datos PostgreSQL 15
- **spring-app**: Aplicación Spring Boot con hot reload
- **nginx**: Proxy reverso y servidor web

### Desarrollo

El entorno está configurado para desarrollo con:
- ✅ Hot reload automático (Spring Boot DevTools)
- ✅ Logs detallados (DEBUG level)
- ✅ Base de datos persistente
- ✅ Proxy reverso con Nginx

# Historias de Usuario - App de Eventos

## Autenticación
- *Como usuario quiero registrarme con email y contraseña para acceder a la app.  
- *Como usuario quiero iniciar sesión para acceder a mis eventos y asistencia.  
- *Como usuario quiero cerrar sesión para proteger mi cuenta.  

## Eventos
- *Como usuario quiero crear un evento con título, descripción, fecha y lugar para compartirlo con otros.  
- *Como usuario quiero dar de baja mi evento para que no esté disponible públicamente.  
- *Como usuario quiero ver los detalles de un evento para decidir si asistir.  
- *Como usuario quiero marcar mi asistencia a un evento para confirmar que participaré.  
- *Como usuario quiero registrarme en un evento para recibir notificaciones e información.  

## Administración de eventos
- *Como creador de un evento quiero editar sus datos para mantenerlos actualizados.  
- *Como creador de un evento quiero eliminar mi evento para dejar de mostrarlo.  
- *Como creador de un evento quiero acceder a un panel administrativo para gestionar asistentes y detalles.  
- *Como creador de un evento quiero generar un informe al finalizar para documentar resultados.  

## Vistas principales
- **Inicio**: listado de eventos disponibles, CTA registro y login.  
- **Login**: Autenticase y registrarse.  
- **Inicio Usuario**: Listado de eventos disponibles, búsqueda, Administrar eventos.
- **Detalle de evento**: información completa, opción de marcar asistencia y administrar si soy dueño del evento.  
- **Mi perfil**: ~.  
- **Panel admin de evento (solo creador)**: gestión de asistentes, edición, baja y generación de informe.  

## Documentación API
- Como desarrollador quiero consultar documentación de la API para integrar funcionalidades de eventos, autenticación y reportes.  
