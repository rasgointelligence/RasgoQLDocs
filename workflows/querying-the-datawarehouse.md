# Querying the DataWarehouse

RasgoQL provides a helpful framework for building SQLChains and previewing data. There may also be times that you need issue standalone queries against your DataWarehouse. RasgoQL provides a simple way to do this as well.

{% hint style="warning" %}
WARNING: RasgoQL relies on inherited permissions from your data access policy (and your common sense) when issuing queries against your DataWarehouse. **Please be careful using this feature** to avoid: accessing data you should not access, running dangerous or destructive queries.&#x20;
{% endhint %}

All query methods assume you have an open connection to your DataWarehouse. See [Connecting to a DataWarehouse](connecting-to-a-datawarehouse.md) for more information.

#### Querying your DataWarehouse

You may issue any valid SQL query using the .query() method:

```
sql = 'SELECT TOP 10000 * FROM MY_TABLE'
rql.query(sql)
```

RasgoQL makes an underwhelming attempt to detect SQL keywords that could be dangerous or unintended. If you pass one in, you will see this message:

```
sql = 'DROP TABLE MY_TABLE'
rql.query(sql)

###
SQLException: It looks like your SQL statement contains a 
potentially dangerous or data-altering operation. 
If you are positive you want to run this, 
pass in acknowledge_risk=True and run this function again.
###
```

If you are confident in your SQL, you can override this message by passing in the \`acknowledge\_risk\` parameter to ignore this warning:

```
sql = 'DROP TABLE MY_TABLE'
rql.query(sql, acknowledge_risk=True)
```

#### Querying into a DataFrame

You may return results of a valid SQL query into a pandas DataFrame using the .query\_into\_df() method:

```
sql = 'SELECT TOP 10000 * FROM MY_TABLE'
df = rql.query_into_df(sql)
df.head()
```

#### Listing Tables in your DataWarehouse

You may return a list of accessible tables and views in your DataWarehouse using the .list\_tables() method:&#x20;

```
rql.list_tables()
```
