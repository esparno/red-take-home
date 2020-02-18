CREATE TABLE IF NOT EXISTS toppings (
	id varchar(255),
	topping_name varchar(255),
	cost numeric(9,2),
	PRIMARY KEY( id )
);

CREATE TABLE IF NOT EXISTS pizzas (
	id varchar(255),
	topping_id varchar(255),
	PRIMARY KEY( id )
);

CREATE TABLE IF NOT EXISTS orders (
	id varchar(255),
	purchaser varchar(255),
	pizza_id varchar(255),
	PRIMARY KEY( id )
);

INSERT INTO toppings(id, topping_name, cost)
VALUES
('aa4d67bf-998f-4b85-9311-08709eff31a9','mushroom',.20),
('246d8683-6a4e-4f6f-987a-d151bb8f5408','sausage',1.50),
('06b31f6c-ddf5-47f3-b0d8-b4ed3704c59e','onion',.25),
('30f2494a-fe47-4fe5-b748-a18b443c6ba2','bacon',1.00);

INSERT INTO pizzas(id, topping_id)
VALUES
('0fe095d9-def2-4360-9080-7e16774f6e57','aa4d67bf-998f-4b85-9311-08709eff31a9'),
('0fe095d9-def2-4360-9080-7e16774f6e57','246d8683-6a4e-4f6f-987a-d151bb8f5408'),
('5b382ab1-4dc3-4e23-a601-eadaaccc4122','aa4d67bf-998f-4b85-9311-08709eff31a9'),
('5b382ab1-4dc3-4e23-a601-eadaaccc4122','246d8683-6a4e-4f6f-987a-d151bb8f5408'),
('5b382ab1-4dc3-4e23-a601-eadaaccc4122','06b31f6c-ddf5-47f3-b0d8-b4ed3704c59e'),
('5b382ab1-4dc3-4e23-a601-eadaaccc4122','30f2494a-fe47-4fe5-b748-a18b443c6ba2'),
('d33435fc-b20f-4644-9a91-b47befb0c645','aa4d67bf-998f-4b85-9311-08709eff31a9'),
('d33435fc-b20f-4644-9a91-b47befb0c645','246d8683-6a4e-4f6f-987a-d151bb8f5408'),
('129bb5b5-bef9-47ce-a7e0-39e34a8ffa0c','aa4d67bf-998f-4b85-9311-08709eff31a9'),
('129bb5b5-bef9-47ce-a7e0-39e34a8ffa0c','06b31f6c-ddf5-47f3-b0d8-b4ed3704c59e'),
('129bb5b5-bef9-47ce-a7e0-39e34a8ffa0c','aa4d67bf-998f-4b85-9311-08709eff31a9'),
('129bb5b5-bef9-47ce-a7e0-39e34a8ffa0c','06b31f6c-ddf5-47f3-b0d8-b4ed3704c59e');

INSERT INTO orders(id, purchaser, pizza_id)
VALUES
('8bc5e8eb-0782-4447-8829-5a83b6836f2f','Adam Costanza', '0fe095d9-def2-4360-9080-7e16774f6e57'),
('8bc5e8eb-0782-4447-8829-5a83b6836f2f','Adam Costanza', '5b382ab1-4dc3-4e23-a601-eadaaccc4122'),
('8bc5e8eb-0782-4447-8829-5a83b6836f2f','Steve Naumann', '129bb5b5-bef9-47ce-a7e0-39e34a8ffa0c'),
('8bc5e8eb-0782-4447-8829-5a83b6836f2f','Nate McArdle', 'd33435fc-b20f-4644-9a91-b47befb0c645');

