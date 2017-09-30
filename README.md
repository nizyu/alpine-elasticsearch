# alpine-elasticsearch

## USAGE

### 1. List up plugins you want

In plugins.txt, write the plugins you wish to install with a line break separator.

ex)
```
analysis-kuromoji
analysis-icu
```

### 2. Build image with Elasticsearch version.

```shell
docker build --build-arg ELASTICSEARCH_VERSION=5.6.1 -t elasticsearch:5.6.1 .
```
