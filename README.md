# 💡 What is RasgoQL?

**RasgoQL** is an [open source package](https://github.com/rasgointelligence/RasgoQL) to help you write python, but execute SQL against your data warehouse. Currently, [we only support Snowflake](datawarehouses/), but we are rapidly adding support for other data warehouses.&#x20;

![](.gitbook/assets/rasgoql\_visual.png)

### Why?

We built RasgoQL because we've seen too many data scientists and data analysts write pandas code to do something quickly, but then be stuck supporting and manually running that code 6 months later. Using pandas syntax to create SQL means you unlock the advantages of working in a data warehouse, such as:

* **scheduling** - running your code on a schedule
* **scalability** - running on larger data sets in the warehouse rather than extracting data to a dataframe
* **collaboration** - sharing your queries so others can run them or see the output

### OK, How Do I Use It?

Awesome, let's get started.

1. Install RasgoQL by running `pip install rasgoql` &#x20;
2. Connect to your data warehouse using[ local credentials](workflows/connecting-to-a-datawarehouse.md)
3. Start [building some queries](workflows/creating-sql-chains.md) via python

