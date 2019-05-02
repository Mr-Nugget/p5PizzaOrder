CREATE TABLE users(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  mail VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  role VARCHAR(50) NOT NULL,

  restaurant_id BIGINT REFERENCES restaurant(id)
);

CREATE TABLE restaurant(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  code BIGINT NOT NULL
);

CREATE TABLE ingredient_category(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  label VARCHAR(50) NOT NULL,
  description TEXT
);

CREATE TABLE ingredient(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(50) NOT NULL,
  stock BIGINT NOT NULL,

  category_id BIGINT REFERENCES ingredient_category(id)
);

CREATE TABLE produit_category(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  label VARCHAR(50) NOT NULL,
  description TEXT
);

CREATE TABLE produit(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(50) NOT NULL,
  price NUMERIC(2,2) NOT NULL,
  size INT,
  description TEXT,

  category_id BIGINT REFERENCES produit_category(id)
);

CREATE TABLE ingredient_quantity(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  quantity BIGINT,

  produit_id BIGINT REFERENCES produit(id),
  ingredient_id BIGINT REFERENCES ingredient(id)
);

CREATE TABLE order(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  paid BOOLEAN NOT NULL,
  status VARCHAR(50) NOT NULL,
  orderHour DATE NOT NULL,
  receptionHour DATE NOT NULL,

  restaurant_id BIGINT REFERENCES restaurant(id) NOT NULL,
  customer_id BIGINT REFERENCES users(id),
  worker_id BIGINT REFERENCES users(id)
);

CREATE TABLE produit_quantity_order(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  quantity BIGINT,

  produit_id BIGINT REFERENCES produit(id),
  order_id BIGINT REFERENCES order(id)
);

CREATE TABLE basket(
  id BIGSERIAL PRIMARY KEY NOT NULL,

  customer_id BIGINT REFERENCES users(id)
);

CREATE TABLE ingredient_quantity_basket(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  quantity BIGINT,

  produit_id BIGINT REFERENCES produit(id),
  basket_id BIGINT REFERENCES basket(id)
);
