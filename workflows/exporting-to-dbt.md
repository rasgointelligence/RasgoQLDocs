# Exporting to dbt

One of the primary benefits of rasgoql is the ability to instantly export your SQLChain to a prod-ready dbt model.

### Export SQL as a dbt Model

RasgoQL allows you to export any SQLChain as a dbt model file.

To create the file, run .to\_dbt() from a SQLChain.

```
chn.to_dbt(project_directory='users/me/dbt/')
```

This will command will:&#x20;

1. Search for the `project_directory` path on your machine and create it if it does not already exist.
2. Create a `dbt_project.yml` file in the project directory if it does not already exist. If the file already exists, rasgoql will not overwrite or edit it.
3. Search for the `models_directory` path on your machine and create it if it does not already exist.
4. Create a `<model_name>.sql` file in the models directory, where `<model_name>` is the `output_alias` of your SQLChain. If a file with this name already exists in this directory it will be overwritten.

**Parameters**

The `.to_dbt()` function requires a `project_directory` parameter. All other parameters are optional.

**project\_directory**: str: This should be an absolute filepath on your machine, where you want the dbt\_project.yml file and other top-level folders to be written.

**model\_directory**: str: Optional - Absolute filepath on your machine, where you want model.sql files to be written. If no value is passed, the path _project\_directory/models_ will be used.

**project\_name**: str: Optional - A name for your dbt project. This value should not be passed if you have an existing dbt project and are just printing models to it. It can be passed if you are creating a project from scratch. If no value is passed, the default project name "rasgoql" will be used.

Per dbt: _"Project names should contain only lowercase characters and underscores. A good package name should reflect your organization's name or the intended use of these models."_

**materialize\_method**: str: Optional - The dbt materialize method you want to use for this model. _Supported values are: "table" or "view"_

{% hint style="info" %}
The dbt\_project.yml file that is printed will use default values. You may want to change them before performing `dbt run`.

For example, you will want to swap out the "profile" value of "default" for your actual connection profile.
{% endhint %}
