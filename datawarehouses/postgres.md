# Postgres

### Connection

RasgoQL uses SQLAlchemy to connect and interact with your Postgres Data Warehouse.

Utilizing SQLAlchemy allows us to support multiple iterations of similar data warehouses (e.g., Postgres, MySQL, etc).

### Credentials

RasgoQL provides helper classes to define the credentials needed for your specific DW. The Postgres class is named `PostgresCredentials` :

```python
from rasgoql import PostgresCredentials
```

The `PostgresCredentials` class accepts these parameters (as required by the [SQLAlchemy Connector](https://docs.sqlalchemy.org/en/14/dialects/postgresql.html#module-sqlalchemy.dialects.postgresql.psycopg2)):

| Param    | Notes                                            |
| -------- | ------------------------------------------------ |
| username | user to connect as in this session               |
| password | password for the user                            |
| host     | DNS resolvable host name for the Postgres server |
| port     | PG port on named host                            |
| database | default database to use for this session         |
| schema   | default schema to use for this session           |

{% hint style="info" %}
All RasgoQL queries will default to the parameter values passed in at connection time.

Since Postgres connections are built specifically for a database, to change database context, you will need to disconnect and reconnect with a new value in `database` via `PostgresCredentials`
{% endhint %}

{% hint style="warning" %}
RasgoQL relies on the access granted to the user you connect with. It does not grant or restrict additional permissions. When working with RasgoQL, please be careful to avoid: accessing data you should not access, running dangerous or destructive queries.
{% endhint %}

Here is an example of setting Postgres credentials and connection to RasgoQL:

```python
creds = rasgoql.PostgresCredentials(
    username="some_user",
    password="some_pw",
    host="ip_or_host_name",
    port="5432", # probably, as this is PG's default port
    database="db_name",
    schema="schema_name",
)
rql = rasgoql.connect(creds)
```
