/*
L'equip comercial de jardineria rep cada dia noves comandes que poden trigar setmanes a lliurar-se.
Perquè cap comanda quedi oblidada, quan s'enregistra un nou pedido amb estat Pendiente,
el sistema ha de programar automàticament un recordatori de seguiment per a cada setmana completa
que hi ha entre la data de la comanda i la data d'entrega prevista. Cada recordatori indica el
número de setmana i la data exacta de seguiment, i el responsable el veurà al seu calendari d'activitats.
*/

CREATE TABLE recordetoris_pedidos(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    numero_de_setmana INTEGER DEFAULT 0,
    fecha_pedido DATE
);

DELIMITER $$

CREATE TRIGGER inserta_recordatoris
AFTER INSERT ON pedido
FOR EACH ROW
BEGIN

    DECLARE setmana INTEGER DEFAULT 0;
    DECLARE fecha DATE;
    
    IF NEW.estado = 'Pendiente' THEN
        
        SET fecha = NEW.fecha_pedido;

        WHILE NEW.fecha_entrega > fecha DO

            SET setmana = setmana + 1;
            SET fecha = DATE_ADD(fecha, INTERVAL 7 DAY);

            INSERT INTO recordetoris_pedidos (numero_de_setmana, fecha_pedido)
            VALUES (setmana, fecha);

        END WHILE;

    END IF;

END $$

CREATE TRIGGER actualitza_recordatoris
BEFORE UPDATE ON pedido
FOR EACH ROW
BEGIN

    DECLARE setmana INTEGER DEFAULT 0;
    DECLARE fecha DATE;
    
    IF NEW.estado = 'Pendiente' THEN
        
        SET fecha = NEW.fecha_pedido;

        WHILE NEW.fecha_entrega > fecha DO

            SET setmana = setmana + 1;
            SET fecha = DATE_ADD(fecha, INTERVAL 7 DAY);

            INSERT INTO recordetoris_pedidos (numero_de_setmana, fecha_pedido)
            VALUES (setmana, fecha);

        END WHILE;

    END IF;
    
END $$

DELIMITER ;