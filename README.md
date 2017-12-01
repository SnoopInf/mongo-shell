## Docker MongoShell

`3.4.10`, `3.4`, `3`, `latest` ([Dockerfile](https://github.com/samsao/mongo-shell/blob/develop/Dockerfile))

## Source

The repository is on GitHub @ [samsao/mongo-shell](https://github.com/samsao/mongo-shell).

## Usage

### Host

Simply launch the container, connecting it to your host network, by default it will try to connect to a MongoDB instance running reachable at `localhost:27017`:

```
docker run --rm -it --net host samsao/mongo-shell:3.4
```

To provide to which port and host to connect to, specify `MONGO_HOST` and `MONGO_PORT`
environment variables:

```
docker run --rm -it --net host -e MONGO_HOST=db -e MONGO_PORT=37017 samsao/mongo-shell:3.4
```

### Container

To connect to a database that is reachable on a particular Docker network, specify the container id that has access to the MongoDB instance instead of `--net host` (assume MongoDB hostname on this network is `db`):

```
docker run --rm -it --net container:<container_id> -e MONGO_HOST=db samsao/mongo-shell:3.4
```

## Environments

Available environment variables, default values and usage:

 * `MONGO_HOST` (Default: `localhost`)

   Pass as value of `--host <value>` parameter.

 * `MONGO_PORT` (Default: `27017`)
   
   Pass as value of `--port <value>` parameter.

 * `MONGO_USERNAME` (Default: `<Empty>`)

   Pass as value of `--username <value>` parameter, argument not pass if empty.

 * `MONGO_PASSWORD` (Default: `<Empty>`)

   Pass as value of `--password <value>` parameter, argument not pass if empty.

 * `MONGO_EXTRA_PARAMETERS` (Default: `<Empty>`)

   Pass as-is to `/usr/bin/mongo` binary.

**Note** Shell escaping and similar problems can occurs when using `MONGO_EXTRA_PARAMETERS`. I did not tested thoroughly all and every possible use cases. As such, don't hesitate to report an issue. I will be happy to show you how you can debug and track the issue. But there is little chances I do the fix myself.
