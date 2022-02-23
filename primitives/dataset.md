---
description: Represents a table or view in the DataWarehouse
---

# Dataset

A Dataset represents a table or view in your Data Warehouse. All [SQL chains](sqlchain.md) start with a Dataset.

Datasets can be instantiated in rasgoQL using the following syntax:

```python
# Where fqtn is a fully-qualified table name in your Data Warehouse 
fqtn = 'adventureworks.public.dimproduct'
ds = rasgoql.dataset(fqtn)
```

A Dataset has these properties:

<details>

<summary>fqtn</summary>

str: (fully-qualified table name) This is the name of the table in the DataWarehouse

```python
ds.fqtn
```

</details>

<details>

<summary>table_type</summary>

str: SQL object type

Values: \[TABLE, VIEW, UNKNOWN]

```python
ds.table_type
```

</details>

<details>

<summary>table_state</summary>

str: State of the table

Values: \['IN DW', 'IN MEMORY', 'UNKNOWN']

```python
ds.table_state
```

</details>

A Dataset has these methods:

<details>

<summary>preview()</summary>

Returns the top 10 rows into a pandas DataFrame

```python
df = ds.preview()
df.head()
```

</details>

<details>

<summary>sql()</summary>

Returns the DDL statement to create this table

```python
ds.sql()
```

</details>

<details>

<summary>transform(name, arguments) *</summary>

Applies a Rasgo transform template and returns a SQLChain.

_<mark style="color:orange;">NOTE: Returns a SQLChain object, not a Dataset.</mark>_

_**\*NOTE: Any transform that can be run via the transform() method is also available as an alias method on the Dataset. See samples below for more details.**_

Params:

**name**: str: transform to apply

**arguments**: dict: transform arguments to apply

Example using .transform()

```python
ds.transform(
    name='cast',
    arguments={
      casts: {
        'NUM_ONE': 'string'}
    }
)
```

Example using alias .cast()

```python
ds.cast(
    casts={
      'NUM_ONE': 'string'}
    }
)
```

</details>

<details>

<summary>to_df()</summary>

Returns the entire table into a pandas DataFrame

```python
df = ds.to_df()
df.head()
```

</details>

