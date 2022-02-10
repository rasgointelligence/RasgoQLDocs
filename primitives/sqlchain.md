---
description: >-
  Represents a chain of SQL statements applied to a table or view in the
  DataWarehouse
---

# SQLChain

The SQL Chain is the blah blah ...



Properties

<details>

<summary>entry_table</summary>

Dataset: The original table or view this chain applies its queries to

</details>

<details>

<summary>fqtn</summary>

str: (fully-qualified table name) The name of the table or view this chain will create in the DataWarehouse if saved in current state

NOTE: This property will be mutable until the chain is saved

</details>

<details>

<summary>output_table</summary>

Dataset: The Dataset object this chain will produce if saved in current state

NOTE: This property will be mutable until the chain is saved

</details>

<details>

<summary>transforms</summary>

list of Transforms: An ordered list of transforms applied to the entry\_table

</details>

Methods:

<details>

<summary>preview()</summary>

Returns the top 10 rows into a pandas DataFrame

</details>

<details>

<summary>sql()</summary>

Returns the SQL statement to create this chain

</details>

<details>

<summary>save( <em>table_name, table_type</em> )</summary>

Save this SQL chain as a table or view in the DataWarehouse

table\_name: str: name for the SQL object

table\_type: str: TABLE or VIEW&#x20;

</details>

