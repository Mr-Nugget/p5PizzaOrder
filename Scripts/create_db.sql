--Create user : ocpizza

CREATE USER ocpizza WITH PASSWORD 'admin' CREATEDB;

-- Database: library

CREATE DATABASE pizzaOrder
    WITH
    OWNER = ocpizza
    ENCODING = 'UTF8'
    LC_COLLATE = 'French_France.1252'
    LC_CTYPE = 'French_France.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
