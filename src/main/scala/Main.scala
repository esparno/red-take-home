import org.apache.spark.sql.SparkSession

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

  }
}
