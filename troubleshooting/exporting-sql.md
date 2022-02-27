# Exporting & Saving SQL

### Common Error Messages

**TableAccessError**: You do not have access to operate on this object. Two possible ways to resolve: Connect with different credentials that have the proper access. Or run `.change_namespace` on your SQLChain to write it to a namespace your credentials can access.



**SQLWarning**: It looks like your SQL statement contains a potentially dangerous or data-altering operation. If you are positive you want to run this, pass in acknowledge\_risk=True and run this function again.



**TableConflictException**: A table named {fqtn} already exists. If you are sure you want to write over it, pass in method='append' or method='replace' and run this function again.

