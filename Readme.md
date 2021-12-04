# ElasticSearch vvv utility

ElasticSearch utility for VVV. Based on the Redis utility by [Denis Žoljom](https://github.com/dingo-d), thanks!

This utility will set up [ElasticSearch](https://www.elastic.co/elastic-stack/) on your [VVV](https://github.com/Varying-Vagrant-Vagrants/VVV).

## Usage

In your `config/config.yaml` file add under `extensions`:

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

## WordPress Setup (example using ElasticPress)

1. Install ElasticPress (activate it) (`wp plugin install elasticpress --activate` or via the browser)
2. In the admin, under ElasticPress > Settings add `http://127.0.0.1:9200`:

![image](https://user-images.githubusercontent.com/594871/144641741-75d50b83-1867-4991-9453-4beb127d0cfe.png)

3. Create `public_html/wp-content/mu-plugins/elasticpress.php` with the contents of [elasticpress.php](https://github.com/svandragt/elasticsearch-vvv-utility/blob/master/public_html/wp-content/mu-plugins/elasticpress.php)
4. To run the index run `wp elasticpress index --setup`.
