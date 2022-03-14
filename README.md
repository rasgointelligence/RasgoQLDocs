# 💡 What is RasgoQL?

**RasgoQL** is an [open source package](https://github.com/rasgointelligence/RasgoQL) to help you write python, but execute SQL against your data warehouse. Currently, and [hand-full of data warehouses](https://docs.rasgoql.com/datawarehouses) but we are rapidly working on adding support for more. \
\
We're still relatively new and want to hear from you. [We have a dedicated RasgoQL slack channel that you can join](https://join.slack.com/t/rasgousergroup/shared\_invite/zt-nytkq6np-ANEJvbUSbT2Gkvc8JICp3g). No need to knock, just let us know if there is a burning question on your mind or anything else you want to discuss.

![](.gitbook/assets/rasgoql\_visual.png)

### Why?

We built RasgoQL because we've seen too many data scientists and data analysts write pandas code to do something quickly, but then be stuck supporting and manually running that code 6 months later. Using pandas syntax to create SQL means you unlock the advantages of working in a data warehouse, such as:

* **scheduling** - running your code on a schedule
* **scalability** - running on larger data sets in the warehouse rather than extracting data to a dataframe
* **collaboration** - sharing your queries so others can run them or see the output

### OK, How Do I Use It?

Awesome, let's get started.

1. Install RasgoQL by running `pip install rasgoql[snowflake]` &#x20;
2. Connect to your data warehouse using[ local credentials](workflows/connecting-to-a-datawarehouse.md)
3. Start [building some queries](workflows/creating-sql-chains.md) via python

