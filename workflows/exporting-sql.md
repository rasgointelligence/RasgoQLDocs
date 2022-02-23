# Exporting SQL

RasgoQL allows users to export the SQLChains they create for use in other tools.

Popular options are to run the SQL directly in your DataWarehouse or to export workflows to DBT.

### Printing SQL as strings

Printing the SQL you've created in a chain is as simple as running the .sql() method on a SQLchain object. This will print the SQL as a SELECT statement using CTEs.

```python
chn.sql()
```

These options are also available to render the SQL:

SELECT using CTEs

```python
# NOTE: This is the default option
# This is redundant to chn.sql()
chn.sql(render_method='SELECT')
```

CREATE VIEW using CTEs

```python
chn.sql(render_method='VIEW')
```

CREATE TABLE using CTEs

```python
chn.sql(render_method='TABLE')
```

CREATE VIEWS using a chain of standalone views

```python
chn.sql(render_method='VIEWS')
```
