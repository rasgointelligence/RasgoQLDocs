---
description: Represents a RasgoQL Transform applied to a SQL Chain
---

# Transform

The Transform is the blah blah ...

Transforms can only be rendered as part of a SQL Chain.



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

