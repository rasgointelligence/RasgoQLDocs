---
description: Represents a table or view in the DataWarehouse
---

# Dataset

The Dataset is the core blah blah ...



Properties

<details>

<summary>fqtn</summary>

str: (fully-qualified table name) This is the name of the table in the DataWarehouse

</details>

<details>

<summary>table_type</summary>

str: SQL object type

Values: \[TABLE, VIEW, UNKNOWN]

</details>

<details>

<summary>table_state</summary>

str: State of the table

Values: \['IN DW', 'IN MEMORY', 'UNKNOWN']

</details>

Methods:

<details>

<summary>preview()</summary>

Returns the top 10 rows into a pandas DataFrame

</details>

<details>

<summary>sql()</summary>

Returns the DDL statement to create this table

</details>

<details>

<summary>to_df()</summary>

Returns the entire table into a pandas DataFrame

</details>

