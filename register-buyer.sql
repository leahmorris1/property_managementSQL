use property_management2;

INSERT INTO buyer (name, email, phone)
SELECT 'Dwight Schrute', 'dwightschrute@email.com', '123-456-7890'
WHERE NOT EXISTS (
  SELECT * FROM seller
  WHERE name = 'Dwight Schrute'
  AND email = 'dwightschrute@email.com'
  AND phone = '123-456-7890'
);