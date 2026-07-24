## users

-   **image_id (FK)**: `ON DELETE SET NULL`. Al no ser un campo `NOT NULL`, si la imagen de perfil referenciada es eliminada de la tabla `profile_images`, este campo pasará a tener un valor nulo, evitando que el usuario sea borrado o que la acción se bloquee.
-   **username**: `CHECK (char_length(username) >= 3)`. Impide la creación de nombres de usuario vacíos o excesivamente cortos.
-   **email**: `CHECK (email LIKE '%_@__%.__%')`. Actúa como última línea de defensa para asegurar que la cadena insertada contenga la estructura mínima de un correo electrónico.

## favorites

-   **user_id (FK)** y **book_id (FK)**: Ambos con `ON DELETE CASCADE`. Si un usuario elimina su cuenta, o si un administrador retira un libro del sistema, todas las relaciones de favoritos vinculadas a ellos se destruyen automáticamente, evitando acumular datos "fantasma" que ya no apuntan a ningún sitio.

## books

-   **publisher_id (FK)**: `ON DELETE RESTRICT`. Impide eliminar una editorial de la base de datos si esta ya tiene libros asociados en nuestro catálogo. Obliga a mantener la integridad de las obras publicadas.
-   **year**: `CHECK (year ~ '^[0-9]{4}$')`. Asegura que el año tenga exactamente 4 dígitos numéricos.

## authors

-   **birthyear**: `CHECK (birthyear ~ '^[0-9]{4}$')`. Asegura que el año de nacimiento tenga exactamente 4 dígitos numéricos.

## book_images y purchase_links

-   **book_id (FK)**: `ON DELETE CASCADE`. Las imágenes y los enlaces son entidades totalmente dependientes del libro. Si el libro se borra, sus enlaces e imágenes desaparecen con él.

## books_authors

-   **book_id (FK)**: `ON DELETE CASCADE`. Esta relación es dependiente del libro. Si se elimina la obra, se elimina su vinculación con el autor.
-   **author_id (FK)**: `ON DELETE RESTRICT`. Previene la eliminación de un autor por error si este todavía tiene obras registradas y visibles en la biblioteca.