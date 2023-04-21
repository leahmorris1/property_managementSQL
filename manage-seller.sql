use property_management2;

INSERT INTO seller (name, email, phone)
SELECT 'Pam Beesley', 'pambeesley@email.com', '123-456-7890'
WHERE NOT EXISTS (
  SELECT * FROM seller
  WHERE name = 'Pam Beesley'
  AND email = 'pambeesley@email.com'
  AND phone = '123-456-7890'
);
