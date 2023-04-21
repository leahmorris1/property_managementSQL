use property_management2;

-- to check that if a slot and agent are available
-- if no active viewing exists 
-- if property status is FOR SALE
-- if buyer is registered
-- if a viewing is requested
SELECT COUNT(*) 
FROM viewing 
INNER JOIN property ON viewing.property_id = property.property_id 
WHERE property.property_id = 28
AND property.status = 'FOR SALE' 
AND viewing.viewing_time = '2023-05-06 13:00:00'
AND viewing.agent_id = 20
AND viewing.buyer_id IN (SELECT buyer_id FROM buyer WHERE name = 'Bob Johnson' AND email = 'bob.johnson@example.com' AND phone = '555-9012')
AND NOT EXISTS (
    SELECT * FROM viewing 
    WHERE viewing.property_id = property.property_id 
    AND viewing.viewing_time = '2023-05-06 13:00:00'
    AND viewing.agent_id = 20
    -- AND viewing.viewing_id <> <viewing_id> -- exclude the current viewing if updating
)
