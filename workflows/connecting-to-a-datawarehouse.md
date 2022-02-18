# Connecting to a DataWarehouse

RasgoQL is built to run on your existing DataWarehouse. The benefits of this design are:

* data never leaves your secure environment
* all processing happens remotely in the cloud, allowing users to interact with massive datasets on laptops and VMs
* permissions are handled by your existing data access policy

For this reason, RasgoQL will need to establish a connection to your DataWarehouse each time it runs. Making this connection is a simple process.

### Creating Credentials

Each DataWarehouse (DW) requires a unique set of credentials to connect. RasgoQL provides helper classes to define the credentials needed for your specific DW:

{% tabs %}
{% tab title="Snowflake" %}
```
rasgoql.SnowflakeCredentials()
```
{% endtab %}

{% tab title="BigQuery" %}
```
rasgoql.BigQueryCredentials()
```
{% endtab %}
{% endtabs %}

Credentials can be dynamically created in each session or saved to a file for future sessions.

#### Creating Dynamic Credentials

To create credentials dynamically, populate the helper class with required parameters:

```python
creds = rasgoql.SnowflakeCredentials(
  account='',
  user='',
  password='',
  role='',
  database='',
  schema='',
  warehouse=''
)
```

Then, pass the credentials into the RasgoQL connect() method:

```
rql = rasgoql.connect(creds)
```

#### &#x20;Saving Credentials to a File

To save your credentials to a .env file, populate the helper class with required parameters:

{% tabs %}
{% tab title="Snowflake" %}
```
creds = rasgoql.SnowflakeCredentials(
  account='',
  user='',
  password='',
  role='',
  database='',
  schema='',
  warehouse=''
)
```
{% endtab %}

{% tab title="BigQuery" %}
```
creds = rasgoql.BigQueryCredentials(
  secret_type='',
  secret_filepath='',
  project='',
  dataset=''
)
```
{% endtab %}
{% endtabs %}

Export them to a file using the \`.to\_env()\` method:

```
creds.to_env(file_path='/.')
```

In future sessions, load the credentials from your .env file without re-typing them, then Connect to RasgoQL:

```
creds = rasgoql.SnowflakeCredentials.from_env(file_path='./.')
rql = rasgoql.connect(creds)
```

More details on connecting to your Data Warehouse can be found on the [Data Warehouses](../datawarehouses/) page.&#x20;
