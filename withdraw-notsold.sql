use property_management2;
UPDATE property
SET status = 'WITHDRAWN'
WHERE property_id = 22 AND status != 'FOR SALE';