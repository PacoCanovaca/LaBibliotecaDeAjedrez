# Backlog del Proyecto -- Plataforma de Gestión de Libros de Ajedrez -- labibliotecadeajedrez

# Fase 0. Organización del proyecto

## 0.1 Planificar proyecto
-   Crear documento planificación (este).
-   Crear tablero en Trello e incluir fases del proyecto.

## 0.2 Crear repositorio

-   Crear repositorio GitHub.
-   Configurar `.gitignore`.
-   Redactar primera parte `README.md`.
-   Crear estructura básica (docs, spec y src)
-   Primer commit.

## 0.3 Definir el alcance del MVP (en un .md en docs)

-   Definir funcionalidades obligatorias.
-   Definir funcionalidades fuera del MVP.
-   Definir criterios de éxito.


------------------------------------------------------------------------

# Fase 1. Análisis y diseño

## 1.1 Análisis de requisitos (desarrollar el .md de la tarea 0.3)

### Desarrollar requisitos funcionales con su explicación

-   Registro
-   Login
-   Buscar libros
-   Ver información de un libro
-   Añadir favorito
-   Quitar favorito
-   Ver favoritos

### Desarrollar requisitos no funcionales (transversales, deben desarrollarse incluyen en cada uno los requisitos funcionales donde se usan)

-   Conexión a API REST
-   Contraseñas cifradas
-   JWT
-   Conexión a PostgreSQL
-   Responsive básico

## 1.2 Diseño de la base de datos (en una carpeta concreta en docs)

### Modelo entidad-relación

-   Users
-   Books
-   Authors
-   Publishers
-   PurchaseLinks
-   Favorites
-   ProfileImages

### Diseño Lógico-Relacional

-   Usuario ↔ Favoritos
-   Libro ↔ Favoritos
-   Libro ↔ Enlaces

### Tipos de datos (verificar y explicar en un documento .md)

-   PK
-   FK
-   Índices
-   Restricciones

## 1.3 Diseño de la API (en un .md en docs)

### Endpoints Usuarios

-   POST /register
-   POST /login
-   GET /me

### Endpoints Libros

-   GET /books
-   GET /books/:id

### Endpoints Favoritos

-   GET /favorites
-   POST /favorites
-   DELETE /favorites/:id

Definir parámetros, cuerpos, respuestas y errores.

## 1.4 Preparar la documentación para OpenCode

-   Crear `AGENTS.md`
-   Rellenar archivos /spec/constitution
-   Definir features en /spec/features

------------------------------------------------------------------------

# Fase 2. Configuración del entorno

## 2.1 Backend

-   Inicializar Node
-   Instalar Express
-   Configurar dotenv
-   Configurar nodemon

## 2.2 Base de datos

-   Instalar PostgreSQL
-   Crear base de datos
-   Crear usuario
-   Configurar conexión

## 2.3 Dependencias

-   express
-   pg
-   bcrypt
-   jsonwebtoken
-   dotenv
-   cors
-   nodemon (desarrollo)

## 2.4 Estructura del proyecto

-   controllers
-   routes
-   middlewares
-   models
-   config
-   services
-   utils

------------------------------------------------------------------------

# Fase 3. Desarrollo de la base de datos

## 3.1 Crear tablas

-   Users
-   Books
-   PurchaseLinks
-   Favorites

## 3.2 Crear relaciones

-   Claves foráneas
-   Restricciones

## 3.3 Datos iniciales

-   Insertar primeros libros

## 3.4 Scripts SQL

-   schema.sql
-   seed.sql

------------------------------------------------------------------------

# Fase 4. Desarrollo del backend

## 4.1 Configuración del servidor

-   Express
-   Middleware
-   Rutas
-   Error handler

## 4.2 Autenticación

### Registro

-   Validar datos
-   Hash de contraseña
-   Guardar usuario

### Login

-   Comprobar contraseña
-   Generar JWT

### Middleware JWT

-   Verificar token

## 4.3 API de libros

-   GET libros
-   GET libro por ID

## 4.4 API de favoritos

-   Añadir favorito
-   Eliminar favorito
-   Obtener favoritos

## 4.5 Validaciones

-   Campos obligatorios
-   Formato email
-   Longitud contraseña

## 4.6 Manejo de errores

-   400
-   401
-   404
-   500

------------------------------------------------------------------------

# Fase 5. Desarrollo del frontend

## 5.1 HTML

-   Inicio
-   Login
-   Registro
-   Favoritos
-   Detalle de libro

## 5.2 CSS

-   Layout
-   Responsive
-   Componentes

## 5.3 JavaScript

-   Consumo de API
-   Gestión JWT
-   LocalStorage
-   Mostrar errores
-   Cerrar sesión

## 5.4 Pantalla de libros

-   Listado
-   Detalle

## 5.5 Pantalla de favoritos

-   Mostrar favoritos
-   Eliminar favoritos

------------------------------------------------------------------------

# Fase 6. Integración

## 6.1 Conectar frontend y backend

-   Comprobar endpoints
-   Gestionar errores

## 6.2 Flujo completo

-   Registro
-   Login
-   Token
-   Buscar libro
-   Guardar favorito
-   Ver favoritos

------------------------------------------------------------------------

# Fase 7. Testing

## 7.1 Backend

-   Probar endpoints
-   Casos de error
-   JWT

## 7.2 Frontend

-   Navegación
-   Formularios
-   Errores

## 7.3 Integración

-   Probar flujo completo

------------------------------------------------------------------------

# Fase 8. Documentación

## 8.1 README COMPLETO

-   Descripción
-   Tecnologías
-   Instalación
-   Uso
-   Capturas
-   Roadmap

## 8.2 Documentación técnica

-   Arquitectura
-   Modelo de datos
-   API

## 8.3 Mejoras futuras

-   Sistema de puntuaciones
-   Comentarios
-   Filtros
-   Búsqueda avanzada
-   Roles
-   Docker
-   Deploy

------------------------------------------------------------------------

# Fase 9. Despliegue (opcional)

-   Backend
-   Frontend
-   Base de datos
-   Variables de entorno
-   Pruebas en producción

------------------------------------------------------------------------

# Backlog futuro

-   Valoraciones
-   Comentarios
-   Libros leídos / leyendo / pendientes
-   Autores
-   Editoriales
-   Categorías
-   Etiquetas
-   Búsqueda avanzada
-   Panel de administración
-   CRUD de libros
-   Importación CSV
-   API pública
-   Docker
-   CI/CD
-   Tests automatizados
-   Paginación
-   Caché
-   Swagger
