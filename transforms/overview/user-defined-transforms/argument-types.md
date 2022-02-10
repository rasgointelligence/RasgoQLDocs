# Argument Types

Rasgo transforms use `type` within the `arguments` specification in each transform's YAML configuration file to trigger a user-friendly input in the UI.

Here's a master list of the argument types that Rasgo supports:\


| argument type       | description                                                                       | values                                           |
| ------------------- | --------------------------------------------------------------------------------- | ------------------------------------------------ |
| column              | a single column selector                                                          |                                                  |
| column\_list        | a selector for multiple columns                                                   |                                                  |
| value               | a string or number                                                                |                                                  |
| value\_list         | a list of strings or numbers                                                      |                                                  |
| mixed\_value        | a string, number, or column name                                                  |                                                  |
| mixed\_list         | a list of strings, numbers, or column names                                       |                                                  |
| boolean             | a binary value                                                                    | \[TRUE, FALSE]                                   |
| agg                 | aggregation method                                                                | \[SUM, MIN, MAX, COUNT, MODE, AVG, MEDIAN]       |
| date\_part          | a date part of a datetime value                                                   | \[DAY, HOUR, MINUTE, WEEK, MONTH, YEAR, QUARTER] |
| column\_value\_dict | a dictionary where a string value is provided for each column selected            |                                                  |
| agg\_dict           | a dictionary where one or more aggregations are provided for each column selected |                                                  |
|                     |                                                                                   |                                                  |
