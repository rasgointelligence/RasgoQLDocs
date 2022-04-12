# MySQL

### Connection

RasgoQL uses SQLAlchemy to connect and interact with your MySQL Data Warehouse.

Utilizing SQLAlchemy allows us to support multiple iterations of similar data warehouses (e.g., Postgres, MySQL, etc).

### Credentials

RasgoQL provides helper classes to define the credentials needed for your specific DW. The MySQL class is named `MySQLCredentials` :

```python
from rasgoql import MySQLCredentials
```

The `MySQLCredentials` class accepts these parameters (as required by the [SQL Alchemy connection engine](https://docs.sqlalchemy.org/en/14/dialects/mysql.html#module-sqlalchemy.dialects.mysql.pymysql)):

| Param    | Notes                                         |
| -------- | --------------------------------------------- |
| username | user to connect as in this session            |
| password | password for the user                         |
| host     | DNS resolvable host name for the MySQL server |
| database | default database to use for this session      |

{% hint style="info" %}
All RasgoQL queries will default to the parameter values passed in at connection time.

Since MySQL connections are built specifically for a database, to change database context, you will need to disconnect and reconnect with a new value in `database` via `MySQLCredentials`
{% endhint %}

{% hint style="warning" %}
RasgoQL relies on the access granted to the user you connect with. It does not grant or restrict additional permissions. When working with RasgoQL, please be careful to avoid: accessing data you should not access, running dangerous or destructive queries.
{% endhint %}

Here is an example of setting MySQL credentials and connection to RasgoQL:

```python
creds = rasgoql.MySQLCredentials(
    username="some_user",
    password="some_pw",
    host="ip_or_host_name",
    database="db_name",
)
rql = rasgoql.connect(creds)
```
