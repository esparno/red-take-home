#sbt assembly
MASTER=$(docker-compose ps -q spark-master)
docker-compose exec spark-master mkdir -p /opt/app
docker-compose exec spark-master rm /opt/app/RedTakeHome-assembly-1.0.jar
docker cp postgresql-42.2.10.jar $MASTER:/lib/
docker cp target/scala-2.12/RedTakeHome-assembly-1.0.jar $MASTER:/opt/app/
docker-compose exec spark-master spark/bin/spark-submit \
  --class Main \
  --master spark://spark-master:7077 \
  --driver-class-path /lib/postgresql-42.2.10.jar \
  /opt/app/RedTakeHome-assembly-1.0.jar