---
description: Represents a RasgoQL Transform Template
---

# TransformTemplate

The TransformTemplate is the blah blah ...



Properties

<details>

<summary>name</summary>

str: a common name used to uniquely identify the transform

</details>

<details>

<summary>arguments</summary>

list of dict: a list of input parameters the transform requires or optionally accepts

</details>

<details>

<summary>source_code</summary>

str: a Jinja template representing the SQL statement that will be applied

</details>

<details>

<summary>transform_type</summary>

str: type of transform. Represents the output structure of the transforms

Values: \[COLUMN, ROW, TABLE]

</details>

<details>

<summary>description</summary>

str: a (not very) brief, (not very) clear explanation of what the transforms does&#x20;

</details>

Methods:

<details>

<summary>define()</summary>

Returns a single lengthy string of all the class properties

</details>

