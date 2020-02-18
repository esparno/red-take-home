# RED Take Home
There are three tables defined in postgreSQL: toppings, pizzas, and orders. Toppings specifies the different 
toppings available to order and their cost along with an id to identify the topping. Pizzas has a single row for each topping 
linking the topping to the correct pizza id. Orders has a single row for each pizza linked to the order id. Note the ids of rows for each table
 are **not** unique, there are 1 or more of each id per each table, linking 1 or more pizzas or toppings to that particular id.
 
Given all of the orders in the `orders` table, use Spark and Scala to generate a table that has 
the orders fully defined, where pizzas and toppings are collected / denormalized into lists rather than being normalized.

Note the code is started for you with some boilerplate at `src/main/scala/Main.scala`. You will want to add to this file.

## Expectations
Please create a GitHub repo that is a fork of this one with your code changes and within that repo save a screenshot of 
the generated output of the denormalized pizzas. To show your generated DataFrame / Dataset you may simply use the Spark command `show`

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