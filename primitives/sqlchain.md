---
description: >-
  Represents a sequence of SQL statements applied to a table or view in the Data
  Warehouse
---

# SQLChain

A SQLChain represents a sequence of sql statements applied to a table or view in your Data Warehouse. All SQLChains start with a [Dataset](dataset.md) and return a Dataset.

SQLChains can be instantiated in rasgoQL using either of the following ways:

```
# Where fqtn is a fully-qualified table name in your Data Warehouse 
fqtn = 'adventureworks.public.dimproduct'
ds = rasgoql.dataset(fqtn)
sql_chn = ds.transform(...)
```

```
# Where fqtn is a fully-qualified table name in your Data Warehouse 
fqtn = 'adventureworks.public.dimproduct'
sql_chn = rasgoql.sqlchain(fqtn).transform(...)
```

A SQLChain has these properties:

<details>

<summary>entry_table</summary>

Dataset: The original table or view this chain applies its queries to

```
sql_chn.entry_table
```

</details>

<details>

<summary>fqtn</summary>

str: (fully-qualified table name) The name of the table or view this chain will create in the DataWarehouse if saved in current state

_<mark style="color:orange;">NOTE: This property will be mutable until the chain is saved</mark>_

```
sql_chn.entry_table
```

</details>

<details>

<summary>output_table</summary>

Dataset: The Dataset object this chain will produce if saved in current state

_<mark style="color:orange;">NOTE: This property will be mutable until the chain is saved</mark>_

```
sql_chn.output_table
```

</details>

<details>

<summary>transforms</summary>

list of Transforms: An ordered list of transforms applied to the entry\_table

```
sql_chn.transforms
```

</details>

A SQLChain has these methods:

<details>

<summary>preview()</summary>

Returns the top 10 rows into a pandas DataFrame

```
df = sql_chn.preview()
df.head()
```

</details>

<details>

<summary>sql()</summary>

Returns the SQL statement to create this chain

```
sql_chn.sql()code
```

</details>

<details>

<summary>save(<em>table_name, table_type</em>)</summary>

Saves this SQL chain as a table or view in the DataWarehouse

Params:

**table\_name**: str: name for the SQL object

**table\_type**: str: TABLE or VIEW&#x20;

```
sql_chn.save(
    table_name=, 
    table_type='view'
)
```

</details>

<details>

<summary>todbt(project_directory, models_directory, project_name, materialize_method)</summary>

Saves this SQLChain as a dbt-compliant model.sql file

Params:

**project\_directory**: str: filepath to save the dbt\_project.yml file

**models\_directory**: str: Optional filepath to save the model.sql file. Defaults to _project\_directory/models_

**project\_name**: str: Optional name for the project. Defaults to 'rasgoql'

**materialize\_method**: str: Optional value: TABLE or VIEW . Defaults to VIEW

```
sql_chn.to_dbt(
    project_directory='Users/me/dbt',
    project_name='helloworld'
)
```

</details>

<details>

<summary>transform(name, arguments) *</summary>

Applies a Rasgo transform template and returns a the SQLChain with a new terminal transform.

_<mark style="color:orange;">NOTE: Mutates the output\_table and fqtn properties of the SQLChain.</mark>_

_**\*NOTE: Any transform that can be run via the transform() method is also available as an alias method on the SQLChain. See samples below for more details.**_

Params:

**name**: str: transform to apply

**arguments**: dict: transform arguments to apply

Example using .transform()

```
sql_chn.transform(
    name='cast',
    arguments={
      casts: {
        'NUM_ONE': 'string'}
    }
)
```

Example using alias .cast()

```
sql_chn.cast(
    casts={
      'NUM_ONE': 'string'}
    }
)
```

</details>

