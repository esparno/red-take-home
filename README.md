# RED Take Home
There are three tables defined in postgreSQL: toppings, pizzas, and orders. Toppings specifies the different 
toppings available to order and their cost along with an id to identify the topping. Pizzas has a single row for each topping 
linking the topping to the correct pizza id. Orders has a single row for each pizza linked to the order id. Note the ids of rows for each table
 are **not** unique, there are 1 or more of each id per each table, linking 1 or more pizzas or toppings to that particular id.
 
Since we are running a special, the cost of a pizza is simply the sum of all of the costs of its toppings, in this case size does not matter.
 
Given all of the orders in the `orders` table, use Spark and Scala to generate a table that has the schema:

order_id: String (UUID) -- the order id
purchaser: String --  the purchaser name
toppings: Array[Array[String]] -- an array of the array of toppings per pizza
pizza_costs: Array[Double] -- an array of costs for each pizza (sum of all topping costs)
total_cost: Double - the total cost of adding up all of the pizzas

### Expected output
The code you write should create an output that looks like this:
```
+------------------------------------+-------------+--------------------------------------------------------+------------+----------+
|id                                  |purchaser    |pizza_toppings                                          |pizza_costs |total_cost|
+------------------------------------+-------------+--------------------------------------------------------+------------+----------+
|3c2f92e0-c561-47bc-bdda-38271af45086|Nate McArdle |[[mushroom, sausage]]                                   |[1.70]      |1.70      |
|8bc5e8eb-0782-4447-8829-5a83b6836f2f|Adam Costanza|[[mushroom, sausage], [bacon, mushroom, onion, sausage]]|[1.70, 2.95]|4.65      |
|9aaf3d6e-0808-4b89-823e-e1fbc3a4ae8a|Steve Naumann|[[mushroom, mushroom, onion, onion]]                    |[0.90]      |0.90      |
+------------------------------------+-------------+--------------------------------------------------------+------------+----------+
```

## Installation
You will need docker, docker-compose, Java 8, and SBT to run this code base.

## Testing your code
To submit your code to spark, simply run the following commands:

### Start Docker containers and seed data
```
docker-compose up -d
```

### Submit Job to Spark in Docker
```
./submitJob.sh
```

### Destroying containers
```
docker-compose down -v
```

## Data
ALl of this output is available by default by just running `./submitJob.sh` without making any changes at all.

### Toppings
```aidl
+------------------------------------+------------+----+
|id                                  |topping_name|cost|
+------------------------------------+------------+----+
|aa4d67bf-998f-4b85-9311-08709eff31a9|mushroom    |0.20|
|246d8683-6a4e-4f6f-987a-d151bb8f5408|sausage     |1.50|
|06b31f6c-ddf5-47f3-b0d8-b4ed3704c59e|onion       |0.25|
|30f2494a-fe47-4fe5-b748-a18b443c6ba2|bacon       |1.00|
+------------------------------------+------------+----+
```

## Pizzas
```aidl
+------------------------------------+------------------------------------+
|id                                  |topping_id                          |
+------------------------------------+------------------------------------+
|0fe095d9-def2-4360-9080-7e16774f6e57|aa4d67bf-998f-4b85-9311-08709eff31a9|
|0fe095d9-def2-4360-9080-7e16774f6e57|246d8683-6a4e-4f6f-987a-d151bb8f5408|
|5b382ab1-4dc3-4e23-a601-eadaaccc4122|aa4d67bf-998f-4b85-9311-08709eff31a9|
|5b382ab1-4dc3-4e23-a601-eadaaccc4122|246d8683-6a4e-4f6f-987a-d151bb8f5408|
|5b382ab1-4dc3-4e23-a601-eadaaccc4122|06b31f6c-ddf5-47f3-b0d8-b4ed3704c59e|
|5b382ab1-4dc3-4e23-a601-eadaaccc4122|30f2494a-fe47-4fe5-b748-a18b443c6ba2|
|d33435fc-b20f-4644-9a91-b47befb0c645|aa4d67bf-998f-4b85-9311-08709eff31a9|
|d33435fc-b20f-4644-9a91-b47befb0c645|246d8683-6a4e-4f6f-987a-d151bb8f5408|
|129bb5b5-bef9-47ce-a7e0-39e34a8ffa0c|aa4d67bf-998f-4b85-9311-08709eff31a9|
|129bb5b5-bef9-47ce-a7e0-39e34a8ffa0c|06b31f6c-ddf5-47f3-b0d8-b4ed3704c59e|
|129bb5b5-bef9-47ce-a7e0-39e34a8ffa0c|aa4d67bf-998f-4b85-9311-08709eff31a9|
|129bb5b5-bef9-47ce-a7e0-39e34a8ffa0c|06b31f6c-ddf5-47f3-b0d8-b4ed3704c59e|
+------------------------------------+------------------------------------+
```

### Orders
```aidl
+------------------------------------+-------------+------------------------------------+
|id                                  |purchaser    |pizza_id                            |
+------------------------------------+-------------+------------------------------------+
|8bc5e8eb-0782-4447-8829-5a83b6836f2f|Adam Costanza|0fe095d9-def2-4360-9080-7e16774f6e57|
|8bc5e8eb-0782-4447-8829-5a83b6836f2f|Adam Costanza|5b382ab1-4dc3-4e23-a601-eadaaccc4122|
|9aaf3d6e-0808-4b89-823e-e1fbc3a4ae8a|Steve Naumann|129bb5b5-bef9-47ce-a7e0-39e34a8ffa0c|
|3c2f92e0-c561-47bc-bdda-38271af45086|Nate McArdle |d33435fc-b20f-4644-9a91-b47befb0c645|
+------------------------------------+-------------+------------------------------------+
```