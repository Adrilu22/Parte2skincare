-- =============================================================
-- GlowLab Skincare — Esquema de Base de Datos
-- PostgreSQL 14+
-- Ejecutar: psql -h HOST -U USER -d skincaredb -f schema.sql
-- =============================================================

-- Tabla 1: Categorías de productos
CREATE TABLE IF NOT EXISTS categorias (
    id          BIGSERIAL    PRIMARY KEY,
    nombre      VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    icono       VARCHAR(10)  DEFAULT '🧴',
    created_at  TIMESTAMP    DEFAULT NOW()
);

-- Tabla 2: Productos de skincare (relacionada con categorias)
CREATE TABLE IF NOT EXISTS productos (
    id           BIGSERIAL      PRIMARY KEY,
    categoria_id BIGINT         REFERENCES categorias(id) ON DELETE SET NULL,
    nombre       VARCHAR(200)   NOT NULL,
    marca        VARCHAR(100),
    precio       DECIMAL(10,2),
    descripcion  TEXT,
    tipos_piel   VARCHAR(100),  -- Ej: "grasa,mixta"
    created_at   TIMESTAMP      DEFAULT NOW()
);

-- Tabla 3: Usuarios del sistema
CREATE TABLE IF NOT EXISTS usuarios (
    id            BIGSERIAL    PRIMARY KEY,
    nombre        VARCHAR(100) NOT NULL,
    email         VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    rol           VARCHAR(20)  DEFAULT 'USER', -- ADMIN o USER
    created_at    TIMESTAMP    DEFAULT NOW()
);

-- Tabla 4: Rutinas personalizadas (relacionada con usuarios)
CREATE TABLE IF NOT EXISTS rutinas (
    id             BIGSERIAL    PRIMARY KEY,
    usuario_id     BIGINT       REFERENCES usuarios(id) ON DELETE CASCADE,
    nombre         VARCHAR(150) NOT NULL,
    tipo_piel      VARCHAR(50),
    preocupaciones VARCHAR(255),
    pasos_json     TEXT,        -- JSON con los pasos de la rutina
    created_at     TIMESTAMP    DEFAULT NOW()
);

-- Índices para mejorar rendimiento en consultas frecuentes
CREATE INDEX IF NOT EXISTS idx_productos_categoria ON productos(categoria_id);
CREATE INDEX IF NOT EXISTS idx_rutinas_usuario     ON rutinas(usuario_id);
CREATE INDEX IF NOT EXISTS idx_usuarios_email      ON usuarios(email);