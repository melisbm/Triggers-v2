/*
Quan l’empresa de jardineria incorpora un nou client,
la política comercial estableix que s'ha de programar
un pla de revisions per als propers 2 anys, amb una
reunió per trimestre (8 trimestres en total). Per a
cada trimestre, es planifiquen 3 tipus de reunió:
comercial (tipus 1), tècnica (tipus 2) i financera
(tipus 3). El trigger ha de crear automàticament les
24 entrades del pla (8 trimestres × 3 tipus) en el
moment en què el client és donat d'alta al sistema.
*/

CREATE TABLE reunions(
    id PRIMARY KEY AUTO_INCREMENT,
    tipus ENUM('comercial', 'tècnica', 'financiera'),
    date_reunio DATE
    
);


DELIMITER $$

CREATE TRIGGER
BEFORE INSERT ON
FOR EACH ROW
BEGIN
END$$

DELIMITER ;