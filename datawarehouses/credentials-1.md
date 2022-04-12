# Redshift

### Connection

RasgoQL uses the [amazon-redshift-python-driver](https://github.com/aws/amazon-redshift-python-driver) package to connect and interact with your Amazon Redshift Data Warehouse.

### Credentials

RasgoQL provides helper classes to define the credentials needed for your specific DW. The Redshift class is named RedshiftCredentials:

```python
from rasgoql import RedshiftCredentials
```

The RedshiftCredentials class accepts these parameters, as well as any others listed in [their driver's documentation](https://github.com/aws/amazon-redshift-python-driver#connection-parameters).

<table><thead><tr><th>Param</th><th data-type="checkbox">Required</th><th>Notes</th></tr></thead><tbody><tr><td>username</td><td>true</td><td>user to authenticate as in this session</td></tr><tr><td>password</td><td>true</td><td>password for the user</td></tr><tr><td>db_user</td><td>false</td><td>database username</td></tr><tr><td>host</td><td>true</td><td>endpoint of the redshift cluster</td></tr><tr><td>port</td><td>true</td><td>port to hit on the endpoint</td></tr><tr><td>database</td><td>true</td><td>database to use for this session</td></tr><tr><td>schema</td><td>true</td><td>schema to use for this session</td></tr><tr><td>region</td><td>false</td><td>The AWS region where the cluster is located</td></tr><tr><td>cluster_identifier</td><td>false</td><td>cluster identifier of the amazon redshift cluster</td></tr><tr><td>db_groups</td><td>false</td><td>A comma-separated list of existing database group names that the DbUser joins for the current session</td></tr></tbody></table>

{% hint style="info" %}
All RasgoQL queries will use to the parameter values passed in at connection time.

Since Redshift connections are built specifically for a database, to change database context, you will need to disconnect and reconnect with a new value in `database` via `RedshiftCredentials`
{% endhint %}

{% hint style="warning" %}
RasgoQL relies on the access granted to the `username` you connect with. It does not grant or restrict additional permissions. When working with rasgoql, please be careful to avoid: accessing data you should not access, running dangerous or destructive queries.
{% endhint %}

Here is an example of setting Snowflake credentials and connection to RasgoQL:

```python
creds = rasgoql.RedshiftCredentials(
    username="GRIFF",
    password="...",
    db_user="awsuser",
    database="dev",
    schema="public",
    host="redshift-cluster-1.mycluster.myregion.redshift.amazonaws.com",
    port=5439
)
rql = rasgoql.connect(creds)
```
