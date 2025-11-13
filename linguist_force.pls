-- linguist_force.psl
-- Archivo creado para asegurar que GitHub identifique este repositorio como SQL.
-- schema.pls
-- Archivo para activar detección de lenguaje PLSQL

CREATE TABLE ejemplo_linguist (
    id NUMBER,
    descripcion VARCHAR2(100)
);

INSERT INTO ejemplo_linguist VALUES (1, 'Test');
INSERT INTO ejemplo_linguist VALUES (2, 'Lenguaje PLSQL detectado por GitHub');

BEGIN
    DBMS_OUTPUT.PUT_LINE('PLSQL activo en GitHub');
END;
/
