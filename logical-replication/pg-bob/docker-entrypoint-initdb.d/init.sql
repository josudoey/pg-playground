CREATE DATABASE play;
\c play;

CREATE EXTENSION pglogical;
CREATE TABLE books(id serial PRIMARY KEY, title TEXT);

SELECT pglogical.create_node(
    node_name := 'pg-bob',
    dsn := 'host=pg-bob port=5432 dbname=play user=postgres password=password'
);

-- SELECT pglogical.create_subscription(
--     subscription_name := 'pgbob',
--     provider_dsn := 'host=pg-alice port=5432 dbname=play user=postgres password=password'
-- );

