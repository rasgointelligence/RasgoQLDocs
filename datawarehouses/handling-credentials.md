# Handling Credentials

We created RasgoQL as a tool to simplify workflows for Data Analysts, Engineers and Scientists. In doing so, we set our sights on one of the peskier parts of working in python: storing secret credentials. This page will give our perspective on best practices and demonstrate how to use RasgoQL to adhere to them.

If the first cell in your notebook always looks like this, please read on!

```
import rasgoql

creds = rasgoql.SnowflakeCredentials(
    user=griff,
    password='theregoesmydata:('
)
rql = rasgoql.connect(creds)
```

#### Dynamic Credentials

Dynamic credentials refers to defining your secret values on the fly in your notebook. The example above shows how to use dynamic credentials.

RasgoQL supports connecting with dynamic credentials for fast local development and easy on-boarding.

After connecting for the first time, it is a much better idea to store your credentials in a private .env or yaml file and reference it for all future connections.

{% hint style="danger" %}
It should be considered best practice to **not** store credentials directly in a shared notebook or git repo.
{% endhint %}

#### Saving a .env file

The alternative to setting credentials dynamically is saving them to a .env file for future reference.

A .env file is stored on your local machine and holds environment variables that can be set on your os and used by any application with access to your os. Here is an example file:

```
AWS_ACCESS_KEY_ID="..."
AWS_SECRET_ACCESS_KEY="..."
AWS_DEFAULT_REGION=us-west-2""
```

To save you RasgoQL credentials to an .env file, run:

```
filepath = 'Users/griff/code'
rasgoql.SnowflakeCredentials(
    user=griff,
    password='MUCHsafer!'
).to_env(filepath)
```

This will look for a file named .env at the filepath you provided. If no .env file is found, it will create one and write your RasgoQL credential values to it. If a .env file already exists at that location, it will update only the RasgoQL credential values (and add any missing values).

#### Connecting using .env

After RasgoQL credentials exist in your .env file, you can connect using the method below, which is much more secure for shared notebooks:

```
creds = rasgoql.SnowflakeCredentials.from_env()
rql = rasgoql.connect(creds)
```
