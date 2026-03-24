/*
El departament de comptabilitat necessita que cada cobrament quedi identificat
amb una referència interna única i traçable. Quan un nou pagament s'enregistra
amb el codi de transacció 'AUTO', el sistema ha de generar automàticament una
referència amb el format TXN-[ANY]-[XXXXXX] (per exemple, TXN-2025-047832). 
Com que dos pagaments simultanis podrien generar el mateix número aleatori,
el sistema ha de reintentar la generació fins que obtingui un codi que no
existeixi ja a la base de dades.
*/



DELIMITER $$

CREATE TRIGGER
BEFORE INSERT ON
FOR EACH ROW
BEGIN
END$$

DELIMITER ;