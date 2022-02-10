# Exporting SQL

RasgoQL allows users to export the SQL chains they create for use in other tools.

Popular options are to run the SQL directly in your DataWarehouse or to export workflows to DBT.

### Export SQL as string

Exporting the SQL you've created in a chain is as simple as running the .sql() method on a SQLchain object. This will print the SQL as a SELECT statement using CTEs.

```
chn.sql()
```

These options are also available to render the SQL:

SELECT using CTEs

```
# NOTE: This is the default option
# This is redundant to chn.sql()
chn.sql(render_method='SELECT')
```

CREATE VIEW using CTEs

```
chn.sql(render_method='VIEW')
```

CREATE TABLE using CTEs

```
chn.sql(render_method='TABLE')
```

CREATE VIEWS using a chain of standalone views

```
chn.sql(render_method='VIEWS')
```

### Export to DBT

coming soon...
