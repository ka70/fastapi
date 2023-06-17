CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(250),
    price FLOAT
);

INSERT INTO items (name, description, price) VALUES
('item1', 'This is item 1', 19.99),
('item2', 'This is item 2', 29.99),
('item3', 'This is item 3', 39.99);
