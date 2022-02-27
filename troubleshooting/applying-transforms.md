# Applying Transforms

### Common Error Messages

**TableAccessError**: You do not have access to operate on this object.

This error message indicates that you do not have the required permissions to access a SQL object. This is most commonly caused by one of two scenarios:

1. The table already exists and your user does not have access to over-write/read it
2. Your user does not have access to write/read in this namespace

Steps to troubleshoot:

1. Traverse the stack trace for details on which object you cannot access
   1. If it is a namespace write issue: run `SQLChain.change_namespace()` to a namespace you can write to
   2. If it is an access issue: sign in with different credentials or ask your Admin access to this table



**SQLChain Warning**: Unexpected error generating the schema of this SQLChain. Your model.sql file will be generated without a schema.yml file. This is most likely a syntax issue in your SQLChain or existing view. Consider running your\_chn.sql() to check the syntax and/or your\_chn.save() to update the view definition in your Data Warehouse.

This error message indicates that there is an error in your SQL syntax. Errors can occur silently when applying transforms with python-correct, but SQL-incorrect arguments. When running commands like `to_dbt()` or `.save()` the are raise by your Data Warhouse.

Steps to troubleshoot:

1. run `SQLChain.sql()` to print the SQL
2. Check the SQL for syntax errors
3. When the error is spotted, change your input arguments in the transform function that is responsible for the error



**SQLWarning**: It looks like your SQL statement contains a potentially dangerous or data-altering operation.

This error message indicates that you are running a SQL statement with a restricted SQL keyword (e.g. DROP, TRUNCATE, ALTER)

Steps to troubleshoot:

1. Check the SQL being run. If you do not see the SQL in the stack trace, set `rasgoql.set_verbose(True)` and run again to see the SQL statement printed.
2. If the SQL is unintended, give Rasgo a star on github for the catching your error and change it.
3. If the SQL is intended, pass in `acknowledge_risk=True` and run the statement again to clear the error



**DWQueryError**: various

Any error message wrapped in the DWQueryError indicates a SQL syntax error. Read the error message for details on how to troubleshoot.



