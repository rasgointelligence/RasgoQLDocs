# Post-Connection

Available after running `rasgoql.connect()`

Example:

```
import rasgoql
creds = rasgoql.SnowflakeCredentials.from_env()
rql = rasgoql.connect(creds)

rql.list_tables()
```
