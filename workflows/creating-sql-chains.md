# Creating SQL Chains

RasgoQL's primary purpose is to create complex SQL statements (chains of data transformations) using a python friendly syntax.

Creating a SQLChain is a 3 step process:

1. Set a table or view in your DataWarehouse as the target "Dataset"
2. Apply 1 or more transforms to the Dataset
3. Print the SQL or save it as a view in your DataWarehouse

#### Example: Simple SQLChain

Step 1:

Assumes an open rasgoql connection. See [Connecting to a DataWarehouse](connecting-to-a-datawarehouse.md) for more details.

```python
ds = rql.dataset('DATABASE.SCHEMA.TABLE')
ds
```

Step 2:

```python
chn = ds.rolling_agg(
    aggregations={
        'SALESAMOUNT':['MAX', 'MIN', 'SUM']
    },
    order_by='ORDERDATE',
    offsets=[-7, 7],
    group_by=['PRODUCTKEY'],
)
```

Step 3:

```python
# Print the SQL
chn.sql()

# Save the SQL as a view
chn.save(table_name='MY_RQL_TEST')
```



#### Example: Multi-Transform SQLChain

Step 1:

Assumes an open rasgoql connection. See [Connecting to a DataWarehouse](connecting-to-a-datawarehouse.md) for more details.

```python
ds = rql.dataset('DATABASE.SCHEMA.TABLE')
ds
```

Step 2:

```python
chn = ds.rolling_agg(
    aggregations={
        'SALESAMOUNT':['MAX', 'MIN', 'SUM']
    },
    order_by='ORDERDATE',
    offsets=[-7, 7],
    group_by=['PRODUCTKEY'],
)

chn = chn.drop_columns(
    exclude_cols=['ORDERDATEKEY']
)

chn = chn.pivot(
    dimensions=['ORDERDATE'],
    pivot_column='SALESAMOUNT',
    value_column='PRODUCTKEY',
    agg_method='SUM',
    list_of_vals=['310', '345']
)
```

Step 3:

```python
# Print the SQL
chn.sql()

# Save the SQL as a view
chn.save(table_name='MY_RQL_TEST')
```
