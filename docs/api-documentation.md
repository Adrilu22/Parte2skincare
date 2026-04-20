# 📡 Documentación de API — GlowLab Skincare

**Base URL:** `https://TU_URL_CLOUD_RUN/api`  
**Versión:** 1.0  
**Formato de respuesta:** JSON  
**Autenticación:** Por rol (Admin / Usuario)

---

## 📂 Categorías

### `GET /api/categorias`
Lista todas las categorías disponibles.

**Request:**
```http
GET https://TU_URL/api/categorias
```

**Response 200 — Éxito:**
```json
[
  {
    "id": 1,
    "nombre": "Limpiadores",
    "descripcion": "Productos de limpieza facial diaria",
    "icono": "🫧",
    "createdAt": "2024-01-15T10:00:00"
  },
  {
    "id": 2,
    "nombre": "Sérum",
    "descripcion": "Tratamientos concentrados con activos",
    "icono": "💧",
    "createdAt": "2024-01-15T10:00:00"
  }
]
```

---

### `GET /api/categorias/{id}`
Obtiene una categoría específica por su ID.

**Request:**
```http
GET https://TU_URL/api/categorias/1
```

**Response 200 — Éxito:**
```json
{
  "id": 1,
  "nombre": "Limpiadores",
  "descripcion": "Productos de limpieza facial diaria",
  "icono": "🫧",
  "createdAt": "2024-01-15T10:00:00"
}
```

**Response 404 — No encontrada:**
```json
{
  "error": "Categoría no encontrada",
  "status": 404,
  "timestamp": "2024-01-15T10:00:00"
}
```

---

### `POST /api/categorias` ⚠️ Solo Admin
Crea una nueva categoría.

**Request:**
```http
POST https://TU_URL/api/categorias
Content-Type: application/json

{
  "nombre": "Contorno de Ojos",
  "descripcion": "Tratamientos específicos para la zona ocular",
  "icono": "👁️"
}
```

**Response 201 — Creada:**
```json
{
  "id": 7,
  "nombre": "Contorno de Ojos",
  "descripcion": "Tratamientos específicos para la zona ocular",
  "icono": "👁️",
  "createdAt": "2024-01-15T10:05:00"
}
```

**Response 400 — Error de validación:**
```json
{
  "error": "El nombre de la categoría es obligatorio",
  "status": 400,
  "timestamp": "2024-01-15T10:05:00"
}
```

---

### `PUT /api/categorias/{id}` ⚠️ Solo Admin
Actualiza una categoría existente.

**Request:**
```http
PUT https://TU_URL/api/categorias/7
Content-Type: application/json

{
  "nombre": "Contorno de Ojos Premium",
  "descripcion": "Tratamientos avanzados para la zona ocular"
}
```

**Response 200 — Actualizada:**
```json
{
  "id": 7,
  "nombre": "Contorno de Ojos Premium",
  "descripcion": "Tratamientos avanzados para la zona ocular",
  "icono": "👁️",
  "createdAt": "2024-01-15T10:05:00"
}
```

**Response 404 — No encontrada:**
```json
{ "error": "Categoría no encontrada", "status": 404 }
```

---

### `DELETE /api/categorias/{id}` ⚠️ Solo Admin
Elimina una categoría por su ID.

**Request:**
```http
DELETE https://TU_URL/api/categorias/7
```

**Response 204 — Eliminada:** Sin contenido en el body.

**Response 404 — No encontrada:**
```json
{ "error": "Categoría no encontrada", "status": 404 }
```

---

### `GET /api/categorias/{id}/productos`
Obtiene todos los productos que pertenecen a una categoría. **Endpoint de relación entre entidades.**

**Request:**
```http
GET https://TU_URL/api/categorias/2/productos
```

**Response 200 — Éxito:**
```json
[
  {
    "id": 3,
    "nombre": "Sérum Vitamina C 10%",
    "marca": "Sesderma",
    "precio": 95000.00,
    "descripcion": "Ilumina manchas y unifica el tono de la piel",
    "tiposPiel": "grasa,seca,mixta,sensible"
  }
]
```

---

## 📦 Productos

### `GET /api/productos`
Lista todos los productos. Acepta filtros opcionales.

**Sin filtros:**
```http
GET https://TU_URL/api/productos
```

**Con filtro de categoría:**
```http
GET https://TU_URL/api/productos?categoriaId=2
```

**Con filtro de tipo de piel:**
```http
GET https://TU_URL/api/productos?tiposPiel=grasa
```

**Con ambos filtros:**
```http
GET https://TU_URL/api/productos?categoriaId=2&tiposPiel=grasa
```

**Response 200 — Éxito:**
```json
[
  {
    "id": 5,
    "nombre": "Niacinamide 10% + Zinc 1%",
    "marca": "The Ordinary",
    "precio": 30000.00,
    "descripcion": "Reduce poros visibles y controla exceso de sebo",
    "tiposPiel": "grasa,mixta",
    "createdAt": "2024-01-10T09:00:00"
  }
]
```

