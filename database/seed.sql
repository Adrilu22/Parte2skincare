-- =============================================================
-- GlowLab Skincare — Datos de Prueba
-- Ejecutar DESPUÉS de schema.sql
-- =============================================================

-- Categorías
INSERT INTO categorias (nombre, descripcion, icono) VALUES
('Limpiadores',     'Productos de limpieza facial diaria',     '🫧'),
('Sérum',           'Tratamientos concentrados con activos',   '💧'),
('Hidratante',      'Cremas y lociones hidratantes',           '🧴'),
('Protector Solar', 'Protección UV diaria obligatoria',        '☀️'),
('Tónico',          'Equilibrio y preparación del pH',         '✨'),
('Exfoliante',      'Renovación celular química y física',     '🌿')
ON CONFLICT DO NOTHING;

-- Productos (11 productos reales de skincare)
INSERT INTO productos (categoria_id, nombre, marca, precio, descripcion, tipos_piel) VALUES
(1, 'Gentle Foaming Cleanser',    'CeraVe',          62000,  'Limpiador suave con ceramidas para piel sensible',          'sensible,mixta,seca'),
(1, 'Salicylic Acid 2%',          'The Ordinary',    28000,  'Limpiador BHA para piel grasa y propensa al acné',          'grasa,mixta'),
(2, 'Sérum Vitamina C 10%',       'Sesderma',        95000,  'Ilumina manchas y unifica el tono de la piel',              'grasa,seca,mixta,sensible'),
(2, 'Hyaluronic Acid 2% + B5',    'The Ordinary',    32000,  'Hidratación profunda con ácido hialurónico multi-peso',     'seca,mixta,sensible'),
(2, 'Niacinamide 10% + Zinc 1%',  'The Ordinary',    30000,  'Reduce poros visibles y controla exceso de sebo',           'grasa,mixta'),
(3, 'Moisturizing Cream',         'CeraVe',          55000,  'Hidratante reparadora con ceramidas',                       'seca,sensible,mixta'),
(3, 'Gel-Crema Hidratante',       'Neutrogena',      45000,  'Textura gel ligera, oil-free y no comedogénica',            'grasa,mixta'),
(4, 'Oil-Free SPF 50+',           'Heliocare',       78000,  'Protector solar sin aceites ideal para piel grasa',         'grasa,mixta'),
(4, 'Sunscreen Mineral SPF 30',   'La Roche-Posay',  89000,  'Protector mineral suave para piel sensible',                'sensible,seca'),
(5, 'Rose Water Toner',           'Mario Badescu',   42000,  'Tónico calmante con agua de rosas y aloe vera',             'sensible,seca'),
(5, 'BHA Liquid Exfoliant 2%',    'Paula''s Choice', 110000, 'Exfoliante químico BHA para desobstruir poros',             'grasa,mixta')
ON CONFLICT DO NOTHING;

-- Usuarios de prueba
-- NOTA: En esta versión el password se guarda como texto plano para simplicidad.
-- En producción se usaría BCrypt.
INSERT INTO usuarios (nombre, email, password_hash, rol) VALUES
('Adriana Carreño', 'admin@glowlab.co', 'admin123', 'ADMIN'),
('Sary Ariza',      'user@glowlab.co',  'user123',  'USER')
ON CONFLICT DO NOTHING;