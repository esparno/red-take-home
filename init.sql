CREATE TABLE IF NOT EXISTS toppings (
	id serial,
	topping_name varchar(255),
	cost numeric(9,2),
	PRIMARY KEY( id )
);

CREATE TABLE IF NOT EXISTS pizzas (
	id serial,
	topping_id numeric(9,2),
	PRIMARY KEY( id )
);

CREATE TABLE IF NOT EXISTS orders (
	id serial,
	purchaser varchar(255),
	pizza_id numeric(9,2),
	PRIMARY KEY( id )
);

INSERT INTO toppings(topping_name, cost) VALUES ('mushroom',.20);

INSERT INTO pizzas(topping_id) VALUES (0);

INSERT INTO orders(purchaser, pizza_id) VALUES ('Adam Costanza', 0);