---

### `GET /api/productos/{id}`
Obtiene un producto específico por su ID.

**Request:**
```http
GET https://TU_URL/api/productos/5
```

**Response 200:** Objeto producto completo.  
**Response 404:** `{ "error": "Producto no encontrado", "status": 404 }`

---

### `POST /api/productos` ⚠️ Solo Admin
Crea un nuevo producto.

**Request:**
```http
POST https://TU_URL/api/productos
Content-Type: application/json

{
  "nombre": "Retinol 0.5%",
  "marca": "The Ordinary",
  "categoriaId": 2,
  "precio": 45000,
  "descripcion": "Tratamiento anti-aging con retinol encapsulado",
  "tiposPiel": "grasa,mixta"
}
```

**Response 201:** Producto creado con su ID asignado.  
**Response 400:** `{ "error": "La categoría especificada no existe", "status": 400 }`

---

### `PUT /api/productos/{id}` ⚠️ Solo Admin
Actualiza un producto existente. Solo se actualizan los campos enviados.

**Request:**
```http
PUT https://TU_URL/api/productos/12
Content-Type: application/json

{
  "precio": 48000,
  "descripcion": "Descripción actualizada del producto"
}
```

**Response 200:** Producto con los datos actualizados.

---

### `DELETE /api/productos/{id}` ⚠️ Solo Admin
Elimina un producto por su ID.

**Request:**
```http
DELETE https://TU_URL/api/productos/12
```

**Response 204:** Sin contenido.  
**Response 404:** Producto no encontrado.

---

## 👤 Usuarios

### `POST /api/usuarios/register`
Registra un nuevo usuario en el sistema.

**Request:**
```http
POST https://TU_URL/api/usuarios/register
Content-Type: application/json

{
  "nombre": "María García",
  "email": "maria@example.com",
  "password": "miContrasena123",
  "rol": "USER"
}
```

**Response 201 — Creado:**
```json
{
  "id": 3,
  "nombre": "María García",
  "email": "maria@example.com",
  "rol": "USER"
}
```

**Response 400 — Email ya existe:**
```json
{ "error": "Ya existe un usuario con ese correo", "status": 400 }
```

---

### `POST /api/usuarios/login`
Inicia sesión y retorna los datos del usuario autenticado.

**Request:**
```http
POST https://TU_URL/api/usuarios/login
Content-Type: application/json

{
  "email": "admin@glowlab.co",
  "password": "admin123"
}
```

**Response 200 — Éxito:**
```json
{
  "id": 1,
  "nombre": "Adriana Carreño",
  "email": "admin@glowlab.co",
  "rol": "ADMIN"
}
```

**Response 401 — Credenciales incorrectas:**
```json
{ "error": "Credenciales incorrectas", "status": 401 }
```

---

## 📋 Rutinas

### `GET /api/usuarios/{id}/rutinas`
Obtiene todas las rutinas guardadas de un usuario.

**Request:**
```http
GET https://TU_URL/api/usuarios/2/rutinas
```

**Response 200:**
```json
[
  {
    "id": 1,
    "nombre": "Mi Rutina Piel Grasa",
    "tipoPiel": "grasa",
    "preocupaciones": "acne,poros",
    "pasosJson": "[{\"orden\":1,\"paso\":\"Limpieza\",\"productoNombre\":\"Salicylic Acid 2%\"}]",
    "createdAt": "2024-01-20T08:00:00"
  }
]
```

---

### `POST /api/rutinas`
Guarda una nueva rutina para un usuario.

**Request:**
```http
POST https://TU_URL/api/rutinas
Content-Type: application/json

{
  "usuarioId": 2,
  "nombre": "Mi Rutina Matutina",
  "tipoPiel": "grasa",
  "preocupaciones": "acne,poros",
  "pasosJson": "[{\"orden\":1,\"paso\":\"Limpieza\",\"productoId\":2}]"
}
```

**Response 201:** Rutina creada.

---

### `DELETE /api/rutinas/{id}`
Elimina una rutina guardada.

**Request:**
```http
DELETE https://TU_URL/api/rutinas/1
```

**Response 204:** Sin contenido.

---

## 🔢 Códigos de Estado HTTP

| Código | Significado | Cuándo ocurre |
|--------|-------------|---------------|
| `200` | OK | Consulta o actualización exitosa |
| `201` | Created | Recurso creado exitosamente |
| `204` | No Content | Eliminación exitosa |
| `400` | Bad Request | Datos inválidos o campo faltante |
| `401` | Unauthorized | Email o contraseña incorrectos |
| `403` | Forbidden | Sin permisos para esa operación |
| `404` | Not Found | Recurso no existe en la base de datos |
| `500` | Internal Server Error | Error inesperado en el servidor |

## ⚠️ Formato de Error Estándar

Todos los errores retornan el mismo formato JSON:

```json
{
  "error": "Descripción clara del problema",
  "status": 400,
  "timestamp": "2024-01-15T10:00:00"
}
```
