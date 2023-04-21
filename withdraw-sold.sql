use property_management2;

DELIMITER //

CREATE PROCEDURE withdrawProperty(IN paramID INT)
BEGIN
DECLARE pstatus VARCHAR(50); -- Declare a variable to store property status
     DECLARE checkExist INT;
  SELECT COUNT(*) INTO checkExist FROM property WHERE property_ID = paramID;
--     -- Get property status
     SELECT status INTO pstatus FROM property WHERE property_id = paramID;
--
 IF checkExist = 1 THEN
 IF pstatus = 'SOLD' THEN
   SELECT 'Property is already sold' AS 'Reason', 406 AS 'Status' FROM property WHERE  property_id = paramID;
 ELSE
 UPDATE property 
 SET 
     status = 'WITHDRAWN'
 WHERE
     property_id = paramID; 
     END IF;
  ELSE
               SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This property does not exist.';
       SELECT 'Property does not exist' AS 'Reason', 406 AS 'Status';

      END IF; 


 END //

 DELIMITER ;
 
 CALL withdrawProperty(33);