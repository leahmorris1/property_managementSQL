use property_management2;

DELIMITER //

CREATE PROCEDURE sellProperty(IN paramID INT)
BEGIN
  DECLARE pstatus VARCHAR(50); -- Declare a variable to store property status
  SELECT status INTO pstatus FROM property WHERE property_id = paramID;
  IF pstatus = 'SOLD' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Property is already sold';
  END IF;
END //

DELIMITER ;
