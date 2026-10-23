-- 1. ELIMINAR Y RECREAR EL DISPARADOR PARA NUEVOS REGISTROS
DROP TRIGGER IF EXISTS verificar_alomorfos_duplicados;

CREATE TRIGGER verificar_alomorfos_duplicados
BEFORE INSERT ON vocabulario
FOR EACH ROW
BEGIN
    -- [NUEVO] Validación 0: Evitar que 'palabra' y 'alomorfos' choquen en la misma fila
    SELECT RAISE(ABORT, '¡Error! La palabra no puede ser igual a uno de sus propios alomorfos.')
    WHERE ', ' || NEW.alomorfos || ',' LIKE '%, ' || NEW.palabra || ',%';

    -- Validación 1: Alomorfos nuevos vs Palabras existentes
    SELECT RAISE(ABORT, '¡Error! Uno de los alomorfos ingresados ya existe en la columna "palabra".')
    WHERE EXISTS (
        SELECT 1 FROM vocabulario 
        WHERE ', ' || NEW.alomorfos || ',' LIKE '%, ' || palabra || ',%'
    );

    -- Validación 2: Nueva palabra vs Alomorfos existentes
    SELECT RAISE(ABORT, '¡Error! La palabra ingresada ya existe como un alomorfo en otro registro.')
    WHERE EXISTS (
        SELECT 1 FROM vocabulario 
        WHERE ', ' || alomorfos || ',' LIKE '%, ' || NEW.palabra || ',%'
    );

    -- Validación 3: Alomorfos nuevos vs Alomorfos existentes
    SELECT RAISE(ABORT, '¡Error! Uno de los alomorfos ingresados ya está registrado en los alomorfos de otra fila.')
    WHERE EXISTS (
        SELECT 1 FROM vocabulario 
        WHERE alomorfos IS NOT NULL 
          AND NEW.alomorfos IS NOT NULL
          AND (
               ', ' || NEW.alomorfos || ',' LIKE '%, ' || alomorfos || ',%'
               OR 
               ', ' || alomorfos || ',' LIKE '%, ' || NEW.alomorfos || ',%'
          )
    );
END;

-- 2. ELIMINAR Y RECREAR EL DISPARADOR PARA REGISTROS EDITADOS
DROP TRIGGER IF EXISTS verificar_alomorfos_duplicados_update;

CREATE TRIGGER verificar_alomorfos_duplicados_update
BEFORE UPDATE OF palabra, alomorfos ON vocabulario
FOR EACH ROW
BEGIN
    -- [NUEVO] Validación 0: Evitar que 'palabra' y 'alomorfos' choquen en la misma fila al editar
    SELECT RAISE(ABORT, '¡Error! La palabra no puede ser igual a uno de sus propios alomorfos.')
    WHERE ', ' || NEW.alomorfos || ',' LIKE '%, ' || NEW.palabra || ',%';

    -- Validación 1: Alomorfos modificados vs Palabras existentes
    SELECT RAISE(ABORT, '¡Error! Uno de los alomorfos modificados ya existe en la columna "palabra".')
    WHERE EXISTS (
        SELECT 1 FROM vocabulario 
        WHERE rowid != OLD.rowid
          AND ', ' || NEW.alomorfos || ',' LIKE '%, ' || palabra || ',%'
    );

    -- Validación 2: Palabra modificada vs Alomorfos existentes
    SELECT RAISE(ABORT, '¡Error! La palabra modificada ya existe como un alomorfo en otro registro.')
    WHERE EXISTS (
        SELECT 1 FROM vocabulario 
        WHERE rowid != OLD.rowid
          AND ', ' || alomorfos || ',' LIKE '%, ' || NEW.palabra || ',%'
    );

    -- Validación 3: Alomorfos modificados vs Alomorfos existentes
    SELECT RAISE(ABORT, '¡Error! Uno de los alomorfos modificados ya está registrado en los alomorfos de otra fila.')
    WHERE EXISTS (
        SELECT 1 FROM vocabulario 
        WHERE rowid != OLD.rowid
          AND alomorfos IS NOT NULL 
          AND NEW.alomorfos IS NOT NULL
          AND (
               ', ' || NEW.alomorfos || ',' LIKE '%, ' || alomorfos || ',%'
               OR 
               ', ' || alomorfos || ',' LIKE '%, ' || NEW.alomorfos || ',%'
          )
    );
END;
