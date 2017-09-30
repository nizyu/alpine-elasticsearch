# alpine-elasticsearch

Dockerfile template for creating a small Elasticseach container image.

## Description


Since the image distributed on the [official site](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html) was dissatisfied with the following points, I created a reusable template.

- It bundled unnecessary plugins.
- Image is too big due to the CentOS image as the base.

So I created a template to create more minimal image.

```
$ docker images
REPOSITORY                                      TAG                 IMAGE ID            CREATED             SIZE
alpine-elasticsearch                            5.6.1               ad80b4ed5299        16 minutes ago      187.7 MB
docker.elastic.co/elasticsearch/elasticsearch   5.6.1               f5ab693b0f62        11 days ago         656.6 MB
```


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
docker build --build-arg ELASTICSEARCH_VERSION=5.6.1 -t alpine-elasticsearch:5.6.1 .
```
