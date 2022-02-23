# BigQuery



### Connection

RasgoQL uses the [`google-cloud-bigquery`](https://pypi.org/project/google-cloud-bigquery/) package to connect and interact with your BigQuery Data Warehouse.

We prefer this package because it is maintained by Google and (in our experience) consistently outperforms alternatives like `pandas-gbq`.

### Credentials

RasgoQL provides helper classes to define the credentials needed for your specific DW. The BQ class is named `BigQueryCredentials` :

```python
from rasgoql import BigQueryCredentials
```

The `BigQueryCredentials` class accepts these parameters:

| Param            | Notes                                                                                                                                  |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| secret\_type     | <p>A string indicating which authentication method you will user: user or service account</p><p>Valid values: ["user" | "service"]</p> |
| secret\_filepath | absolute path to the google credentials json file on your machine                                                                      |
| project          | default project to use for this session                                                                                                |
| dataset          | default dataset to use for this session                                                                                                |



{% hint style="info" %}
All RasgoQL queries will default to the parameter values passed in at connection time.

Advanced SQL users can change the `project` and `dataset` parameters mid-session by manually passing in USE statements.&#x20;
{% endhint %}

{% hint style="warning" %}
RasgoQL relies on the access granted to the user/service account you connect with. It does not grant or restrict additional permissions. When working with rasgoql, please be careful to avoid: accessing data you should not access, running dangerous or destructive queries.
{% endhint %}

Here is an example of setting BigQuery credentials and connection to RasgoQL:

```python
creds = rasgoql.BigQueryCredentials(
    secret_type="service",
    secret_filepath="Users/griff/client_secrets.json",
    project="mydb",
    dataset="public"
)
rql = rasgoql.connect(creds)
```
