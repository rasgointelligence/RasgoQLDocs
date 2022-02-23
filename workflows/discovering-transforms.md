# Discovering Transforms

One benefit of using RasgoQL is having an ever-expanding library of transforms available to apply to your dataset.

[Transforms](../primitives/transform.md) are functions you can apply to your dataset using a pandas-like syntax. Transforms compile to SQL that runs against your Data Warehouse. It may feel like you're working with a dataframe, but all processing is being pushed to the cloud.

#### Listing Transforms in rasgoql

To quickly list all available transforms, run:

```python
transforms = rql.list_transforms()
print(transforms)
```

output:

```python
[RasgoTemplate: one_hot_encode(column: column),
 RasgoTemplate: datetrunc(dates: datepart_dict),
 RasgoTemplate: datepart(dates: datepart_dict),
 RasgoTemplate: concat(concat_list: mixed_list, name: value),
 RasgoTemplate: dateadd(date_part: date_part, date: mixed_value, offset: int),
 RasgoTemplate: train_test_split(order_by: column_list, train_percent: int),
 RasgoTemplate: standard_scaler(columns_to_scale: column_list, averages: value_list, standarddevs: int_list),
 ...
```

This function returns a list of TransformTemplate objects.

```python
for t in transforms:
    print(t.define())
```

output:

```
Column Transform: datetrunc
Description: Truncates a date to the datepart you specify. For example, if you truncate the date '10-31-2022' to the 'month', you would get '10-1-2022'.

For a list of valid dateparts, refer to [Supported Date and Time Parts](https://docs.snowflake.com/en/sql-reference/functions-date-time.html#label-supported-date-time-parts)

Arguments: [{'name': 'dates', 'type': 'datepart_dict', 'description': 'dict where the keys are names of column(s) you want to datetrunc and the values are the desired date grain'}]
SourceCode: SELECT *,
{% raw %}
{%- for target_col, date_part in dates.items() %}
  DATE_TRUNC({{target_col}}, {{date_part}}) as {{target_col}}_{{date_part}} {{ ", " if not loop.last else "" }}
{%- endfor %}
FROM {{ source_table }}
      ) as {{ cleanse_name(agg + '_' + col + '_' + offset|string) }}
    {%- endfor -%}
  {%- endfor -%}
{%- endfor %}
{% endraw %}
FROM {{ source_table }}
```

#### Defining a Transform by name

To learn more about a specific transform, run:

```python
rql.define_transforms(name="impute")
```

This will print a long description of the transform, the arguments it accepts, the jinja SQL template it will apply, and an example of how to use it.

```
Column Transform: impute
Description: Impute missing values in column/columns with the mean, median, mode, or a value
Arguments: [{'name': 'imputations', 'type': 'imputation_dict', 'description': "Dictionary with keys as column names to impute missing values for, and dictionary values the type of imputation stratgey ('mean', 'median', 'mode', <value>)"}, {'name': 'flag_missing_vals', 'type': 'boolean', 'description': "If True/set will create a new column for every one imputing that has 1 if column in the impuation dict was NULL, 0 if it wasn't. This columns will be named like '<col_name>_missing_flag'.", 'is_optional': True}]
SourceCode: {#
Jinja Macro to generate a query that would get all 
the columns in a table by fqtn
#}
{% raw %}
{%- macro get_source_col_names(source_table_fqtn) -%}
    select * from {{ source_table_fqtn }} limit 0
{%- endmacro -%}

{# 
Macro to return the imputation query 
for a specified imputation col 

If strategy is not mean, median, or mode
make query to fill with supplied scalar value
else it will perform that impuattion stagety on column
#}
{%- macro get_impute_query(col, imputation) -%}
    {%- set impute_expression = '' -%}
    {%- set imputation_strategy = '' -%}
    {%- if imputation | lower in  ['mean', 'median', 'mode'] -%}
        {%- set imputation = 'AVG' if imputation == 'mean' else imputation -%}
        {%- set imputation_strategy = imputation | upper -%}
    {%- else %}
    {{ col }}{{ ',' if not loop.last else ''}}
    {%- endif -%}
{%- endfor %}
{% endraw %}
FROM {{source_table}}
```

#### Exploring Transforms in the GitHub Repo

Rasgo serves our transforms via an open-source python package `rasgotransforms`.&#x20;

The transform source code is available on github: [https://github.com/rasgointelligence/RasgoTransforms](https://github.com/rasgointelligence/RasgoTransforms)

The Rasgo team is committed to creating new transforms as a service to the data community. We are very open to community additions to the transforms library. Please consider submitting PRs or issues for transforms you would like to see added to the package.

{% hint style="info" %}
The `rasgotransforms` package is a dependency of `rasgoql`.

Since the `rasgotransforms` package updates so frequently, it is best practice to run `pip install rasgotransforms --upgrade` each time you run rasgoql to ensure you have the most recent additions.
{% endhint %}

