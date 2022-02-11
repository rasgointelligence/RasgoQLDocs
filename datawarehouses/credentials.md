# Snowflake

### Connection

RasgoQL uses the [`snowflake-python-connector`](https://pypi.org/project/snowflake-connector-python/) package to connect and interact with your Snowflake Data Warehouse.

### Credentials

RasgoQL provides helper classes to define the credentials needed for your specific DW. The snowflake class is named `SnowflakeCredentials` :

```
from rasgoql import SnowflakeCredentials
```

The SnowflakeCredentials class accepts these parameters (as required by the [python-snowflake-connector](https://docs.snowflake.com/en/user-guide/python-connector-example.html#connecting-using-the-default-authenticator)).

| Param     | Notes                                                                                                                                                                                                                                                                                    |
| --------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| account   | <p>unique identifier at the start of your Snowflake URL. e.g. abc1234<br><br>For help determining your identifier, see Snowflake's <a href="https://docs.snowflake.com/en/user-guide/admin-account-identifier.html#account-identifier-formats-by-cloud-platform-and-region">docs</a></p> |
| user      | user to connect as in this session                                                                                                                                                                                                                                                       |
| password  | password for the user                                                                                                                                                                                                                                                                    |
| role      | default role to assume in this session                                                                                                                                                                                                                                                   |
| warehouse | default compute warehouse to use for this session                                                                                                                                                                                                                                        |
| database  | default database to use for this session                                                                                                                                                                                                                                                 |
| schema    | default schema to use for this session                                                                                                                                                                                                                                                   |

{% hint style="info" %}
All RasgoQL queries will default to the parameter values passed in at connection time.

Advanced SQL users can change the `role`, `warehouse`, `database`, and `schema` parameters mid-session by manually passing in USE statements.&#x20;
{% endhint %}

{% hint style="warning" %}
RasgoQL relies on the access granted to the `role` you connect with. It does not grant or restrict additional permissions. When working with rasgoql, please be careful to avoid: accessing data you should not access, running dangerous or destructive queries.
{% endhint %}

Here is an example of setting Snowflake credentials and connection to RasgoQL:

```
creds = rasgoql.SnowflakeCredentials(
    account="abc123.us-east-1",
    user="GRIFF",
    password="...",
    role="MY_ROLE",
    warehouse="COMPUTE_WH",
    database="MY_DB",
    schema="PUBLIC"
)
rql = rasgoql.connect(creds)
```
