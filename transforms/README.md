# RasgoQL Transforms
### Overview

RasgoQL Transforms are the best way to create features out of data. This open library of templatized SQL functions enable you to quickly manipulate large amounts of abstract table data into insightful features directly in your data warehouse. 

Transforms can be as simple or complex as you want them to be. You can use them to quickly join two tables togather with a single line of Python, or thay can be more advanced, such as a chain of aggregations across millions of rows. Either way, all the complex SQL logic is executed/generated for you. Also, RasgoQL only needs basic metadata to execute transforms, so your private data remains secure and in the warehouse. 


A few of the most common use cases for RasgoQL transforms are:
* Filtering and truncating time-series data
* Joining multiple tables into a single dataset
* Imputing, pivoting, and binning data
* Aggregating and lagging data for forecasting


### Transform Categories
All of the transforms provided by RasgoQL fall into one of three categories. Use the links below to explore the library of pre-defined transforms, or use them as a starting point to create your own. 

* [Column Transforms](/transforms/column-transforms)
* [Row Transforms](/transforms/row-transforms)
* [Table Transforms](/transforms/table-transforms)


<! -- TODO: We need a section guiding users on the best way to write their customize transforms -->