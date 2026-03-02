/*
=======================================================================================================
CREATE DATABASE AND SCHEMAS
=======================================================================================================
Script Purpose : This script is written to create the database, 'DataWarehouse'. It also checks if the database is present or not.
If present then it will delete and re-create. It will also go ahead and create the schemas bronze, silver and gold in the database.

WARNING
This will drop the database permanently if exists. Proceed with caution as all the data in the database will be deleted.
Proceed with caution and ensure you have proper backups before running the script.
*/

CREATE DATABASE 'DataWarehouse'

USE master --It is a system DB where we can go and create other databases.
GO
  IF EXISTS (SELECT 1 FROM sys.database WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse
END;

GO
--Create Database DataWarehouse         
CREATE DATABASE DataWarehouse;
USE DataWarehouse;
GO           --GO is used as a seperator where we tell the db to execute the lines individually one after another.

--Create the schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO

--Note : We always create db first and then schema and then tables. Hence naming convention is db name. schema name. table name.
