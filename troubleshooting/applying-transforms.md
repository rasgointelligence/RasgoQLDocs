# Applying Transforms

### Common Error Messages

**TableAccessError**: You do not have access to operate on this object. Two possible ways to resolve: Connect with different credentials that have the proper access. Or run `.change_namespace` on your SQLChain to write it to a namespace your credentials can access.



**SQLChain Warning**: Unexpected error generating the schema of this SQLChain. Your model.sql file will be generated without a schema.yml file. This is most likely a syntax issue in your SQLChain or existing view. Consider running your\_chn.sql() to check the syntax and/or your\_chn.save() to update the view definition in your Data Warehouse.



**SQLWarning**: It looks like your SQL statement contains a potentially dangerous or data-altering operation. If you are positive you want to run this, pass in acknowledge\_risk=True and run this function again.



**DWQueryError**: various





