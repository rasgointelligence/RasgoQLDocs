

# pivot

Transpose unique values in a single column to generate multiple columns, aggregating as needed. The pivot will dynamically generate a column per unique value, or you can pass a list_of_vals with the unique values you wish to create columns for.

## Parameters

|     Name     |    Type     |                                                         Description                                                         | Is Optional |
| ------------ | ----------- | --------------------------------------------------------------------------------------------------------------------------- | ----------- |
| dimensions   | column_list | dimension columns after the pivot runs                                                                                      |             |
| pivot_column | column      | column to pivot and aggregate                                                                                               |             |
| value_column | column      | column with row values that will become columns                                                                             |             |
| agg_method   | agg         | method of aggregation (i.e. sum, avg, min, max, etc.)                                                                       |             |
| list_of_vals | string_list | optional argument to override the dynamic lookup of all values in the value_column and only pivot a provided list of values | True        |


## Example

Pull a source Dataset and preview it:

```python
ds = rasgo.get.dataset(id)
print(ds.preview())
```

|    | DATE       | SYMBOL   |   CLOSE |
|---:|:-----------|:---------|--------:|
|  0 | 1990-09-26 | APA      |  4.8797 |
|  1 | 1990-08-06 | APA      |  4.3312 |
|  2 | 1990-06-12 | APA      |  3.8123 |
|  3 | 2007-10-19 | XRX      | 36.0728 |
|  4 | 2007-08-20 | XRX      | 34.4498 |
|  5 | 2007-07-10 | XRX      | 42.5646 |
|  6 | 2007-03-07 | XRX      | 36.3541 |
|  7 | 2007-03-01 | XRX      | 37.1547 |
|  8 | 2007-01-04 | XRX      | 36.5489 |
|  9 | 2006-07-13 | XRX      | 29.7325 |


Transform the Dataset and preview the result:

```python
ds2 = ds.pivot(
  dimensions=['DATE'],
  pivot_column='CLOSE',
  value_column='SYMBOL',
  agg_method='AVG',
  list_of_vals=['JP','GOOG','DIS','APLE']
)
ds2.preview()

```

|    | DATE       |      JP |     GOOG |      DIS |    APLE |
|---:|:-----------|--------:|---------:|---------:|--------:|
|  0 | 2013-07-26 |         |  441.022 |  59.0729 |         |
|  1 | 2017-11-21 | 19.7923 | 1034.49  |  99.3686 | 16.48   |
|  2 | 2006-11-17 |         |  248.464 |  27.0257 |         |
|  3 | 2005-09-12 |         |  154.292 |  20.39   |         |
|  4 | 1999-07-01 |         |          |  22.1751 |         |
|  5 | 1998-02-03 |         |          |  27.3093 |         |
|  6 | 1996-04-22 |         |          |  15.2845 |         |
|  7 | 2017-07-25 |  7.221  |  950.7   | 102.668  | 15.0863 |
|  8 | 2006-12-08 |         |  241.151 |  28.2154 |         |
|  9 | 2016-12-12 |  8.1188 |  789.27  |  99.65   | 15.739  |


## Source Code

{% embed url="https://github.com/rasgointelligence/RasgoTransforms/blob/main/rasgotransforms/rasgotransforms/transforms/pivot/pivot.sql" %}

