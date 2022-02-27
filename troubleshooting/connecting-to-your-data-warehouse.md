# Connecting to your Data Warehouse

### Common Error Messages

**DWConnectionError**: \[BigQuery|Snowflake] is unavailable.

This error message indicates that the cloud provider is unavailable. It often a sign that you have intermittenly lost an internet connection or that the provider is experiencing an outage.

Steps to troubleshoot:

1. Confirm that your credentials are correct
2. Confirm you have internet access
3. Confirm that http connections to this service are whitelisted in your environment
4. Check the status page of the cloud providers for outage information:
   1. [https://status.cloud.google.com/incident/bigquery](https://status.cloud.google.com/incident/bigquery)
   2. [https://status.snowflake.com/](https://status.snowflake.com)



**DWConnectionError**: various

Any error message wrapped in a DWConnectionError indicates that the cloud provider is rejecting your login credentials.

Read the message text for more details to troubleshoot. Often the user or password is misspelled or not being read correctly from your env variables.
