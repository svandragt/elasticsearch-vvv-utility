# ElasticSearch vvv utility

ElasticSearch utility for VVV

This utility will set up [ElasticSearch](https://redis.io/) on your [VVV](https://github.com/Varying-Vagrant-Vagrants/VVV).

## Usage

In your `vvv-customy.yml` file add under `extensions`:

```yml
extensions:
  elasticsearch:
    - elasticsearch7

utility-sources:
  elasticsearch: 
    repo: https://github.com/svandragt/elasticsearch-vvv-utility.git
    branch: master
```

Once you add it, be sure you re-provision your VVV with `vagrant reload --provision`.
