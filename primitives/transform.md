---
description: Represents a sql script applied to a table or view in your Data Warehouse
---

# Transform

#### Overview

RasgoQL Transforms are the best way to create features out of data. This open library of templatized SQL functions enables you to quickly manipulate large amounts of abstract table data into insightful features directly in your data warehouse.

Transforms can be as simple or complex as you want them to be. You can use them to quickly join two tables together with a single line of Python, or they can be more advanced, such as a chain of aggregations across millions of rows. Either way, all the complex SQL logic is executed/generated for you. Also, RasgoQL only needs basic metadata to execute transforms, so your private data remains secure and in the warehouse.

A few of the most common use cases for RasgoQL transforms are:

* Filtering and truncating time-series data
* Joining multiple tables into a single dataset
* Imputing, pivoting, and binning data
* Aggregating and lagging data for forecasting

#### All RQL Transforms

Use the link below to explore the library of pre-defined transforms, or use them as a starting point to create your own.

* [All Transforms](../transforms/all-transforms/)

Properties

<details>

<summary>arguments</summary>

dict: a dictionary of arguments passed to the transforms that will populate the jinja template

</details>

<details>

<summary>fqtn</summary>

str: (fully-qualified table name) The name of the table or view this transform will create in the DataWarehouse if saved in current state. Similar to output\_alias, but with a namespace attached.

_Convenience property constructed from namespace + output\_alias_

</details>

<details>

<summary>output_alias</summary>

str: The unqualified name of the table or view this transform will create in the DataWarehouse if saved in current state

</details>

<details>

<summary>running_sql</summary>

str: The SQL statement produced by all transforms before this one in a SQL Chain.

_Tracked to help parse transforms that need a materialized input. Not relevant for most transforms._&#x20;

</details>

<details>

<summary>source_table</summary>

str: The input\_table this transform will be applied to

_Convenience property parsed from arguments_

</details>

Methods:

<details>

<summary>sql()</summary>

Returns the SQL statement this transform creates

</details>

