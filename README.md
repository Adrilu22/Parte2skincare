# 🌿 GlowLab — Skincare Intelligence Platform

[![App](https://img.shields.io/badge/App%20Web-Firebase%20Hosting-orange?logo=firebase)](https://api-de-skincare-22722.web.app/)
[![Backend](https://img.shields.io/badge/Backend-Cloud%20Run-4285F4?logo=google-cloud)](https://cloud.google.com/run)
[![DB](https://img.shields.io/badge/Base%20de%20Datos-PostgreSQL%20Cloud%20SQL-336791?logo=postgresql)](https://cloud.google.com/sql)
[![CI](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions%20%2B%20Cloud%20Build-success)](https://github.com/Adrilu22/Parte2skincare/actions)

> Aplicación web full-stack para gestión de productos de skincare y rutinas personalizadas, desplegada en Google Cloud Platform. Segunda entrega integrando gestión colaborativa con GitHub Projects y metodología Kanban.

---

## 👥 Equipo de Desarrollo

| Integrante | Rol | Responsabilidades |
|---|---|---|
| **Adriana Carreño** | Product Owner · Frontend Developer | Diseño UI/UX, integración API, despliegue Firebase, documentación, gestión repositorio |
| **Sary Ariza Vargas** | Backend Developer · DevOps Engineer | API REST Spring Boot, Cloud Run, Cloud SQL, GitHub Actions, seguridad |

---

## 📋 Descripción del Proyecto

**GlowLab** es una plataforma de inteligencia skincare con dos experiencias diferenciadas según el rol del usuario:

- **Administradores:** CRUD completo del catálogo — crear, editar y eliminar productos y categorías
- **Usuarios normales:** Explorar catálogo, filtrar por tipo de piel, construir y guardar rutinas personalizadas

### Dominio
Sistema de gestión de productos de cuidado personal (skincare) con cuatro entidades relacionadas: **Categorías**, **Productos**, **Usuarios** y **Rutinas**.

---

## 🛠️ Stack Tecnológico

| Capa | Tecnología | Versión |
|---|---|---|
| Backend | Spring Boot | 3.2 |
| Lenguaje | Java | 17 |
| ORM | Spring Data JPA / Hibernate | — |
| Base de datos | PostgreSQL | 14 |
| Frontend | HTML5 · CSS3 · JavaScript Vanilla | ES2022 |
| Hosting frontend | Firebase Hosting | — |
| Contenedor | Docker | — |
| Backend cloud | Google Cloud Run | — |
| Base de datos cloud | Google Cloud SQL | — |
| Registro de imágenes | Google Artifact Registry | — |
| CI/CD | Google Cloud Build + GitHub Actions | — |
| Gestión del proyecto | GitHub Projects (Kanban) | — |

---

## ☁️ Arquitectura del Sistema

```
┌─────────────────────────────────────────────────┐
│             USUARIO / ADMINISTRADOR              │
│              (Navegador web / móvil)             │
└──────────────────────┬──────────────────────────┘
                       │ HTTPS
                       ▼
┌─────────────────────────────────────────────────┐
│            Firebase Hosting (GCP)                │
│         index.html · CSS · JavaScript            │
│   https://api-de-skincare-22722.web.app/         │
└──────────────────────┬──────────────────────────┘
                       │ fetch() / REST API
                       ▼
┌─────────────────────────────────────────────────┐
│     Cloud Run — Contenedor Docker (Java 17)      │
│          API REST Spring Boot                    │
│  /api/categorias · /api/productos                │
│  /api/usuarios   · /api/rutinas                  │
└──────────────────────┬──────────────────────────┘
                       │ JDBC / SSL
                       ▼
┌─────────────────────────────────────────────────┐
│      Google Cloud SQL — PostgreSQL 14            │
│  categorias · productos · usuarios · rutinas     │
└─────────────────────────────────────────────────┘

Servicios adicionales GCP:
  Artifact Registry → almacena imágenes Docker
  Cloud Build       → pipeline CI/CD en cada push a main
```

---

## 🗄️ Modelo de Datos

```
┌─────────────────┐         ┌───────────────────────┐
│   categorias    │         │       productos        │
├─────────────────┤         ├───────────────────────┤
│ id (PK)         │◄────────│ categoria_id (FK)      │
│ nombre          │         │ id (PK)                │
│ descripcion     │         │ nombre                 │
│ icono           │         │ marca                  │
│ created_at      │         │ precio                 │
└─────────────────┘         │ descripcion            │
                            │ tipos_piel             │
                            │ created_at             │
                            └───────────────────────┘

┌─────────────────┐         ┌───────────────────────┐
│    usuarios     │         │        rutinas         │
├─────────────────┤         ├───────────────────────┤
│ id (PK)         │◄────────│ usuario_id (FK)        │
│ nombre          │         │ id (PK)                │
│ email (UNIQUE)  │         │ nombre                 │
│ password_hash   │         │ tipo_piel              │
│ rol (ENUM)      │         │ preocupaciones         │
│ created_at      │         │ pasos_json             │
└─────────────────┘         │ created_at             │
                            └───────────────────────┘
```

---

## 🔐 Sistema de Roles

| Funcionalidad | Admin | Usuario |
|---|:---:|:---:|
| Ver catálogo de productos | ✅ | ✅ |
| Ver categorías | ✅ | ✅ |
| Filtrar por tipo de piel | ✅ | ✅ |
| Crear producto | ✅ | ❌ |
| Editar producto | ✅ | ❌ |
| Eliminar producto | ✅ | ❌ |
| Crear categoría | ✅ | ❌ |
| Editar categoría | ✅ | ❌ |
| Eliminar categoría | ✅ | ❌ |
| Generar rutina personalizada | ✅ | ✅ |
| Guardar rutinas propias | ✅ | ✅ |

**Credenciales de demostración:**
```
Admin:   admin@glowlab.co  /  admin123
Usuario: user@glowlab.co   /  user123
```

---

## 🔗 URLs de Acceso

| Recurso | URL |
|---|---|
| 🌐 Aplicación web | https://api-de-skincare-22722.web.app/ |
| 🔧 API Backend | `https://TU_URL_CLOUD_RUN/api` |
| 📁 Repositorio Parte 1 | https://github.com/Adrilu22/API-de-Skincare |
| 📁 Repositorio Parte 2 | https://github.com/Adrilu22/Parte2skincare |
| 📊 GitHub Project | `https://github.com/users/Adrilu22/projects/TU_NUMERO` |

---

## 🚀 Instalación y Ejecución Local (Windows)

### Prerequisitos
- Java 17 instalado
- Maven instalado
- Git instalado
- PostgreSQL instalado localmente **O** Docker Desktop

### Paso 1 — Clonar el repositorio
Abre **PowerShell** o **Git Bash** y ejecuta:
```bash
git clone https://github.com/Adrilu22/Parte2skincare.git
cd Parte2skincare
```

### Paso 2 — Crear la base de datos local

**Opción A — Con Docker (recomendado, más fácil):**
```bash
docker run --name glowlab-db ^
  -e POSTGRES_DB=skincaredb ^
  -e POSTGRES_USER=skincare ^
  -e POSTGRES_PASSWORD=skincare123 ^
  -p 5432:5432 -d postgres:14
```

**Opción B — Con PostgreSQL instalado localmente:**
Abre pgAdmin → crea una base de datos llamada `skincaredb` con usuario `skincare` y contraseña `skincare123`.

### Paso 3 — Cargar el esquema y los datos
En **pgAdmin** o en la terminal:
```bash
psql -h localhost -U skincare -d skincaredb -f database/schema.sql
psql -h localhost -U skincare -d skincaredb -f database/seed.sql
```

### Paso 4 — Configurar el backend
```bash
# Copiar el archivo de ejemplo
copy backend\src\main\resources\application.properties.example ^
     backend\src\main\resources\application.properties
```
El archivo ya tiene los valores correctos para desarrollo local. No necesitas modificarlo.

### Paso 5 — Ejecutar el backend
```bash
cd backend
mvn spring-boot:run
```
La API estará disponible en: `http://localhost:8080/api`

Prueba que funciona abriendo en el navegador: `http://localhost:8080/api/categorias`

### Paso 6 — Abrir el frontend
Abre `frontend/index.html` directamente en tu navegador.
O si tienes la extensión **Live Server** en VS Code, haz clic derecho → "Open with Live Server".

---

## ☁️ Comandos de Despliegue en GCP

### Backend — Cloud Run via Cloud Build
```bash
# Desde la RAÍZ del repositorio (Parte2skincare/)
gcloud builds submit --config backend/cloudbuild.yaml
```

### Frontend — Firebase Hosting
```bash
# Desde la RAÍZ del repositorio
firebase login
firebase deploy --only hosting
```

---

## ⚠️ Problemas Encontrados y Soluciones

### Problema 1: Cloud Run no arrancaba — error de puerto
**Síntoma:** El contenedor se desplegaba pero Cloud Run marcaba el servicio como "unhealthy"  
**Causa:** Spring Boot usaba `server.port=8080` fijo, pero Cloud Run asigna el puerto via la variable `PORT`  
**Solución:** Cambiar en `application.properties`:
```properties
server.port=${PORT:8080}
```

### Problema 2: Pantalla en blanco al acceder a Cloud Run
**Síntoma:** La URL del backend mostraba el API pero no el frontend  
**Causa:** Cloud Run sirve el contenedor Java (solo API REST), no archivos HTML estáticos  
**Solución:** Separar responsabilidades — backend en Cloud Run, frontend en Firebase Hosting

### Problema 3: CORS bloqueaba peticiones del frontend
**Síntoma:** El navegador devolvía error `Access-Control-Allow-Origin`  
**Causa:** Spring Boot rechazaba peticiones de orígenes distintos  
**Solución:** Agregar `CorsConfig.java` en el backend:
```java
registry.addMapping("/api/**")
    .allowedOrigins("https://api-de-skincare-22722.web.app", "http://localhost:3000")
    .allowedMethods("GET","POST","PUT","DELETE","OPTIONS");
```

### Problema 4: Credenciales expuestas en el código
**Síntoma:** La contraseña de Cloud SQL aparecía en `cloudbuild.yaml`  
**Solución:** Eliminar credenciales del código y configurarlas como variables de entorno directamente en la consola de Cloud Run

---

## 📊 GitHub Projects — Gestión Colaborativa

**Tablero Kanban:** `https://github.com/users/Adrilu22/projects/TU_NUMERO`  
**Metodología:** Ágil con Kanban — 3 sprints

### Sprints Completados

#### Sprint 1 — Backend y Base de Datos ✅
| Issue | Historia | Responsable | Pts |
|---|---|---|---|
| #1 | Configuración PostgreSQL en Cloud SQL | Adriana | 3 |
| #2 | API REST Categorías CRUD | Adriana | 5 |
| #3 | API REST Productos CRUD | Sary | 5 |
| #4 | CORS y variables de entorno | Sary | 2 |
| #13 | Scripts SQL y datos de prueba | Adriana | 2 |
| #14 | Pruebas de endpoints con Postman | Sary | 3 |

#### Sprint 2 — Frontend ✅
| Issue | Historia | Responsable | Pts |
|---|---|---|---|
| #5 | Rediseño completo de la UI | Adriana | 5 |
| #6 | Sistema de login con roles | Adriana | 3 |
| #7 | Panel de administración de productos | Sary | 5 |
| #8 | Módulo de rutinas personalizadas | Sary | 5 |
| #15 | Integración frontend con API | Adriana | 3 |
| #16 | Manejo de errores y estados de carga | Sary | 2 |

#### Sprint 3 — Despliegue y Documentación ✅
| Issue | Historia | Responsable | Pts |
|---|---|---|---|
| #9 | Despliegue backend en Cloud Run | Adriana | 5 |
| #10 | Despliegue frontend en Firebase | Adriana | 3 |
| #11 | GitHub Actions CI y automatización | Sary | 3 |
| #12 | README y documentación de API | Sary | 3 |
| #17 | Guía de despliegue y conectividad | Adriana | 2 |
| #18 | Retrospectiva y lecciones aprendidas | Sary | 1 |

### Métricas del Proyecto

| Métrica | Sprint 1 | Sprint 2 | Sprint 3 |
|---|---|---|---|
| Puntos planificados | 20 | 23 | 17 |
| Puntos completados | 20 | 23 | 17 |
| Historias completadas | 6/6 | 6/6 | 6/6 |

**Velocity promedio:** 20 pts/sprint · **Total historias:** 18/18 completadas

---

## 💡 Lecciones Aprendidas

1. **Separación de servicios cloud:** El frontend y el backend deben estar en servicios especializados. Firebase Hosting sirve estáticos con CDN global; Cloud Run ejecuta contenedores.
2. **Variables de entorno desde el primer día:** Configurar credenciales como variables de entorno desde el inicio evita tener que remediar exposiciones de seguridad.
3. **CORS es silencioso:** El error aparece solo en el navegador, no en el servidor, lo que dificulta el diagnóstico inicial.
4. **GitHub Projects mejora la visibilidad:** El tablero Kanban con estimaciones permitió ver el progreso real y detectar bloqueos a tiempo.
5. **CI desde el principio:** GitHub Actions detectó errores de compilación antes de que llegaran a producción.

---

*GlowLab — Los Libertadores · Desarrollo de Aplicaciones en la Nube · 2024*
