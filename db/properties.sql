DROP TABLE IF EXISTS properties;

CREATE TABLE properties(
  id SERIAL PRIMARY KEY,
  address VARCHAR,
  value INT,
  num_of_rooms INT,
  year_built INT,
  buy_or_let VARCHAR,
  area INT,
  build_type VARCHAR
);
