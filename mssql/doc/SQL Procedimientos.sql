
/* crear usuario */
    CREATE PROCEDURE proc_user_create(
        @email varchar(80),
        @password varchar(50),
        @token varchar(15),

        @firstName varchar(50),
        @lastName varchar(50),
        @dateOfBirth date
    )
    AS
        INSERT INTO tbl_user(email, password, token)
        VALUES (@email, @password, @token);

        INSERT INTO tbl_profile(firstName, lastName, dateOfBirth, fk_user)
        VALUES (@firstName, @lastName, @dateOfBirth, ( SELECT SCOPE_IDENTITY() ));
    GO

    EXEC proc_user_create 
        @email = 'var_email',
        @password = 'var_password',
        @token = 'var_token',

        @firstName = 'var_firstName',
        @lastName = 'var_lastName',
        @dateOfBirth = '2022/06/08'
    ;
/* crear usuario */

/* Actualizar contraseña */
    CREATE PROCEDURE proc_user_update_pass(
        @id int,
        @password varchar(50),
        @token varchar(15)
    )
    AS
        UPDATE tbl_user SET 
            password = @password,
            token    = @token
        WHERE id = @id;
    GO

    EXEC proc_user_update_pass
        @id = 1,
        @password = 'nuevaPass',
        @token = 'NuevoToken'
    ;
/* Actualizar contraseña */

/* Actualizar usuario */
    CREATE PROCEDURE proc_user_update(
        @id int,
        @firstName varchar(50),
        @lastName varchar(50),
        @dateOfBirth date
    )
    AS
        UPDATE tbl_profile SET 
            firstName   = @firstName,
            lastName    = @lastName,
            dateOfBirth = @dateOfBirth
        WHERE fk_user=@id;
    GO

    EXEC proc_user_update
        @id         = 1,
        @firstName  = 'newName',
        @lastName   = 'NewLast',
        @dateOfBirth= '1996/02/05'
    ;
/* Actualizar usuario */

/* Crear categoria */
    CREATE PROCEDURE proc_category_create(
        @id int,
        @name varchar(50)
    )
    AS
        INSERT INTO tbl_category_list (name, fk_user)
        VALUES (@name, @id)
    GO

    EXEC proc_category_create
        @id = 1, 
        @name = 'Hogar'
    ;
    EXEC proc_category_create
        @id = 1, 
        @name = 'Escuela'
    ;
/* Crear categoria */

/* Actualizar categoria */
    CREATE PROCEDURE proc_category_update(
        @id int,
        @name varchar(50)
    )
    AS
        UPDATE tbl_category_list SET 
            name = @name
        WHERE id = @id;
    GO

    EXEC proc_category_update
        1, 
        'Hogar corregido 2'
    ;
/* Actualizar categoria */

/* Crear item */
    CREATE PROCEDURE proc_item_create(
        @id int,
        @title varchar(50),
        @detail varchar(100)
    )
    AS
        INSERT INTO tbl_items (title, detail, status, fk_category_list)
        VALUES (@title, @detail, 0, @id)
    GO

    EXEC proc_item_create
        @id = 1, 
        @title = 'titulo',
        @detail = 'Contenido'
    ;
/* Crear item */

/* Actualizar item */
    CREATE PROCEDURE proc_item_update(
        @id int,
        @title varchar(50),
        @detail varchar(100),
        @status char(1)
    )
    AS
        UPDATE tbl_items SET 
            title  = @title,
            detail = @detail,
            status = @status
        WHERE id = @id;
    GO

    EXEC proc_item_update
        @id     = 1, 
        @title  = 'titulo edit',
        @detail = 'Contenido edit',
        @status = 1
    ;
/* Actualizar item */

/* Eliminar item */
    CREATE PROCEDURE proc_item_delete(
        @id int
    )
    AS
        DELETE FROM tbl_items 
        WHERE id = @id;
    GO

    EXEC proc_item_delete
        @id = 1
    ;
/* Eliminar item */

/* Eliminar category */
    CREATE PROCEDURE proc_category_delete(
        @id int
    )
    AS
        DELETE FROM tbl_category_list
        WHERE id = @id;
    GO

    EXEC proc_category_delete
        @id = 1
    ;
/* Eliminar category */

/* Eliminar user */
    CREATE PROCEDURE proc_user_delete(
        @id int
    )
    AS
        DELETE FROM tbl_user
        WHERE id = @id;
    GO

    EXEC proc_user_delete
        @id = 1
    ;
/* Eliminar user */

/* Seleccionar Item por id */
    CREATE PROCEDURE proc_item_select_by_id(
        @id int
    )
    AS
        SELECT * FROM tbl_items 
        WHERE id = @id;
    GO

    EXEC proc_item_select_by_id
        @id = 1
    ;
/* Seleccionar Item por id */

/* Seleccionar Item por Categoria */
    CREATE PROCEDURE proc_item_select_by_category_id(
        @id int
    )
    AS
        SELECT * FROM tbl_items 
        WHERE fk_category_list = @id;
    GO

    EXEC proc_item_select_by_category_id
        @id = 1
    ;
/* Seleccionar Item por Categoria */

/* Seleccionar Categoria por id */
    CREATE PROCEDURE proc_category_select_by_id(
        @id int
    )
    AS
        SELECT * FROM tbl_category_list
        WHERE id = @id;
    GO

    EXEC proc_category_select_by_id
        @id = 1
    ;
/* Seleccionar Categoria por id */

/* Seleccionar Categoria por usuario */
    CREATE PROCEDURE proc_category_select_by_user_id(
        @id int
    )
    AS
        SELECT * FROM tbl_category_list
        WHERE fk_user = @id;
    GO

    EXEC proc_category_select_by_user_id
        @id = 1
    ;
/* Seleccionar Categoria por usuario */

/* Seleccionar perfil usuario */
    CREATE PROCEDURE proc_profile_by_id(
        @id int
    )
    AS
        SELECT * FROM tbl_profile
        WHERE fk_user = @id;
    GO

    EXEC proc_profile_by_id
        @id = 1
    ;
/* Seleccionar perfil usuario */

/* Seleccionar usuario */
    CREATE PROCEDURE proc_user_by_email(
        @email varchar(80)
    )
    AS
        SELECT * FROM tbl_user
        WHERE email = @email;
    GO

    EXEC proc_user_by_email
        @email = 'gmonge@email.com'
    ;
/* Seleccionar usuario */
