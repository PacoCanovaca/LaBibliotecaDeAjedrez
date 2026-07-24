# Requisitos del MVP

## Funcionalidades Obligatorias (MVP)

- Registro de usuarios: El sistema permitirá a los nuevos visitantes crear una cuenta personal proporcionando credenciales básicas como un usuario, un email y una contraseña. Esta funcionalidad incluye un cifrado de contraseña a la hora de incluir los datos en la base de datos. Puede incluir también un correo de confirmación de registro.
- Inicio de sesión (Login): Los usuarios registrados podrán acceder a su perfil autenticándose en el sistema mediante su usuario/correo y su contraseña. Deberá contemplar el cifrado de contraseña del registro a la hora de verificar la identidad. Además, esta funcionalidad usará el sistema JWT, generando un token para usar durante la sesión. 
- Búsqueda de libros: Se habilitará una barra de búsqueda que permita a los usuarios encontrar obras específicas mediante términos clave. De momento, la búsqueda se llevará a cabo sólo por nombre. Sirve el nombre completo del libro o del autor, o un fragmento (uno o varios caracteres) de cualquiera de los dos.
- Visualización de información detallada de un libro: Al seleccionar un título, el sistema abrirá una nueva pestaña con una vista dedicada que incluye los datos relevantes de la obra, tales como autor, sinopsis y enlaces de compra.
- Añadir un libro a favoritos: Tanto en el menú de búsqueda de la biblioteca como desde la vista de información del libro, el usuario podrá guardarlo en su colección personal mediante un botón específico (estrella). Esta acción vincula la obra al perfil del usuario, siendo el núcleo funcional para construir su biblioteca personalizada.
- Quitar un libro de favoritos: El sistema ofrecerá la opción de revertir la acción anterior, permitiendo al usuario eliminar un título de su lista si ya no desea conservarlo. Se hará desmarcando el mismo botón.
- Visualización de la lista de libros favoritos: Existirá un panel o sección privada (mi perfil) donde el usuario podrá consultar todas las obras que ha ido guardando. Este espacio actuará como su biblioteca personal definitiva, manteniendo sus libros de ajedrez favoritos siempre organizados y accesibles. También incluirá un panel de búsqueda como el del menú general.
- Modificar la imagen de perfil y la contraseña: Dentro del menú de perfil de usuario, habrá un área para la imagen de perfil, que permitirá ser añadida, modificada o eliminada. Existirán una serie de imágenes por defecto entre las que el usuario podrá elegir, no estando aún disponible la opción de subir una imagen personalizada. También se podrá modificar la contraseña.

## Funcionalidades tranversales

- Conexión a API REST: La comunicación entre el cliente (frontend) y el servidor (backend) se realizará mediante peticiones HTTP estandarizadas siguiendo los principios de la arquitectura REST.
- Contraseñas cifradas: Por motivos estrictos de seguridad, las credenciales de los usuarios nunca se almacenarán en texto plano en la base de datos, aplicando un algoritmo de hashing unidireccional (como bcrypt) antes de su guardado. Esta funcionalidad está presente en el registro y el login de usuarios.
- JWT (JSON Web Token): El sistema utilizará tokens firmados para gestionar la autenticación de manera stateless. Una vez el usuario se identifica correctamente, recibirá un token que deberá enviar en las cabeceras de sus futuras peticiones para demostrar que tiene permiso para ejecutar acciones privadas. Esta funcionalidad se utiliza tanto en el inicio de sesión (donde se genera el token) como en las acciones en las que el usuario interactúa con la base de datos (Añadir y quitar libros de favoritos y visualización de la lista de libros favoritos).
- Conexión a PostgreSQL: El almacenamiento persistente de los datos se gestionará a través de un sistema gestor de bases de datos relacional robusto (PostgreSQL), garantizando la integridad referencial entre usuarios, libros y enlaces.
- Responsive básico: La interfaz de usuario se construirá utilizando un diseño fluido que se adapte de forma correcta y legible a los diferentes tamaños de pantalla, garantizando que la plataforma se pueda usar cómodamente tanto en ordenador como en dispositivos móviles.

## Criterios de Éxito del MVP

- Los usuarios pueden registrarse e iniciar sesión exitosamente y de manera segura.
- La búsqueda de libros funciona correctamente, mostrando resultados relevantes y acordes a los parámetros introducidos.
- La visualización de la información detallada de un libro es clara y completa.
- Los usuarios pueden añadir y quitar libros de su lista de favoritos sin errores.
- La lista de favoritos se muestra correctamente y se actualiza en tiempo real.
- La aplicación es estable y no presenta errores críticos en las funcionalidades obligatorias.
- La interfaz de usuario es intuitiva y fácil de usar para las funcionalidades principales en distintos tamaños de pantalla.

## Funcionalidades Fuera del MVP

- Sistema de puntuaciones (valoraciones)
- Comentarios en libros
- Filtros de búsqueda avanzados
- Búsqueda avanzada
- Roles de usuario (administrador, etc.)
- Despliegue con Docker
- Despliegue en un entorno de producción
- Gestión de libros leídos / leyendo / pendientes
- Gestión de autores
- Gestión de editoriales
- Gestión de categorías
- Gestión de etiquetas
- Panel de administración
- CRUD completo de libros (crear, editar, eliminar)
- Importación de libros vía CSV
- API pública
- CI/CD
- Tests automatizados exhaustivos
- Paginación de resultados
- Caché
- Documentación Swagger/OpenAPI
