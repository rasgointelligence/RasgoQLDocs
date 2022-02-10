# Make your own Transform



{% hint style="info" %}
Rasgo uses the [Jinja2 templating engine](https://jinja.palletsprojects.com/en/3.0.x/templates/) and SQL in transform templates.
{% endhint %}

### 1. Create your own Transform template

```django
template = """
SELECT {{ group_by | join(', ') }},
listagg({{ 'distinct ' if distinct else ''}} {{agg_column}}, '{{sep}}')
WITHIN group (order by {{agg_column}} {{order}}) as {{agg_column}}_listagg
FROM {{ source_table }}
GROUP BY {{ group_by | join(', ') }}
"""
```

{% hint style="info" %}
{{ source\_table }} is a required argument in every template, and Rasgo's API will always compile it to the fully-qualified table name (FQTN) of the dataset that the transform is called on.
{% endhint %}

### 2. Publish your Transform template

```python
# Create a new user-defined transform
new_transform = rasgo.create.transform(name="aggregate_string",
                                       source_code=template)
```

