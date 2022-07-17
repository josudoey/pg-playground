CREATE DATABASE play;
\c play;

CREATE EXTENSION pglogical;
SELECT pglogical.create_node(
    node_name := 'pg-alice',
    dsn := 'host=pg-alice port=5432 dbname=play user=postgres password=password'
);

CREATE TABLE books(id serial PRIMARY KEY, title TEXT);

SELECT pglogical.replication_set_add_all_tables('default', ARRAY['public']);

--INSERT INTO books(title) VALUES ('demo');