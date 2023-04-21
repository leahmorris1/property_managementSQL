USE property_management2;

-- Create agent table
CREATE TABLE agent (
  agent_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone VARCHAR(20) NOT NULL
);

-- Create buyer table
CREATE TABLE buyer (
  buyer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone VARCHAR(20) NOT NULL
);

-- Create seller table
CREATE TABLE seller (
  seller_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone VARCHAR(20) NOT NULL
);

-- Create property table
CREATE TABLE property (
  property_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  address VARCHAR(150) UNIQUE,
  postcode VARCHAR(10),
  price INT NOT NULL,
  status ENUM('FOR SALE', 'SOLD', 'WITHDRAWN') DEFAULT 'FOR SALE',
  seller_id INT NOT NULL,
  FOREIGN KEY (seller_id) REFERENCES seller(seller_id)
);

-- Create viewing table
CREATE TABLE viewing (
  viewing_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  property_id INT NOT NULL,
  agent_id INT NOT NULL,
  buyer_id INT NOT NULL,
  viewing_time DATETIME NOT NULL,
  CONSTRAINT property_fk FOREIGN KEY (property_id) REFERENCES property(property_id),
  CONSTRAINT agent_fk FOREIGN KEY (agent_id) REFERENCES agent(agent_id),
  CONSTRAINT buyer_fk FOREIGN KEY (buyer_id) REFERENCES buyer(buyer_id)
);


