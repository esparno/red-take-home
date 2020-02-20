import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.functions.{sum, collect_list}

object Main {
  def main(args: Array[String]): Unit = {
    val spark = SparkSession.builder
      .appName("red-take-home")
      .config("driver", "org.postgresql.Driver")
      .getOrCreate

    val basicConnection = spark.read
      .format("jdbc")
      .option("url", "jdbc:postgresql://db:5432/postgres")
      .option("user", "postgres")
      .option("password", "password")

    val toppingsDF = basicConnection
      .option("dbtable", "toppings")
      .load

    val pizzasDF = basicConnection
      .option("dbtable", "pizzas")
      .load

    val ordersDF = basicConnection
      .option("dbtable", "orders")
      .load

    toppingsDF.show(100, false)
    pizzasDF.show(100, false)
    ordersDF.show(100, false)

    /**
     * YOUR CODE GOES HERE
     */

    val pizzaToppings = toppingsDF.alias("t")
      .join(pizzasDF.alias("p"), pizzasDF.col("topping_id") === toppingsDF.col("id"))
      .select("p.id", "p.topping_id", "t.topping_name", "t.cost")
      .groupBy("p.id")
      .agg(collect_list("topping_id"), collect_list("topping_name"), sum("cost"))
      .withColumnRenamed("collect_list(topping_id)", "topping_ids")
      .withColumnRenamed("collect_list(topping_name)", "pizza_toppings")
      .withColumnRenamed("sum(cost)", "pizza_cost")



    val pizzaOrders = pizzaToppings.alias("p")
      .join(ordersDF.alias("o"), pizzasDF.col("id") === ordersDF.col("pizza_id"))
      .select("o.id", "o.purchaser", "p.pizza_toppings", "p.pizza_cost")
      .groupBy("o.id", "o.purchaser")
      .agg(collect_list("pizza_toppings"), collect_list("pizza_cost"), sum("pizza_cost"))
      .withColumnRenamed("collect_list(pizza_toppings)", "pizza_toppings")
      .withColumnRenamed("collect_list(pizza_cost)", "pizza_costs")
      .withColumnRenamed("sum(pizza_cost)", "total_cost")

    pizzaOrders.orderBy("id").show(100, false)
  }
}
