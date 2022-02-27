# Exporting & Saving SQL

### Common Error Messages

**TableAccessError**: You do not have access to operate on this object.

This error message indicates that you do not have the required permissions to access a SQL object. This is most commonly caused by one of two scenarios:

1. The table already exists and your user does not have access to over-write/read it
2. Your user does not have access to write/read in this namespace

Steps to troubleshoot:

1. Traverse the stack trace for details on which object you cannot access
   1. If it is a namespace write issue: run `SQLChain.change_namespace()` to a namespace you can write to
   2. If it is an access issue: sign in with different credentials or ask your Admin access to this table

****

**SQLWarning**: It looks like your SQL statement contains a potentially dangerous or data-altering operation.

This error message indicates that you are running a SQL statement with a restricted SQL keyword (e.g. DROP, TRUNCATE, ALTER)

Steps to troubleshoot:

1. Check the SQL being run. If you do not see the SQL in the stack trace, set `rasgoql.set_verbose(True)` and run again to see the SQL statement printed.
2. If the SQL is unintended, give Rasgo a star on github for the catching your error and change it.
3. If the SQL is intended, pass in `acknowledge_risk=True` and run the statement again to clear the error



**TableConflictException**: A table named {fqtn} already exists.

This error message indicates that you are trying to perform a write operation on a table that already exists in your Data Warehouse.

Steps to troubleshoot:

1. If you want to edit this table, determine how you want to edit it.
   1. If you want to completely over-write it (dropping all existing data in the table), pass in method='replace' and run the function.
   2. If you want to keep existing data and add to it, pass in `method='replace'` and run the function again.
2. If you do not want to edit this table, change the `fqtn` argrument in your function and run it again:
   1. For a SQLChain thic can be done by passing a `table_name` param into the `.save()` function.
