use property_management2;

DELIMITER //

CREATE PROCEDURE checkViewing(IN paramPropertyID INT, IN paramViewingTime DATETIME)
BEGIN
  DECLARE countRows INT;
  SELECT COUNT(*) INTO countRows FROM viewing WHERE property_id = paramPropertyID AND viewing_time = paramViewingTime;
  IF countRows > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Timeslot already taken';
  END IF;
END //

DELIMITER ;
