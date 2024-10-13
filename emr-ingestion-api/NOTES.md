# Notes

+ Build Spring Boot Project: `mvn clean install`
+ Run: `mvn spring-boot:run`
+ Build + Run: `mvn clean install spring-boot:run`

### PostgreSQL Database Docker local setup
+ Build the Docker Image: `docker build -t postgres-emr .`
+ Run the PostgreSQL Container: `docker run --name postgres-emr-container -p 5432:5432 -d postgres-emr`
+ Access the PostgreSQL Database using psql or a database client: `psql -h localhost -U admin -d emr_db`

### API end points:

+ Welcome: http://localhost:8080/api/v1/emr/ingestion/welcome
+ Actuator: http://localhost:8080/actuator/mappings


