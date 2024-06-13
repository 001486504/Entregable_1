CREATE LOGIN admin1 with password ='123456'
go 
create user admin1 for login admin21
go

/*01
Obtener todos los empleados que se dieron de alta antes del año 2018 y que
pertenecen a un determinado departamento. Además, utilizando los comandos
DCL.*/
DECLARE @fecha_fin datetime = '2018-01-01';

SELECT Fecha_Alta, ID_Departamento
FROM Empleado
WHERE Fecha_Alta < @fecha_fin

/*02 
Crear un procedimiento almacenado que permita insertar un nuevo departamento.*/
INSERT INTO Departamento(ID_departamento, Nombre_Departamento, Ubicacion )
VALUES ('5', 'ADMINISTRACION', 'INDIANA')

/*03
crear un procedimiento que recupere el promedio de edad de las personas por
cada departamento.*/
    -- Crear una tabla temporal para almacenar los resultados
    CREATE TABLE #PromedioPorDepartamento (
        Departamento VARCHAR(50),
        PromedioEdad FLOAT
    )

    -- Insertar los datos calculados en la tabla temporal
    INSERT INTO #PromedioPorDepartamento (Departamento, PromedioEdad)
    SELECT Fecha_Nac, AVG(S) AS PromedioEdad
    FROM Enfermo
    GROUP BY Fecha_Nac

    -- Mostrar los resultados
    SELECT * FROM #PromedioPorDepartamento

    -- Eliminar la tabla temporal
    DROP TABLE #PromedioPorDepartamento

/*04
Crear un procedimiento para devolver el apellido, oficio y salario, pasándole como
parámetro el número del empleado.*/
DECLARE @ID_Empleado int

SELECT Nombre_Empleado, Oficio, Salario
FROM Empleado
WHERE ID_Empleado = @ID_Empleado
GROUP BY Nombre_Empleado, Oficio, Salario

/*05
Crear un procedimiento almacenado para dar de baja a un empleado pasándole
como parámetro su apellido.*/
DECLARE @ID_Empleados INT
DECLARE @Nombre_Empleado VARCHAR(100)

    -- Buscar el número de empleado basado en el apellido proporcionado
    SELECT @ID_Empleado = @ID_Empleados
    FROM Empleado
    WHERE Nombre_Empleado = @Nombre_Empleado

    -- Verificar si se encontró un empleado con ese apellido
    IF @ID_Empleado IS NOT NULL
    BEGIN
        -- Dar de baja al empleado
        DELETE FROM Empleado
        WHERE ID_Empleado = @ID_Empleado;
	END
----------------------------------------------------------------
----------------------------------------------------------------
	SELECT *
	FROM Empleado
	REVOKE SELECT ON Empleado FROM admin21;