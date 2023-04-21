use property_management2;
UPDATE property
SET status = 'FOR SALE'
WHERE property_id = 22 AND status = 'WITHDRAWN';