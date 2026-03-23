/*
Es vol crear un nou programa de fidelitat per a l’empresa amb els seus clients.
En el moment en què un nou client és donat d'alta,
el sistema ha d'enregistrar-lo automàticament al programa i
assignar-li un codi de soci únic amb el format JARD-XXXXXX (per exemple, JARD-042817).
Igual que passa amb les referències de pagament, dos altes simultànies
podrien generar el mateix número aleatori, de manera que el sistema
ha de reintentar fins a obtenir un codi que no estigui ja en ús.
Si el client gasta més de 2000 euros serà bronze, si gasta més de 5000 serà plata,
si gasta més de 10000 serà or i, amb més de 20000 serà diamant.
*/

CREATE TABLE fidelitat(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    codigo_cliente INTEGER NOT NULL,
    nombre_cliente VARCHAR(150) NOT NULL,
    codi_soci VARCHAR(11) NOT NULL, 
    rango VARCHAR(50) NOT NULL DEFAULT 'HIERRO'
);

DELIMITER $$

CREATE TRIGGER
BEFORE INSERT ON cliente
FOR EACH ROW
BEGIN

    DECLARE numero_codi_soci VARCHAR(6) DEFAULT '000000';
    DECLARE numero_random INTEGER DEFAULT FLOOR(RAND() * (999999 - 0 + 1) + 0);

    SET numero_codi_soci = RIGHT(CONCAT('000000', numero_random), 6);

    INSERT INTO fidelitat (codigo_cliente, nombre_cliente, codi_soci)
    VALUES (NEW.codigo_cliente, NEW.nombre_cliente, CONCAT('JARD-', numero_codi_soci));

END$$

DELIMITER ;