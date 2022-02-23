# Handling Credentials

We created RasgoQL as a tool to simplify workflows for Data Analyst, Engineer and Scientist. In doing so, we set our sights on one of the peskier parts of working in python: storing secret credentials. This page will give our perspective on best practices and demonstrate how to use RasgoQL to adhere to them.

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

Dynamic credentials refers to defining your secret cred values on the fly in your notebook. The example above shows how to use dynamic credentials.

RasgoQL supports connecting with dynamic credentials for fast local development and easy onboarding.

{% hint style="danger" %}
It should be considered best practice to **not** store credentials directly in a shared notebook or git repo.
{% endhint %}

