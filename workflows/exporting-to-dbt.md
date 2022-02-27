# Exporting to dbt

One of the primary benefits of RasgoQL is the ability to instantly export your SQLChain to a prod-ready dbt model.

### Export SQL as a dbt Model

RasgoQL allows you to export any SQLChain as a dbt model file.

To create the file, run `.to_dbt()` from a SQLChain (where `output_directory` is an absolute path to your dbt /models folder).

```python
output_directory = 'Users/me/dbt/models'
chn.to_dbt(output_directory)
```

This will command will:

1. Search for the `output_directory` path on your machine and raise an error if it does not exist.
2. Create a `<model_name>.sql` file in the directory, where `<model_name>` is the `output_alias` of your SQLChain. If a file with this name already exists in this directory it will be overwritten.
3. Create a schema.yml file in the directory (if the `include_schema` param is passed as `True`). If a schema.yml file already exists, it will be appended.

**Parameters**

The `.to_dbt()` function requires an `output_directory` parameter. All other parameters are optional.

**output\_directory**: str: This should be an absolute filepath on your machine, where you want the model file to be written.

**file\_name**: str: Optional - Name for the model .sql file. Defaults to `{output_alias}.sql` of SQLChain

**include\_schema**: bool: Optional - Instructs whether to include a schema.yml file

**config\_args**: dict: Optional - key value pair of dbt [config values](https://docs.getdbt.com/reference/model-configs) to add to the .sql and/or schema.yml file
