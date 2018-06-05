# Mojito Docker image

## Description
This repo provides dockerization for [box/mojito](https://github.com/box/mojito). 
If you want to know more about it, please refer to its [README](https://github.com/box/mojito/blob/master/README.md).


## Build
There's an automated build linked on [Docker Hub](https://hub.docker.com/r/mzuccala/mojito/), which produces the following tags:

- `latest`: full (webapp + CLI) package, launches webapp by default (see [below](#full-version))
- `cli`: CLI-only package, uses `mojito-cli` as container entrypoint (see [below](#cli-only-version))

Additionally, whenever a tag gets published, two more tags are produced:

- `<TAG>`: full package
- `<TAG>-cli`: CLI-only package

## Full version

This version launches mojito webapp by default, but also includes the CLI.

In order for the webapp to work correctly, you should provide the following ENV variables:

- `MOJITO_DB_HOST`: MySQL hostname (e.g. `mysql`)
- `MOJITO_DB_PORT`: MySQL port (e.g. `3306`)
- `MOJITO_DB_NAME`: MySQL database name (e.g. `mojito`)
- `MOJITO_DB_USER`: MySQL username (e.g. `webapp`)
- `MOJITO_DB_PASS`: MySQL password (e.g. `passw0rd`)

Please notice that **no defaults are provided**.

## CLI-only version

This version contains `mojito-cli` only, which is set as Docker entrypoint so that it can be used as follows:

```
docker run --rm mzuccala/mojito:cli create-repo -h
```

In order for the CLI to work correctly, you should provide the following ENV variables:

- `MOJITO_API_HOST`: hostname where mojito webapp resides (e.g. `localhost`)
- `MOJITO_API_PORT`: TCP port (e.g. `8080`)
- `MOJITO_API_SCHEME`: HTTP connection scheme (e.g. `HTTP`)
- `MOJITO_API_USER`: mojito username (e.g. `admin`)
- `MOJITO_API_PASS`: mojito password (e.g. `ChangeMe`)

Please notice that **no defaults are provided**.

## Contributing

If you'd like to contribute, feel free to open a pull request and I'll take care of it ASAP!
