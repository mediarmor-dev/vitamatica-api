# Notes

+ This is the Vitamatica Database local setup using Docker

### Install PostgreSQL Client Tools (psql) Locally
+ For mac: `brew install postgresql`
+ For windows: https://www.postgresql.org/download/windows
+ For linux: `sudo apt-get install postgresql-client`


### PostgreSQL Database Docker local setup
+ Go to folder `postgres-vitamatica-db`
+ Run command `docker-compose up -d` [This starts the PostgreSQL database in a standalone container.]

### Remove Rebuild and Start PostgreSQL Database Docker container
+ `docker-compose down -v`
+ `docker-compose up --build -d`
+ `docker-compose up -d`

### Ensure running the right docker-compose file [if needed]
+ `docker-compose -f docker-compose.yml up -d`

### Verify init.sql is inside the container
+ `docker exec -it vitamatica_db_container bash`
+ `cd /docker-entrypoint-initdb.d/`
+ `ls -l`

### Connect
+ connect to the running PostgreSQL container directly using docker exec: 
+ `docker ps`
+ `docker exec -it vitamatica_db_container psql -U admin -d vitamatica_db`

### Manually copy init.sql file [if needed]
+ `docker cp ./init.sql vitamatica_db_container:/docker-entrypoint-initdb.d/init.sql`

### Once the file is copied, you can manually run it inside the PostgreSQL container:
+ `psql -U admin -d vitamatica_db -f /docker-entrypoint-initdb.d/init.sql`

### Verify the Tables and Data
+ `docker exec -it vitamatica_db_container psql -U admin -d vitamatica_db`
+ `\dt`
+ `\d patients`



### 

      - ./postgres_data:/var/lib/postgresql/data  # Optional: Persist PostgreSQL data outside the container



