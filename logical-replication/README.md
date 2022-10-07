

## build pglogical(without table fitler)

```
$ make build
```

## setup

```
$ docker-compose up -d
```

## clean

```
$ docker-compose down
$ make clean-data
```


## begin subscription pg-bob -> pg-alice  
$ docker-compose exec pg-bob psql --user=postgres --dbname play -c "SELECT pglogical.create_subscription(subscription_name := 'pgbob', provider_dsn := 'host=pg-alice port=5432 dbname=play user=postgres password=password');"

