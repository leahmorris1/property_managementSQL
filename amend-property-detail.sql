use property_management2;
UPDATE property
SET address = '125 Main St', postcode = 'AB7 20E', price = 200000
WHERE property_id = 21 AND status = 'FOR SALE';