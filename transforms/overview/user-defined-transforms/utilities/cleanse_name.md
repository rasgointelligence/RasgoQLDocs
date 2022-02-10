# cleanse\_name()

Utility to make a string SQL safe so that it can be used as an alias for a new column.

Takes the following actions on a string:

1. remove double quotes
2. replace spaces and dashes with underscores
3. cast to upper case
4. delete anything that is not letters, numbers, or underscores
5. if first character is a number, add an underscore to the beginning

## Parameters

| Type   | Description                                                                   |
| ------ | ----------------------------------------------------------------------------- |
| string | text to make SQL safe; works on column names, table names, row values, etc... |

## Example

```sql
SELECT *
{%- for math_op in math_ops %}
    , {{math_op}} as {{cleanse_name(math_op)}}
{%- endfor %}

FROM {{source_table}}
```
