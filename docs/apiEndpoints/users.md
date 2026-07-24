## POST /register
Registra un nuevo usuario en la base de datos. La contraseña recibida debe ser cifrada (hashing) antes de ejecutar el `INSERT` en PostgreSQL.
- **Params**: no hay
- **Body**: 
{
  "username": "user_1",
  "email": "user1@ejemplo.com",
  "password": "mySafePassword123"
}
- **Resp/errors**:
    201. Created. El usuario se ha creado correctamente. El cuerpo será:
        {
            "message": "Usuario registrado con éxito",
            "user": {
                "id": 1,
                "username": "user_1",
                "email": "user1@ejemplo.com",
                "image_id": null
            }
        }
    400. Bad Request. Faltan campos obligatorios en el body o los datos enviados no cumplen las restricciones (en este caso la restricción del usuario o del email):
        { error: "Faltan campos obligatorios" }
    409. Conflict. Puede ocurrir por un conflicto de versiones, pero lo normal en este caso es que se vulnere la unicidad del username o del email:
        { error: "El email o nombre de usuario ya está en uso" }
    500. Internal Server Error. Se utilizará de manera genérica cuando ocurra un error que no cumpla con los anteriormente mencionados:
        { error: "Error interno del servidor" }

## POST /login
Autentica a un usuario previamente registrado. El servidor debe buscar el email en la base de datos, comparar la contraseña recibida con la contraseña cifrada almacenada y, si coinciden, generar y devolver un token JWT (JSON Web Token).
- **Params**: no hay
- **Body**: 
{
  "email": "user1@ejemplo.com",
  "password": "mySafePassword123"
}
- **Resp/errors**:
    200. OK. El usuario se ha autenticado correctamente. El servidor devuelve el token JWT que el frontend deberá almacenar. El cuerpo será:
        { 
            "message": "Login exitoso", 
            "token": "eyJhbGciOiJIUzI1NiIsInR5c...", 
            "user": 
            { 
                "id": 1, "username": "user_1", "email": "user1@ejemplo.com" 
            } 
        }
    400. Bad Request. Faltan campos obligatorios en el body:
        { "error": "Por favor, proporciona email y contraseña" }
    401. Unauthorized. Credenciales inválidas. Esto ocurre si el correo no existe en la base de datos o si la contraseña es incorrecta:
        { "error": "Credenciales incorrectas" }
    500. Internal Server Error. Se utilizará de manera genérica cuando ocurra un error que no cumpla con los anteriormente mencionados:
        { error: "Error interno del servidor" }

## GET /me
Obtiene la información detallada y privada del usuario actualmente autenticado. No recibe datos en el cuerpo, sino que el servidor lee el token JWT desde las cabeceras HTTP de la petición, lo descifra, extrae el ID del usuario y consulta sus datos actualizados en la base de datos PostgreSQL.
- **Params**: no hay
- **Headers** (en el frontend): `Authorization: Bearer <token_jwt>`
- **Body**: no hay
- **Resp/errors**:
    200. OK. El token es válido y se devuelven los datos del usuario. El cuerpo será:
        { 
            "id": 1, 
            "username": "user_1", 
            "email": "user1@ejemplo.com", 
            "image_url": "https://supabase.com/storage/v1/object/public/avatars/foto.jpg" 
        }
    401. Unauthorized. El cliente no ha enviado ningún token en las cabeceras, el formato es incorrecto, el token ha expirado o la firma criptográfica ha sido manipulada:
        { "error": "Acceso denegado. Token no proporcionado o inválido." }
    500. Internal Server Error. Se utilizará de manera genérica cuando ocurra un error que no cumpla con los anteriormente mencionados:
        { error: "Error interno del servidor" }

## PATCH /me
Actualiza los datos permitidos del usuario autenticado (imagen de perfil y/o contraseña). Los campos username y email están bloqueados y el servidor los ignorará si se envían. La identidad del usuario se extrae directamente del token JWT. En caso de haber modificado la contraseña, esta deberá ser cifrada de nuevo mediante hashing antes de introducirla en la base de datos.
- **Params**: no hay
- **Headers** (en el frontend): `Authorization: Bearer <token_jwt>`
- **Body**: Los campos son opcionales, permitiendo enviar solo el que se desee modificar.
{ 
    "password": "newSafePassword456", 
    "image_id": 3 
}
- **Resp/errors**:
    200. OK. Los datos se han actualizado correctamente. El cuerpo devolverá el usuario actualizado:
        {  
            "message": "Perfil actualizado con éxito",  
            "user": {  
                "id": 1,  
                "username": "user_1",  
                "email": "user1@ejemplo.com",  
                "image_id": 3  
            }  
        }
    400. Bad Request. El cuerpo de la petición está vacío o los datos enviados no tienen el formato correcto (por ejemplo, enviar texto en lugar de un número para el image_id).
        { "error": "Datos inválidos para la actualización" }
    401. Unauthorized. El cliente no ha enviado ningún token en las cabeceras, el formato es incorrecto, el token ha expirado o la firma criptográfica ha sido manipulada:
        { "error": "Acceso denegado. Token no proporcionado o inválido." }
    500. Internal Server Error. Se utilizará de manera genérica cuando ocurra un error que no cumpla con los anteriormente mencionados:
        { error: "Error interno del servidor" }


## DELETE /me
Elimina permanentemente la cuenta del usuario autenticado de la base de datos. La identidad se extrae del token JWT. Gracias a las restricciones de integridad referencial configuradas previamente, todos los datos dependientes de este usuario se eliminarán en cascada.
- **Params**: no hay
- **Headers** (en el frontend): `Authorization: Bearer <token_jwt>`
- **Body**: no hay
- **Resp/errors**:
    200. OK. La cuenta y sus datos asociados se han eliminado correctamente de la plataforma. El cuerpo será:
        { "message": "Cuenta de usuario eliminada permanentemente" }
    401. Unauthorized. El cliente no ha enviado ningún token en las cabeceras, el formato es incorrecto, el token ha expirado o la firma criptográfica ha sido manipulada:
        { "error": "Acceso denegado. Token no proporcionado o inválido." }
    500. Internal Server Error. Se utilizará de manera genérica cuando ocurra un error que no cumpla con los anteriormente mencionados:
        { error: "Error interno del servidor" }